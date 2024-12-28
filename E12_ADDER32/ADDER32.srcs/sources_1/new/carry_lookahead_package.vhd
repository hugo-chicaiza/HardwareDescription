-- Implementación de un sumador de 4 bits basado en carry-lookahead
LIBRARY ieee; -- Se declara la biblioteca IEEE para usar tipos y funciones estándar
USE ieee.std_logic_1164.all; -- libreria que permite manejar señales `std_logic`

ENTITY carry_lookahead_adder IS    -- Entidad del sumador de 4 bits.
    PORT (
        a, b: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Entradas de 4 bits para los operandos `a` y `b`.
        cin: IN STD_LOGIC; -- Entrada del acarreo de entrada (`carry-in`).
        sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Salida del resultado de la suma.
        cout: OUT STD_LOGIC -- Salida del acarreo final.
    );
END carry_lookahead_adder;

ARCHITECTURE structure OF carry_lookahead_adder IS
    -- Arquitectura estructural que define la implementación del sumador
    SIGNAL G, P, c: STD_LOGIC_VECTOR(3 DOWNTO 0); 
    -- Señales intermedias:
    -- `G` para generar acarreo (`Generate`)
    -- `P` para propagar acarreo (`Propagate`)
    -- `c` para los acarreos internos.

BEGIN
    -- Computación de las señales `G` y `P`.
    G <= a AND b; -- `G` se activa cuando ambos bits de `a` y `b` son 1
    P <= a XOR b; -- `P` se activa cuando `a` y `b` son diferentes

    -- Computación de los acarreos internos.
    c(0) <= cin; -- El acarreo inicial es `cin`.
    c(1) <= G(0) OR (P(0) AND cin); -- Fórmula para el segundo bit del acarreo.
    c(2) <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND cin); -- Fórmula para el tercer bit.
    c(3) <= G(2) OR (P(2) AND G(1)) OR (P(2) AND P(1) AND G(0)) OR (P(2) AND P(1) AND P(0) AND cin);
    -- Fórmula para el cuarto bit del acarreo.
    cout <= G(3) OR (P(3) AND G(2)) OR (P(3) AND P(2) AND G(1)) OR 
            (P(3) AND P(2) AND P(1) AND G(0)) OR (P(3) AND P(2) AND P(1) AND P(0) AND cin);
    -- Fórmula para el acarreo final.

    -- Computación de la salida de la suma.
    sum <= P XOR c; -- La suma es el XOR entre `P` y los acarreos.
END structure;

