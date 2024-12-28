library IEEE; --Libreira
use IEEE.STD_LOGIC_1164.ALL;--Paquete de libreria
---------------------------------------------------------
entity Main_tb is--Declaro entidad sin puertos
end Main_tb;
---------------------------------------------------------
architecture Behavioral of Main_tb is
--/Declaro el componente Main
    COMPONENT Main
    PORT(
          bcd: IN INTEGER RANGE 0 TO 9;--Direccionamiento
          ssd: OUT std_logic_vector (6 DOWNTO 0) --Salida de memoria
         );
    END COMPONENT;
--Declaro señales para simulacion Inputs
   signal bcd_s: INTEGER RANGE 0 TO 9;
--Declaro señales para simulacion Outputs
   signal ssd_s:  std_logic_vector (6 downto 0);

begin
-- Instantiate the Unit Under Test (UUT)
   uut: Main PORT MAP (
          bcd => bcd_s,
          ssd => ssd_s);
   stim_proc: process
   begin	
   -- Se direcciona la memoria a posiciones de 0 a 9
   -- Se espera visualizar los datos contenidos en la memori
   --Se espera 10 ns y procede con la siguiente posicion de memoria
			bcd_s <= 0; 
			wait for 10 ns;
			bcd_s <= 1; 
			wait for 10 ns;
			bcd_s <= 2; 
			wait for 10 ns;
			bcd_s <= 3; 
			wait for 10 ns;
			bcd_s <= 4; 
			wait for 10 ns;
			bcd_s <= 5;
			wait for 10 ns;
			bcd_s <= 6; 
			wait for 10 ns;
			bcd_s <= 7; 
			wait for 10 ns;
			bcd_s <= 8; 
			wait for 10 ns;
			bcd_s <= 9; 
			wait for 10 ns;
      wait;
   end process;
end Behavioral;