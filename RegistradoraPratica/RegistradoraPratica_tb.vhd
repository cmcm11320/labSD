library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Testbench para o Módulo RegistradoraPratica
entity RegistradoraPratica_tb is
end RegistradoraPratica_tb;

architecture Behavioral of RegistradoraPratica_tb is

    -- Componentes e sinais
    component RegistradoraPratica
        Port (
            CLK              : in  STD_LOGIC;
            RESET            : in  STD_LOGIC;
            keyboard_val     : in  STD_LOGIC_VECTOR(3 downto 0);
            operation        : in  STD_LOGIC_VECTOR(1 downto 0);
            SEG_DISPLAY1     : out STD_LOGIC_VECTOR(6 downto 0);
            SEG_DISPLAY2     : out STD_LOGIC_VECTOR(6 downto 0);
            SEG_DISPLAY3     : out STD_LOGIC_VECTOR(6 downto 0);
            SEG_DISPLAY4     : out STD_LOGIC_VECTOR(6 downto 0);
            SEG_DISPLAYtotal1: out STD_LOGIC_VECTOR(6 downto 0);
            SEG_DISPLAYtotal2: out STD_LOGIC_VECTOR(6 downto 0);
				FINALVALOR        : out STD_LOGIC_VECTOR(7 downto 0);
            TIMER            : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    signal CLK              : STD_LOGIC := '0';
    signal RESET            : STD_LOGIC := '0';
    signal keyboard_val     : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal operation        : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
    signal SEG_DISPLAY1     : STD_LOGIC_VECTOR(6 downto 0);
    signal SEG_DISPLAY2     : STD_LOGIC_VECTOR(6 downto 0);
    signal SEG_DISPLAY3     : STD_LOGIC_VECTOR(6 downto 0);
    signal SEG_DISPLAY4     : STD_LOGIC_VECTOR(6 downto 0);
    signal SEG_DISPLAYtotal1: STD_LOGIC_VECTOR(6 downto 0);
    signal SEG_DISPLAYtotal2: STD_LOGIC_VECTOR(6 downto 0);
	 signal FINALVALOR: STD_LOGIC_VECTOR(7 downto 0);
    signal TIMER            : STD_LOGIC_VECTOR(15 downto 0);

    -- Clock generation
    constant CLK_PERIOD : time := 20 ns;

begin
    -- Instancia o módulo a ser testado
    UUT: RegistradoraPratica
        port map (
            CLK              => CLK,
            RESET            => RESET,
            keyboard_val     => keyboard_val,
            operation        => operation,
            SEG_DISPLAY1     => SEG_DISPLAY1,
            SEG_DISPLAY2     => SEG_DISPLAY2,
            SEG_DISPLAY3     => SEG_DISPLAY3,
            SEG_DISPLAY4     => SEG_DISPLAY4,
            SEG_DISPLAYtotal1=> SEG_DISPLAYtotal1,
            SEG_DISPLAYtotal2=> SEG_DISPLAYtotal2,
            TIMER            => TIMER,
				FINALVALOR        => FINALVALOR
        );

    -- Clock process
    clock_process: process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Test process
    test_process: process
    begin
        -- Reset the system
        RESET <= '1';
        wait for 500 ns;
        RESET <= '0';

        -- Test case 1: Add 5 to the register
        keyboard_val <= "0101"; -- 5
        operation <= "01";      -- Add
        wait for 500 ns;

        -- Test case 2: Subtract 2 from the register
        keyboard_val <= "0010"; -- 2
        operation <= "11";      -- Subtract
        wait for 500 ns;
		  
		  keyboard_val <= "0000"; -- 0
        operation <= "11";      -- Subtract
        wait for 500 ns;
		  
		  keyboard_val <= "0110"; -- 6
        operation <= "01";      -- Add
        wait for 500 ns;
		  
		  keyboard_val <= "0100"; -- 4
        operation <= "11";      -- Subtract
        wait for 500 ns;
		  
		  

        
        wait for 1 ms; 

        
        wait;
    end process;

end Behavioral;
