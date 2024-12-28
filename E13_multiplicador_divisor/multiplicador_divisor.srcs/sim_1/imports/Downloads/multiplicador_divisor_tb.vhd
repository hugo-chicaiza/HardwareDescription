----------------------------------------------------------------------------------
-- Company: ESPE / DEEE
-- Engineer: BYRON NAVAS
-- 
-- Create Date: 09/25/2019 
-- Design Name: 
-- Module Name: dec7seg_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple example about creating a test-bench
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

entity multiplicador_divisor_tb is

end multiplicador_divisor_tb;

architecture Behavioral of multiplicador_divisor_tb is

    -- Declaración del componente bajo prueba (DUT)
    COMPONENT multiplicador_divisor -- se declara el componente con el mismo nombre que el 'source'
    GENERIC (
        N : INTEGER := 8 -- Número de bits
    );
    PORT(
        a    : IN  INTEGER RANGE 0 TO 2**N-1; --rango de los enteros que puede tomar a para 8 bits
        b    : IN  INTEGER RANGE 0 TO 2**N-1; --rango de los enteros que puede tomar b para 8 bits
        prod : OUT INTEGER RANGE 0 TO 4**N-1; --resultado maximo para la multiplicacin
        div  : OUT INTEGER RANGE 0 TO 2**N-1 --el resultado de la division sera del mismo rango de a y b
    );
    END COMPONENT;

    -- Señales internas para conectar con el DUT
    constant N : INTEGER := 8; -- Número de bits
    signal a_s : INTEGER RANGE 0 TO 2**N-1 := 0; -- se inicializa en cero para que el valor sea conocido
    signal b_s : INTEGER RANGE 0 TO 2**N-1 := 1; -- se inicializa en 1 para evitar indeterminacion
    signal prod_s : INTEGER RANGE 0 TO 4**N-1; --nuevamente se declara el rango maxmo para la senal
    signal div_s  : INTEGER RANGE 0 TO 2**N-1; --rango de la division 

begin

    -- Instanciación del DUT
    uut: multiplicador_divisor
        generic map (
            N => N -- se obtiene la instancia de N para el DUT
        )
        port map (      --se realiza el mapeo de las conexiones de los puertos instanciados con las senales
            a    => a_s,
            b    => b_s,
            prod => prod_s,
            div  => div_s
        );   

    -- Proceso para estímulos
    stim_proc: process
    begin		
        -- Aplicar diferentes combinaciones de `a` y `b`
        a_s <= 15; b_s <= 10;
        wait for 20 ns; -- prod = 150, div = 1

        a_s <= 20; b_s <= 4;
        wait for 20 ns; -- prod = 80, div = 4

        a_s <= 50; b_s <= 3;
        wait for 20 ns; -- prod = 150, div = 16

       
        a_s <= 8; b_s <= 5;
        wait for 20 ns; -- prod = 40, div = 1

        -- Casos límite: valores máximos
        a_s <= 255; b_s <= 255;
        wait for 20 ns; -- prod = 65025, div = 1

        a_s <= 0; b_s <= 255;
        wait for 20 ns; -- prod = 0, div = 0

        a_s <= 255; b_s <= 1;
        wait for 20 ns; -- prod = 255, div = 255

        -- Finalizar simulación
        wait;
    end process;

end Behavioral;