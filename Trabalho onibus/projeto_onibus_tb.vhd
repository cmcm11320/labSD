library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity projeto_onibus_tb is
-- Sem portas no testbench
end projeto_onibus_tb;

architecture Behavioral of projeto_onibus_tb is

    -- Component instanciado
    component Onibus_Controller
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               buzina_button : in STD_LOGIC;
               button_portas : in STD_LOGIC;
               button_parada : in STD_LOGIC;
               ldr : in STD_LOGIC;
               VRX : in STD_LOGIC_VECTOR(1 downto 0);
               VRY : in STD_LOGIC;
               farol_DF : out STD_LOGIC;
               farol_EF : out STD_LOGIC;
               farol_DT : out STD_LOGIC;
               farol_ET : out STD_LOGIC;
               buzina : out STD_LOGIC;
               portas : out STD_LOGIC;
               catraca : out STD_LOGIC;
               led_parada : out STD_LOGIC;
               lcd_data : out STD_LOGIC;
               lcd_enable : out STD_LOGIC;
               lcd_rs : out STD_LOGIC);
    end component;

    -- Sinais internos
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal buzina_button : STD_LOGIC := '1';
    signal button_portas : STD_LOGIC := '1';
    signal button_parada : STD_LOGIC := '1';
    signal ldr : STD_LOGIC;
    signal VRX : STD_LOGIC_VECTOR(1 downto 0);
	 signal VRY : STD_LOGIC;
    signal farol_DF : STD_LOGIC;
    signal farol_EF : STD_LOGIC;
    signal farol_DT : STD_LOGIC;
    signal farol_ET : STD_LOGIC;
    signal buzina : STD_LOGIC;
    signal portas : STD_LOGIC;
    signal catraca : STD_LOGIC;
    signal led_parada : STD_LOGIC;
    signal lcd_data : STD_LOGIC;
    signal lcd_enable : STD_LOGIC;
    signal lcd_rs : STD_LOGIC;

    -- Clock gerado
    constant clk_period : time := 20 ns;

begin

    -- Instância do DUT (Device Under Test)
    uut: Onibus_Controller
        Port map (
            clk => clk,
            reset => reset,
            buzina_button => buzina_button,
            button_portas => button_portas,
            button_parada => button_parada,
            ldr => ldr,
            VRX => VRX,
            VRY => VRY,
            farol_DF => farol_DF,
            farol_EF => farol_EF,
            farol_DT => farol_DT,
            farol_ET => farol_ET,
            buzina => buzina,
            portas => portas,
            catraca => catraca,
            led_parada => led_parada,
            lcd_data => lcd_data,
            lcd_enable => lcd_enable,
            lcd_rs => lcd_rs
        );

    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Estímulos do Testbench
    stimulus_process : process
    begin
        -- Reset inicial
        reset <= '1';
        wait for 100 ns;
        reset <= '0';

        -- Teste da buzina
        buzina_button <= '1'; -- Aciona a buzina
        wait for 50 ms;
        buzina_button <= '0'; -- Desliga a buzina
        wait for 50 ms;

        -- Teste das portas
        button_portas <= '0'; -- Abre as portas
        wait for 50 ms;
        button_portas <= '1'; -- Fecha as portas
        wait for 50 ms;

        -- Teste do LED de parada
        button_parada <= '0'; -- Aciona o LED de parada
        wait for 50 ms;
        button_parada <= '1'; -- Desliga o LED de parada
        wait for 50 ms;

        -- Teste do sensor LDR (catraca)
        ldr <= '1'; -- Baixa luminosidade (abre a catraca)
        wait for 50 ms;
        ldr <= '0'; -- Alta luminosidade (fecha a catraca)
        wait for 50 ms;

        -- Teste do joystick (faróis)
        VRX <= "01"; -- Movimenta joystick para a direita (farol direito)
        wait for 50 ms;
        VRX <= "10"; -- Centraliza joystick
        wait for 50 ms;
        VRY <= '1'; -- Movimenta joystick para a esquerda (farol esquerdo)
        wait for 50 ms;
        VRY <= '0'; -- Centraliza joystick
        wait for 50 ms;

        -- Finaliza simulação
        wait;
    end process;

end Behavioral;
