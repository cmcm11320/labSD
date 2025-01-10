// codigo do trabalho de lsd
// o codigo descreve o comportamento de um onibus em arduino
// possui farol (led) volante e buzina (joystick) sensor da catraca(ldr), catraca (servo1), portas(servo2), botoes (botao portas, botao farois, botao pedir pra parar, botao desligar pedir pra parar)
// possui funcionamento de farois (o que inclui setas ao virar o volante)


#include <Servo.h> // Inclui a biblioteca Servo para controlar servos
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

//volante begin
//volante possui direção e buzina

#define VRX_PIN  A0 // Joystick eixo X
#define VRY_PIN  A1 // Joystick eixo Y
#define buzina_button 12

int value_X = 0; // The variable to store value of the X axis
int value_Y = 0; // The variable to store value of the Y axis
int buzina_buttonState = 0;
const int buzina = 11;

//volante end


// catraca begin
//a catraca possui, catraca (servo) e sensor de luminosidade para liberar ela
int ldr = A6;//Atribui A6 a variável ldr
int valorldr = 0;//Declara a variável valorldr como inteiro
Servo Catraca; // Cria um objeto Servo para controlar o servo motor
int pos_catraca; // Declara uma variável para controlar a posição do servo motor 
//catraca end

//portas begin
// portas são abertas simultaneamente de acordo com botão
Servo Portas; // Cria um objeto Servo para controlar o servo motor
int pos_portas; // Declara uma variável para controlar a posição do servo motor 
int button_portas = 8;
int button_portasState = 0;
int i =0;
//portas end


//farois begin
// farois sao controlados a partir do volante
int farol_DF = 3;
int farol_EF = 4;
int farol_DT = 5;
int farol_ET = 6;
int delay_seta = 200;
int delay_re = 300;
int seta_esquerda = 0;
int re = 0;
int seta_direita = 0;
int previousMillis_re, previousMillis_seta = 0;


//farois end

// aviso parada begin

int LED_parada = 10;
int Button_parada = 9;
int Button_paradaState = 0;

// aviso parada end

//lcd begin
byte error, address;
int nDevices = 0;
#define col 16 // Serve para definir o numero de colunas do display utilizado
#define lin  2 // Serve para definir o numero de linhas do display utilizado
#define ende  0x3F 
LiquidCrystal_I2C lcd(ende,col,lin);

unsigned long previousMillis = 0;
const long interval = 4000;
int iteracao = 100;
int end = 0;
//lcd end

 
void setup() {
  
  //int serial
  Serial.begin(9600);  
  
  //lcd
  lcd.init(); // Serve para iniciar a comunicação com o display já conectado
  lcd.backlight(); // Serve para ligar a luz do display
  lcd.clear(); // Serve para limpar a tela do display

  //volante
  pinMode(buzina_button,INPUT_PULLUP); // definido como pullup pq so assim funcionou

  //Catraca
  pinMode(ldr, INPUT);//Define ldr (pino analógico A0) como saída
  Catraca.attach(2); // Associa o servo motor ao pino digital 2 do Arduino
  Catraca.write(0); // Define a posição inicial do servo motor para 0 graus

  //Portas
  Portas.attach(7); // Associa o servo motor ao pino digital 7 do Arduino
  Portas.write(0); // Define a posição inicial do servo motor para 0 graus
  pinMode(button_portas,INPUT_PULLUP); // definido como pullup pq so assim funcionou

  //farois
  pinMode(farol_DF, OUTPUT);
  pinMode(farol_EF, OUTPUT);
  pinMode(farol_DT, OUTPUT);
  pinMode(farol_ET, OUTPUT);

  // aviso parada
  pinMode(Button_parada,INPUT_PULLUP); // definido como pullup pq so assim funcionou
  pinMode(LED_parada, OUTPUT);
}
 
