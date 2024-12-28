-----------------Problema 2.1--------------------
--Integrantes: Hugo Chicaiza, Gabriela Echeverría, Sebastián Tayo
--2.1. Example 3.10. Adder/Subtractor unsigned, pg 108
-----------------LIBRERIAS--------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- Operaciones lógicas.
use IEEE.NUMERIC_STD.ALL;   -- Operaciones aritméticas para unsigned.

-----------------ENTIDAD--------------------
entity tb_Add_Sub_Unsig is
--  Port ( );
end tb_Add_Sub_Unsig;

-----------------Arquitectura--------------------
architecture Behavioral of tb_Add_Sub_Unsig is
-- Señales locales para conectar con el módulo que vamos a probar (unit under test, UUT)
    signal x_s      : unsigned(11 downto 0);  -- Operando 1 (12 bits)
    signal y_s      : unsigned(11 downto 0);  -- Operando 2 (12 bits)
    signal mode_s   : std_logic;                       -- Modo de operación (0 para suma, 1 para resta)
    signal s_s      : unsigned(11 downto 0);  -- Resultado de la operación (12 bits)
    signal ovf_unf_s: std_logic;                       -- Indicador de overflow o underflow

    -- Instanciación de la unidad bajo prueba (UUT)
    component Add_Sub_Unsig
        Port (
           x,y    : in  unsigned(11 downto 0);  
           mode   : in  std_logic;                     
           s      : out unsigned(11 downto 0); 
           ovf_unf: out std_logic     
        );
    end component;

begin
    -- Conexión de señales del testbench con el UUT
    uut: Add_Sub_Unsig
        Port map (
            x => x_s,
            y => y_s,
            mode => mode_s,
            s => s_s,
            ovf_unf => ovf_unf_s
        );

    -- Proceso para generar los estímulos
    stim_proc: process
    begin
        -- Primer caso de prueba: Suma de dos números
        x_s <= "000000000001";  -- x = 1
        y_s <= "000000000010";  -- y = 2
        mode_s <= '0';          -- Modo suma
        wait for 10 ns;       -- Espera 10 ns para que el UUT procese los datos

        -- Segundo caso de prueba: Resta de dos números
        x_s <= "000000000100";  -- x = 4
        y_s <= "000000000010";  -- y = 2
        mode_s <= '1';          -- Modo resta
        wait for 10 ns;       -- Espera 10 ns

        -- Tercer caso de prueba: Suma con overflow
        x_s <= "111111111111";  -- x = 4095 (máximo valor para 12 bits sin signo)
        y_s <= "000000000001";  -- y = 1
        mode_s <= '0';          -- Modo suma
        wait for 10 ns;       -- Espera 10 ns

        -- Cuarto caso de prueba: Resta con underflow
        x_s <= "000000000001";  -- x = 1
        y_s <= "000000000010";  -- y = 2
        mode_s <= '1';          -- Modo resta
        wait for 10 ns;       -- Espera 10 ns

        wait;
    end process;
end Behavioral;
