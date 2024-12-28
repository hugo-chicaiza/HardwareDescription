library IEEE; --libreria
use IEEE.STD_LOGIC_1164.ALL; --Paquete de libreria

PACKAGE my_package IS
    FUNCTION bcd_to_ssd (bcd: INTEGER) RETURN std_logic_vector; --Declaracion para usar la funcion
END my_package;

PACKAGE BODY my_package IS
    FUNCTION bcd_to_ssd (bcd: INTEGER) RETURN std_logic_vector IS --Direccionamiento Integer
        TYPE memory IS ARRAY (0 TO 9) OF std_logic_vector(6 DOWNTO 0);  
         -- creo un tipo de dato personalizado denomidado memory
         -- este es un arreglo Unidimensional de vectores con 7 bits
        CONSTANT rom: memory := (--abcdefg
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
    BEGIN
        RETURN rom(bcd);  --Asigno a data los valores almacenados 
    END bcd_to_ssd;
END my_package;
