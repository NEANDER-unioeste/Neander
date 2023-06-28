library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity opOR is
    port(
    x,y : in std_logic_vector(7 downto 0);
    s   : out std_logic_vector(7 downto 0);
);

architecture or of opOR is
     begin
        s(0) <= x(0) or y(0);
        s(1) <= x(1) or y(1);
        s(2) <= x(2) or y(2);
        s(3) <= x(3) or y(3);
        s(4) <= x(4) or y(4);
        s(5) <= x(5) or y(5);
        s(6) <= x(6) or y(6);
        s(7) <= x(7) or y(7);
end architecture;