void loop() {

  //time setup
  unsigned long currentMillis = millis();


  //read inputs
  buzina_buttonState = digitalRead(buzina_button);
  button_portasState = digitalRead(button_portas);
  Button_paradaState = digitalRead(Button_parada);

  value_X = analogRead(VRX_PIN);
  value_Y = analogRead(VRY_PIN);

  valorldr=analogRead(ldr);//Lê o valor do sensor ldr e armazena na variável valorldr

  //print inputs
  // Serial.print("Valor lido pelo LDR = ");//Imprime na serial a mensagem Valor lido pelo LDR
  // Serial.println(valorldr);//Imprime na serial os dados de valorldr

  // Serial.print("x = ");
  // Serial.print(value_X);
  // Serial.print(", y = ");
  // Serial.println(value_Y);

  // Serial.print(", buzina = ");
  // Serial.println(buzina_buttonState);

  // Serial.print("portas = ");
  // Serial.println(button_portasState);

  // Serial.print("i = ");
  // Serial.println(i);

  //delay(200);

  


  //buzina volante code begin
  if (buzina_buttonState == 0){
    
    tone(buzina, 200);
    //delay(50);
  } else{
      noTone(buzina);

    }
   //buzina volante code end


   //catraca code begin

 if (valorldr <=60 && valorldr >=10 ){
// Movimento do servo de 0 a 90 graus
    for (pos_catraca = 0; pos_catraca < 90; pos_catraca++) {
        Catraca.write(pos_catraca); // Define a posição atual do servo
        delay(15); // Aguarda 15 milissegundos antes de mover para a próxima posição
    }
    //delay(2000); // Aguarda 1 segundo antes de iniciar o próximo movimento
 
    //Movimento do servo de 90 a 0 graus
    for (pos_catraca = 90; pos_catraca >= 0; pos_catraca--) {
        Catraca.write(pos_catraca); // Define a posição atual do servo
        delay(15); // Aguarda 15 milissegundos antes de mover para a próxima posição
    }
    //delay(1000); // Aguarda 1 segundo antes de iniciar o próximo ciclo

 }

 //catraca code end

 //farois code begin

  if (value_X >= 1000){ //seta para a direita
    if (seta_direita == 0) {
      digitalWrite(farol_DF, HIGH);
      digitalWrite(farol_DT, HIGH);
      tone(buzina, 1000);
    
      previousMillis_seta += iteracao;
    
      if(delay_seta == previousMillis_seta){
        seta_direita = 1;
      }
    }else{
      digitalWrite(farol_DF, LOW);
      digitalWrite(farol_DT, LOW);
      noTone(buzina);
      previousMillis_seta -= iteracao;
      if(previousMillis_seta == 0){
        seta_direita = 0;
      
      }
    } 
  }

  if (value_X <= 400){ //seta para a esquerda
    if (seta_esquerda == 0) {
      digitalWrite(farol_EF, HIGH);
      digitalWrite(farol_ET, HIGH);
      tone(buzina, 1000);
    
      previousMillis_seta += iteracao;
    
      if(delay_seta == previousMillis_seta){
      seta_esquerda = 1;
      }
    }else{
      digitalWrite(farol_EF, LOW);
      digitalWrite(farol_ET, LOW);
      noTone(buzina);
      previousMillis_seta -= iteracao;
      if(previousMillis_seta == 0){
      seta_esquerda = 0;
      
      }
    }
  }

   if (value_Y <= 400){ //dando ré]
    if (re == 0) {
      digitalWrite(farol_ET, HIGH);
      digitalWrite(farol_DT, HIGH);
      tone(buzina, 1200);
      previousMillis_re += iteracao;
    
      if(delay_re == previousMillis_re){
      re = 1;
      }
    } else{
      digitalWrite(farol_ET, LOW);
      digitalWrite(farol_DT, LOW);
      noTone(buzina);
      previousMillis_re -= iteracao;
      if(previousMillis_re == 0){
      re = 0;
      
      }
    }
  

  }
 //farois code end

 //portas begin
 if(button_portasState == 0){
    if(i==0){
      for (pos_portas = 0; pos_portas < 180; pos_portas++) {
        Portas.write(pos_portas); // Define a posição atual do servo
        delay(15); // Aguarda 15 milissegundos antes de mover para a próxima posição
        Serial.println("porta abriu");
      }
      digitalWrite(LED_parada, LOW);
    }
      else if(i==1){
        for (pos_portas = 180; pos_portas >= 0; pos_portas--) {
          Portas.write(pos_portas); // Define a posição atual do servo
          delay(15); // Aguarda 15 milissegundos antes de mover para a próxima posição
          Serial.println("porta fechou");
          i=-1;
        }
      }
      i++;
  }

  //portas end

  // parada code begin
  if(Button_paradaState == 0){
    digitalWrite(LED_parada, HIGH);
  }

  //parada code end

  //lcd code begin

  if (end == 0) {
    lcd.setCursor(1,0); // Coloca o cursor do display na coluna 1 e linha 1
    lcd.print("6350 "); // Comando de saída com a mensagem que deve aparecer na coluna 2 e linha 1.
    lcd.setCursor(1, 1); //Coloca o cursor do display na coluna 1 e linha 2
    lcd.print("Est. Barreiro");  // Comando de saida com a mensagem que deve aparecer na coluna 2 e linha 2
    //lcd.clear(); // Limpa o display até o loop ser reiniciado 
    
    previousMillis += iteracao;
    
    if(interval == previousMillis){
      end = 1;
      //lcd.clear();
    }
  }
  else{
    lcd.setCursor(1,0); // Coloca o cursor do display na coluna 1 e linha 1
    lcd.print("6350 "); // Comando de saída com a mensagem que deve aparecer na coluna 2 e linha 1.
    lcd.setCursor(1, 1); //Coloca o cursor do display na coluna 1 e linha 2
    lcd.print("Est. Vilarinho");  // Comando de saida com a mensagem que deve aparecer na coluna 2 e linha 2
    //lcd.clear(); // Limpa o display até o loop ser reiniciado 
    previousMillis -= iteracao;
    if(previousMillis == 0){
      end = 0;
      lcd.clear();
    }
  }


  //ldc end

   delay(20);
    
} //end loop