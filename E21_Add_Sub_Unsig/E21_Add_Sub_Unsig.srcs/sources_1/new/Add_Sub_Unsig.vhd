-----------------Problema 2.1--------------------
--Integrantes: Hugo Chicaiza, Gabriela Echeverría, Sebastián Tayo
--2.1. Example 3.10. Adder/Subtractor unsigned, pg 108
-----------------LIBRERIAS--------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- Operaciones lógicas.
use IEEE.NUMERIC_STD.ALL;   -- Operaciones aritméticas para unsigned.

-----------------ENTIDAD--------------------
entity Add_Sub_Unsig is
    Port (
        x,y    : in  unsigned(11 downto 0);  -- Operando 1 y 2: número sin signo de 12 bits
        mode   : in  std_logic;                     -- Modo de operación: 0 para suma, 1 para resta
        s      : out unsigned(11 downto 0); -- Resultado: suma o resta (12 bits)
        ovf_unf: out std_logic                      -- Indicador de overflow (suma) o underflow (resta)
    );
end entity Add_Sub_Unsig;

-----------------Arquitectura--------------------
architecture Behavioral of Add_Sub_Unsig is
    signal s_tmp : unsigned(12 downto 0);  -- Señal extendida de 13 bits para salida.
begin
   
    s_tmp <= ('0' & x) + ('0' & y) when mode = '0' else -- Concatenar '0' en el MSB de x y y.
             ('0' & x) - ('0' & y); -- Se realiza la selección con mode, suma con 0 y resta caso contrario
          s <= s_tmp(11 downto 0); --Los primeros 12 bits con la respuesta
         ovf_unf <= s_tmp(12); -- el bit 13 es el indicador si existe overflow o underflow
end Behavioral;