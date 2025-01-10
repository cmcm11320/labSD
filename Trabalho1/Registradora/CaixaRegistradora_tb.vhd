library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CaixaRegistradora_tb is
end CaixaRegistradora_tb;

architecture Behavioral of CaixaRegistradora_tb is

    -- Componentes do módulo principal
    component CaixaRegistradora
        Port (
            CLK          : in  STD_LOGIC;
            RESET        : in  STD_LOGIC;
				--TESTANDO     : out integer;
            TIMER        : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- Sinais para conexão
    signal CLK          : STD_LOGIC := '0';
    signal RESET        : STD_LOGIC := '0';
    signal TIMER        : STD_LOGIC_VECTOR(15 downto 0);

    -- Clock de 50 MHz
    constant CLK_PERIOD : time := 20 ns;

begin
    -- Instância do componente principal
    uut: CaixaRegistradora
        Port map (
            CLK   => CLK,
            RESET => RESET,
				--TESTANDO => TESTANDO,
            TIMER => TIMER
        );

    -- Geração de clock
    process
    begin
        while true loop
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Estímulos de teste
    process
    begin
        -- Teste 1: Reset inicial
        RESET <= '1';
        wait for 100 ns;
        RESET <= '0';

        -- Teste 2: Simulação do relógio
        wait for 2 ms; -- Simula alguns segundos para observar a atualização do TIMER

        -- Teste 3: Inserção de operações pelo arquivo
        -- A simulação lê o arquivo "operacoes.txt" automaticamente. 
        -- Após ler as operações, deve atualizar o valor total e escrever no arquivo "registro_operacoes.txt".
        wait for 10 ms; -- Tempo suficiente para processar algumas operações

        -- Finaliza a simulação
        wait;
    end process;

end Behavioral;
