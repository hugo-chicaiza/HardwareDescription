library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

 PACKAGE my_package IS
    FUNCTION bcd_to_ssd (SIGNAL bcd: INTEGER) RETURN std_logic_vector;
 END my_package;

 PACKAGE BODY my_package IS
    FUNCTION bcd_to_ssd (SIGNAL bcd: INTEGER) RETURN BIT_VECTOR IS
        TYPE memory IS ARRAY (0 TO 9) OF BIT_VECTOR(6 DOWNTO 0);
    CONSTANT rom: memory := (
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
        RETURN rom(bcd);
    END bcd_to_ssd;
END my_package;
