library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity projeto_onibus is
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
           lcd_rs : out STD_LOGIC
           );
end projeto_onibus;

architecture Behavioral of projeto_onibus is

    -- Definições internas
    signal buzina_state : STD_LOGIC := '0';
    signal portas_state : STD_LOGIC := '0';
    signal catraca_pos : STD_LOGIC := '0';
    signal farol_state : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal lcd_display : STD_LOGIC;

    -- FSM para controle dos faróis
    type farol_states is (IDLE, SETA_DIREITA, SETA_ESQUERDA, LUZ_RE);
    signal farol_state_fsm : farol_states := IDLE;

begin

    -- Processo principal do sistema
    process(clk, reset)
    begin
        if reset = '1' then
            -- Resetando todos os estados
            buzina_state <= '0';
            portas_state <= '0';
            catraca_pos <= '0';
            farol_state <= (others => '0');
            lcd_display <= '0';
            led_parada <= '0';
            farol_state_fsm <= IDLE;
        
elsif rising_edge(clk) then
            -- Controle da FSM dos faróis
            case farol_state_fsm is
                when IDLE =>
                    if VRX = "01" then
                        farol_state_fsm <= SETA_DIREITA;
                    elsif VRX = "10" then
                        farol_state_fsm <= SETA_ESQUERDA;
                    elsif VRY = '1' then
                        farol_state_fsm <= LUZ_RE;
                    end if;
                
                when SETA_DIREITA =>
                    farol_state(0) <= '1'; -- Farol direito frontal ligado
                    farol_state(3) <= '1'; -- Farol direito traseiro ligado
                    if VRX /= "01" then
                        farol_state_fsm <= IDLE;
                    end if;
                
                when SETA_ESQUERDA =>
                    farol_state(1) <= '1'; -- Farol esquerdo frontal ligado
                    farol_state(2) <= '1'; -- Farol esquerdo traseiro ligado
                    if VRX /= "10" then
                        farol_state_fsm <= IDLE;
                    end if;
                
                when LUZ_RE =>
                    farol_state(2) <= '1'; -- Farol esquerdo traseiro ligado
                    farol_state(3) <= '1'; -- Farol direito traseiro ligado
                    if VRY /= '1' then
                        farol_state_fsm <= IDLE;
                    end if;
            end case;

            -- Resetando os faróis quando em IDLE
            if farol_state_fsm = IDLE then
                farol_state <= (others => '0');
            end if;

            -- Controle de outros componentes
            if buzina_button = '1' then
                buzina_state <= '1';
            else
                buzina_state <= '0';
            end if;

            if button_portas = '0' then
                if portas_state = '0' then
                    portas_state <= '1';
                    portas <= '1';
                else
                    portas_state <= '0';
                    portas <= '0';
                end if;
            end if;

            if ldr = '1' then
                catraca_pos <= '1';
            else
                catraca_pos <= '0';
            end if;

            if button_parada = '0' then
                led_parada <= '1';
            else
                led_parada <= '0';
            end if;

            -- Atualização do LCD
            lcd_display <= '1';
            lcd_enable <= '1';
            lcd_rs <= '1';

            -- Controle da saída dos faróis
            farol_DF <= farol_state(0);
            farol_EF <= farol_state(1);
            farol_ET <= farol_state(2);
            farol_DT <= farol_state(3);

            -- Controle da buzina
            buzina <= buzina_state;

        end if;
    end process;

end Behavioral;
