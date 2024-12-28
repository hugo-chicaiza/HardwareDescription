library IEEE; --libreria estandar
use IEEE.STD_LOGIC_1164.ALL; -- libreria para STD_LOGIC

entity big_adder_tb is --Entidad sin puertos
end big_adder_tb;

architecture Behavioral of big_adder_tb is

    COMPONENT big_adder
    PORT (
        a, b: IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Entradas de 32 bits para los operandos `a` y `b`.
        cin: IN STD_LOGIC; -- Entrada del acarreo de entrada.
        sum: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- Salida del resultado de la suma.
        cout: OUT STD_LOGIC -- Salida del acarreo final.
    );
    END COMPONENT;
    
 --Inputs
   signal a_s, b_s: STD_LOGIC_VECTOR(31 DOWNTO 0); -- Entradas de 32 bits para los operandos `a` y `b`.
   signal cin_s:  STD_LOGIC; -- Entrada del acarreo de entrada.
   signal sum_s:  STD_LOGIC_VECTOR(31 DOWNTO 0); -- Salida del resultado de la suma.
 --Outputs 
   signal cout_s: STD_LOGIC; -- Salida del acarreo final.

begin
-- Instantiate the Unit Under Test (UUT)
   uut: big_adder PORT MAP (
          a => a_s,
          b => b_s,
          cin => cin_s,
          sum => sum_s,
          cout => cout_s);

   stim_proc: process
   begin	
		a_s <= "11111111111111111111111111111110"; --4294967294
        b_s <= "00000000000000000000000000000001"; --1
        cin_s <= '0';                              --0
        wait for 10 ns;                            -- 4294967295
        
        a_s <= "00000000000000001111111111111111"; --65535
        b_s <= "11111000000000000000000000000000"; --4160749568
        cin_s <= '1';                              --1
        wait for 10 ns;                            --4160815103
        
        wait;
   end process;
end Behavioral;
