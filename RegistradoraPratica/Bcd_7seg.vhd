LIBRARY IEEE;
use ieee.std_logic_1164.all;


-- Testado e fornecido com pinagem para Kit Terasic Altera DE2:
Entity Bcd_7seg is
   port (
		entrada: in std_logic_vector (3 downto 0);
		saida:	out std_logic_vector (6 downto 0)
	);
end Bcd_7seg;

architecture with_select_bcd7seg of Bcd_7seg is
begin
  with entrada select
  saida <=  "0000001" when "0000", --0 -- 1111110
	    "1001111" when "0001", --1 -- 0110000
	    "0010010" when "0010", --2 --  1101101
	    "0000110" when "0011", --3 --  1111001
	    "1001100" when "0100", --4 --  0110011
	    "0100100" when "0101", --5 -- 1011011
	    "0100000" when "0110", --6 -- 0100000 1011111
	    "0001111" when "0111", --7 --  1110000
	    "0000000" when "1000", --8 --  1111111
	    "0000100" when "1001", --9 --  1111011
	    "0001000" when "1010", --A --  1110111
	    "1100000" when "1011", --b --  0011111
	    "0110001" when "1100", --C --  1001110
	    "1000010" when "1101", --d --  0111101
	    "0110000" when "1110", --E --  1001111
	    "0111000" when "1111", --f --  1000111
	    "0000001" when others;
				
end with_select_bcd7seg;
				
				
		