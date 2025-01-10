library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Biblioteca adicional para simulação de arquivos
use STD.TEXTIO.ALL;

-- Módulo principal
entity CaixaRegistradora is
    Port (
        CLK          : in  STD_LOGIC;               -- Clock principal
        RESET        : in  STD_LOGIC;               -- Reset do sistema
        SEG_DISPLAY1  : out STD_LOGIC_VECTOR(6 downto 0); -- Saída para display de 7 segmentos
		  SEG_DISPLAY2  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAY3  : out STD_LOGIC_VECTOR(6 downto 0);
		  SEG_DISPLAY4  : out STD_LOGIC_VECTOR(6 downto 0);
        TIMER : out STD_LOGIC_VECTOR(15 downto 0)  -- Hora atual em formato HHMM
    );
end CaixaRegistradora;

architecture Behavioral of CaixaRegistradora is

    -- Estados da máquina de estados
    type STATE_TYPE is (IDLE, PROCESS_INPUT, UPDATE_DISPLAY, DONE);
    signal CURRENT_STATE, NEXT_STATE : STATE_TYPE := IDLE;

    -- Sinais internos
    signal clock_divider : integer := 0;
    signal CLK_1HZ       : STD_LOGIC := '0';  -- Clock de 1 Hz para o relógio

    signal reg_value     : integer := 0;      -- Valor total da caixa registradora
    signal keyboard_val  : integer := 0;     -- Valor lido
    signal operation     : STD_LOGIC_VECTOR(1 downto 0); -- Tipo de operação ("01" = add, "11" = sub)

    signal current_timer  : integer := 1200;  -- Horário inicial 12:00
	 
	 signal sub_timer  : STD_LOGIC_VECTOR(15 downto 0);
	 signal hour_tens  : STD_LOGIC_VECTOR(3 downto 0); -- Dezena das horas
    signal hour_ones  : STD_LOGIC_VECTOR(3 downto 0); -- Unidade das horas
    signal minute_tens: STD_LOGIC_VECTOR(3 downto 0); -- Dezena dos minutos
    signal minute_ones: STD_LOGIC_VECTOR(3 downto 0); -- Unidade dos minutos

	 
	 signal file_opened : boolean := false;
	 signal file_done : boolean := false;

    -- Variáveis para leitura e escrita de arquivos
    file input_file  : text; -- Arquivo de entrada
    file output_file : text; -- Arquivo de saída
	 
	 
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

    -- Módulo: Atualização do Horário
    process(CLK_1HZ, RESET)
    begin
        if RESET = '1' then
            current_timer <= 1200;
        elsif rising_edge(CLK_1HZ) then
            if current_timer mod 100 = 59 then
                if current_timer / 100 = 23 then
                    current_timer <= 0;
                else
                    current_timer <= (current_timer / 100 + 1) * 100;
                end if;
            else
                current_timer <= current_timer + 1;
            end if;
        end if;
    end process;

    -- Módulo: Máquina de Estados
    process(CLK, RESET)
    begin
        if RESET = '1' then
            CURRENT_STATE <= IDLE;
        elsif rising_edge(CLK) then
            CURRENT_STATE <= NEXT_STATE;
        end if;
    end process;

    -- Módulo: Lógica de Processamento de Estados
    process(CURRENT_STATE)
	 
	 variable line_in     : line;  -- Linha lida do arquivo
    variable line_out    : line;  -- Linha a ser escrita no arquivo
    variable read_op     : string(1 to 3); -- Operação lida ("add" ou "sub")
    variable read_value  : integer;        -- Valor lido do arquivo
	 variable temp_string : string(1 to 6) := "000000";
	 variable line_buffer : line;
	 
    begin
	 if not file_opened then
		file_open(input_file, "operacoes.txt", read_mode);
		file_open(output_file, "registro_operacoes.txt", append_mode);
	 end if;
        case CURRENT_STATE is
            when IDLE =>
                -- Verifica se há dados no arquivo de entrada
                if not endfile(input_file) and not file_done then
                    readline(input_file, line_in);
						  read(line_in, temp_string); -- Lê a string inteira
						  
						  file_opened <= true;
	
						  read_op := temp_string(1 to 3);
                    -- Decodifica a operação
                    if read_op = "add" then
                        operation <= "01";
                    elsif read_op = "sub" then
                        operation <= "11";
                    end if;
						 
						  
						  write(line_buffer, temp_string(5 to temp_string'length));
						  
						  read(line_buffer, read_value);
						  
                    keyboard_val <= read_value;
                    NEXT_STATE <= PROCESS_INPUT;
                else
						  file_done <= true; -- Marcar o arquivo como processado
                    NEXT_STATE <= DONE;
                end if;

            when PROCESS_INPUT =>
                -- Processa o valor e operação
                if operation = "01" then
                    reg_value <= reg_value + keyboard_val;
                elsif operation = "11" then
                    reg_value <= reg_value - keyboard_val;
                end if;
                NEXT_STATE <= UPDATE_DISPLAY;

            when UPDATE_DISPLAY =>
                -- Escreve no arquivo de saída o resultado
                write(line_out, string'("Operacao: "));
                if operation = "00" then
                    write(line_out, string'("add "));
                elsif operation = "01" then
                    write(line_out, string'("sub "));
					 else 
						  write(line_out, string'("invalida "));
                end if;
                write(line_out, keyboard_val);
                write(line_out, string'(" Total: "));
                write(line_out, reg_value);
                write(line_out, string'(" Hora: "));
                write(line_out, current_timer);
                writeline(output_file, line_out);
                NEXT_STATE <= IDLE;
				
				when DONE =>
					file_close(input_file);
					file_close(output_file);

					NEXT_STATE <= DONE;
            when others =>
                NEXT_STATE <= IDLE;
        end case;
		  
    end process;

    -- Módulo: Atualização das Saídas
    TIMER <= std_logic_vector(to_unsigned(current_timer, 16));
	 
	 sub_timer <= std_logic_vector(to_unsigned(current_timer, 16));

	 hour_tens  <= sub_timer(15 downto 12); 
    hour_ones  <= sub_timer(11 downto 8);   
    minute_tens <= sub_timer(7 downto 4);   
    minute_ones <= sub_timer(3 downto 0);  
	 
	 inst_Bcd7seg1: Bcd_7seg port map (entrada=>hour_tens, saida=>SEG_DISPLAY1);
	 inst_Bcd7seg2: Bcd_7seg port map (entrada=>hour_ones, saida=>SEG_DISPLAY2);
	 inst_Bcd7seg3: Bcd_7seg port map (entrada=>minute_tens, saida=>SEG_DISPLAY3);
	 inst_Bcd7seg4: Bcd_7seg port map (entrada=>minute_ones, saida=>SEG_DISPLAY4);


end Behavioral;
