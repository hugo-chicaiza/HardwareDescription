library IEEE; --libreria
use IEEE.STD_LOGIC_1164.ALL; --Paquete de libreria

entity ROM is
  Port ( address: IN INTEGER RANGE 0 TO 9; --Direccionamiento
   -- Mi memoria almacena 10 datos, selecciono data con # 0 a 9
         data:    OUT std_logic_vector (6 downto 0)  --Salida de memoria
   -- Cada dato es compuesto por 7 bits     
    );
end ROM;

architecture Behavioral of ROM is 
TYPE memory IS ARRAY (0 TO 9) OF std_logic_vector (6 downto 0);
    -- creo un tipo de dato personalizado denomidado memory
    --, este es un arreglo Unidimensional de vectores con 7 bits
    CONSTANT rom: memory:= (--abcdefg
                             "1111110",  --0
                             "0110000",  --1
                             "1101101",  --2
                             "1111001",  --3
                             "0110011",  --4
                             "1011011",  --5
                             "1011111",  --6
                             "1110000",  --7
                             "1111111",  --8
                             "1111011"); --9
begin
    data <=rom(address); --Asigno a data los valores almacenados 
    --en la ROM segun el direccionamiento 
end Behavioral;
