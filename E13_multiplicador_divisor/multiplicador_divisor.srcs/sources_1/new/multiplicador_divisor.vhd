----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2024 16:45:43
-- Design Name: 
-- Module Name: multiplicador_divisor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicador_divisor is
GENERIC(N:INTEGER :=8); -- numero de bits que se utilizan
Port ( 
        a,b: INTEGER RANGE 0 TO 2**N-1; --rango de los enteros tomando en cuenta la conversion 
        prod: OUT INTEGER RANGE 0 TO 4**N-1; -- Resultado maximo que se puede presentar al multiplicar
        div: OUT INTEGER RANGE 0 TO 2**N-1 --el resultado de la division sera del mismo rango de a y b
);
end multiplicador_divisor;

architecture Behavioral of multiplicador_divisor is

begin
    prod <= a * b; -- multiplicacion de los enteros que se ingresan
   div <= a / b; -- division de los enteros, se debe tener cuidado con la indeterminacion

end Behavioral;
