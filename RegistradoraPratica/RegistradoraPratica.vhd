library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Módulo principal 
entity RegistradoraPratica is
    Port (
        CLK          : in  STD_LOGIC;               -- Clock principal
        RESET        : in  STD_LOGIC;               -- Reset do sistema
		  keyboard_val : in  STD_LOGIC_VECTOR(3 downto 0);
		  operation    : in  STD_LOGIC_VECTOR(1 downto 0);
        SEG_DISPLAY1  : out STD_LOGIC_VECTOR(6 downto 0); -- Saída para display de 7 segmentos
		  SEG_DISPLAY2  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAY3  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAY4  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAYtotal1  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAYtotal2  : out STD_LOGIC_VECTOR(6 downto 0);
		  FINALVALOR  : out STD_LOGIC_VECTOR(7 downto 0);
        TIMER : out STD_LOGIC_VECTOR(15 downto 0)  -- Hora atual em formato HHMM
    );
end RegistradoraPratica;

architecture Behavioral of RegistradoraPratica is

    -- Estados da máquina de estados
    type STATE_TYPE is (IDLE, PROCESS_INPUT, UPDATE_DISPLAY);
    signal CURRENT_STATE, NEXT_STATE : STATE_TYPE := IDLE;

    -- Sinais internos
    signal clock_divider : integer := 0;
	 signal clock_divider2 : integer := 0;
    signal CLK_1HZ       : STD_LOGIC := '0';  -- Clock de 1 Hz para o relógio
	 signal CLK_1MHZ       : STD_LOGIC := '0';
	 
	 
	 signal reg_total     : integer := 0;
    signal reg_value     : STD_LOGIC_VECTOR(7 downto 0) := "00000000";      -- Valor total da caixa registradora
	 signal value_tens  : integer:=0;
	 signal value_ones  : integer:=0;


    signal current_timer  : integer := 720;  -- Horário inicial 12:00 em segundos
	 
	 signal sub_timer_hours  : integer;
	 signal sub_timer_mins  : integer;
	 signal hour_tens  : integer; -- Dezena das horas
    signal hour_ones  : integer; -- Unidade das horas
    signal minute_tens: integer; -- Dezena dos minutos
    signal minute_ones: integer; -- Unidade dos minutos
	 
    signal last_operation   : STD_LOGIC_VECTOR(1 downto 0) := "00"; -- Armazena a última operação
    signal last_valor       : STD_LOGIC_VECTOR(3 downto 0) := "0000"; -- Armazena o último valor
	 
	 signal temp_hours  : integer := 0;
	 signal temp_mins  : integer := 0;

	 
	 component Bcd_7seg is
        port (
            entrada : in std_logic_vector(3 downto 0);
            saida   : out std_logic_vector(6 downto 0)
        );
    end component;
    

    -- Módulo: Divisor de Clock
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            if clock_divider = 50000000 then  -- Considerando um clock de 50 MHz
                clock_divider <= 0;
                CLK_1HZ <= not CLK_1HZ;
            else
                clock_divider <= clock_divider + 1;
            end if;
        end if;
    end process;
	 
    process(CLK)
    begin
        if rising_edge(CLK) then
            if clock_divider2 = 5000 then  -- Considerando um clock de 50 MHz
                clock_divider2 <= 0;
                CLK_1MHZ <= not CLK_1MHZ;
            else
                clock_divider2 <= clock_divider2 + 1;
            end if;
        end if;
    end process;

    -- Módulo: Atualização do Horário
    process(CLK_1HZ, RESET)
    begin
        if RESET = '1' then
            current_timer <= 720;
        elsif rising_edge(CLK_1HZ) then
				current_timer <= current_timer + 1; --segundos passando
        end if;
		  if current_timer = 1440 then 
				current_timer <= 0;
			end if;
    end process;

    -- Módulo: Máquina de Estados
    process(CLK_1MHZ, RESET)
    begin
        if RESET = '1' then
            CURRENT_STATE <= IDLE;
        elsif rising_edge(CLK_1MHZ) then
            CURRENT_STATE <= NEXT_STATE;
        end if;
    end process;

    -- Módulo: Lógica de Processamento de Estados
    process(CURRENT_STATE, keyboard_val)
	 
	 variable valor : integer;
		
	 
    begin
		  if RESET = '1' then
			reg_total <= 0;
		  else
			
		
        case CURRENT_STATE is
            when IDLE =>
                -- Verificar se há uma nova operação habilitada
                if (operation /= last_operation or keyboard_val /= last_valor) then
                    NEXT_STATE <= PROCESS_INPUT;
                else
                    NEXT_STATE <= IDLE;
                end if;

            when PROCESS_INPUT =>
                -- Processa o valor e operação
					 valor := to_integer(unsigned(keyboard_val));
					 
                if operation = "01" then
                    reg_total <= reg_total + valor;
                elsif operation = "11" then
                    reg_total <= reg_total - valor;
                end if;
					 
					 last_operation <= operation;
                last_valor <= keyboard_val;
                NEXT_STATE <= UPDATE_DISPLAY;

            when UPDATE_DISPLAY =>
                NEXT_STATE <= IDLE;
				
            when others =>
                NEXT_STATE <= IDLE;
        end case;
		  end if;
		  
    end process;

    -- Módulo: Atualização das Saídas
	 
	 --temp_hours <= integer(current_timer/60);
	 --temp_mins <= integer(current_timer mod 60);
	 
    TIMER <= std_logic_vector(to_unsigned(current_timer, 16));
	 
	 sub_timer_hours <= integer(current_timer/60);
	 sub_timer_mins <= integer(current_timer mod 60);
	 
	 
	 hour_tens <= sub_timer_hours /10;
	 hour_ones <= sub_timer_hours mod 10;
	 minute_tens<= sub_timer_mins/10;
	 minute_ones <= sub_timer_mins mod 10;
	 
	 
	 
	 
	 
	 
	 FINALVALOR <= std_logic_vector(to_unsigned(reg_total, 8));
	 
	 --reg_value <= std_logic_vector(to_unsigned(reg_total, 8)); -- Valor total

	
	 value_tens <=  (reg_total/10) mod 10;
	 value_ones <=  reg_total mod 10;

	 
	 
	 
	 
	 
	 --instancias
	 
	 inst_Bcd7seg1: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(hour_tens,4)), saida=>SEG_DISPLAY1);
	 inst_Bcd7seg2: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(hour_ones,4)), saida=>SEG_DISPLAY2);
	 inst_Bcd7seg3: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(minute_tens,4)), saida=>SEG_DISPLAY3);
	 inst_Bcd7seg4: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(minute_ones,4)), saida=>SEG_DISPLAY4);
	 
	 inst_Bcd7segvalue1: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(value_tens,4)), saida=>SEG_DISPLAYtotal1);
	 inst_Bcd7segvalue2: Bcd_7seg port map (entrada=>std_logic_vector(to_unsigned(value_ones,4)), saida=>SEG_DISPLAYtotal2);


end Behavioral;
