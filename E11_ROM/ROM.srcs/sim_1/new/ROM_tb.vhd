library IEEE; --libreria
use IEEE.STD_LOGIC_1164.ALL; --Paquete de libreria
---------------------------------------------------------
entity ROM_tb is --Declaro entidad sin puertos
end ROM_tb;
---------------------------------------------------------
architecture Behavioral of ROM_tb is
--/Declaro el componente ROM
    COMPONENT ROM
    PORT(
         address: IN INTEGER RANGE 0 TO 9; --Direccionamiento
         data:    OUT std_logic_vector (6 downto 0) --Salida de memoria
         );
    END COMPONENT;
--Declaro señales para simulacion Inputs
   signal address_s: INTEGER RANGE 0 TO 9;
--Declaro señales para simulacion Outputs
   signal data_s:  std_logic_vector (6 downto 0);

begin
-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          address => address_s,
          data => data_s);

   stim_proc: process --Proceso de estimulos
   begin	
   -- Se direcciona la memoria a posiciones de 0 a 9
   -- Se espera visualizar los datos contenidos en la memori
   --Se espera 10 ns y procede con la siguiente posicion de memoria
			address_s <= 0;  -- Se accese a direccion 0
			wait for 10 ns;
			address_s <= 1;  -- Se accese a direccion 1
			wait for 10 ns;
			address_s <= 2;  -- Se accese a direccion 2
			wait for 10 ns;
			address_s <= 3;  -- Se accese a direccion 3
			wait for 10 ns;
			address_s <= 4;  -- Se accese a direccion 4
			wait for 10 ns;
			address_s <= 5;  -- Se accese a direccion 5
			wait for 10 ns;
			address_s <= 6;  -- Se accese a direccion 6
			wait for 10 ns;
			address_s <= 7;  -- Se accese a direccion 7
			wait for 10 ns;
			address_s <= 8;  -- Se accese a direccion 8
			wait for 10 ns;
			address_s <= 9;  -- Se accese a direccion 9
			wait for 10 ns;
      wait;
   end process;
end Behavioral;