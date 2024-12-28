-- Implementación de un sumador de 32 bits basado en sumadores de 4 bits en cascada.
LIBRARY ieee; -- Se declara la biblioteca IEEE para usar tipos y funciones estándar
USE ieee.std_logic_1164.all; -- libreria que permite manejar señales `std_logic`

ENTITY big_adder IS
    -- Entidad que define las entradas y salidas del sumador de 32 bits.
    PORT (
        a, b: IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- Entradas de 32 bits para los operandos `a` y `b`.
        cin: IN STD_LOGIC; -- Entrada del acarreo de entrada.
        sum: OUT STD_LOGIC_VECTOR(31 DOWNTO 0); -- Salida del resultado de la suma.
        cout: OUT STD_LOGIC -- Salida del acarreo final.
    );
END big_adder;

ARCHITECTURE big_adder OF big_adder IS    -- Arquitectura del sumador.
    SIGNAL carry: STD_LOGIC_VECTOR(8 DOWNTO 0); -- Señales para los acarreos entre los sumadores de 4 bits.

    COMPONENT carry_lookahead_adder IS   -- Declaración del componente `carry_lookahead_adder`.
        PORT (
            a, b: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Entradas de 4 bits para los operandos `a` y `b`.
            cin: IN STD_LOGIC; -- Entrada del acarreo.
            sum: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Salida de la suma.
            cout: OUT STD_LOGIC -- Salida del acarreo.
        );
    END COMPONENT;

BEGIN
    carry(0) <= cin; -- El acarreo inicial es igual a la entrada `cin`.

    gen_adder: FOR i IN 1 TO 8 GENERATE -- Generación de instancias de sumadores de 4 bits en cascada.
        adder: carry_lookahead_adder PORT MAP (
            a(4*i-1 DOWNTO 4*i-4), -- Se mapea la porción de 4 bits correspondiente de `a`.
            b(4*i-1 DOWNTO 4*i-4), -- Se mapea la porción de 4 bits correspondiente de `b`.
            carry(i-1), -- Se conecta el acarreo del bloque anterior.
            sum(4*i-1 DOWNTO 4*i-4), -- Se conecta la porción de 4 bits de la salida `sum`.
            carry(i) -- Se conecta el acarreo generado por este bloque.
        );
    END GENERATE;

    cout <= carry(8); -- El acarreo final es el último acarreo generado.

END big_adder;

