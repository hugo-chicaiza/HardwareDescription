library IEEE;--libreria
use IEEE.STD_LOGIC_1164.ALL; --Paquete de libreria
USE work.my_package.all; -- Paquete de libreria en area de trabajo

ENTITY Main IS
    PORT (
          bcd: IN INTEGER RANGE 0 TO 9; -- Direccionamiento
          ssd: OUT std_logic_vector (6 DOWNTO 0) --Salida
          );
 END Main;

 ARCHITECTURE behavioral  OF Main IS
    BEGIN
        ssd <= bcd_to_ssd(bcd); --Llamo a funcion
 END behavioral ;

