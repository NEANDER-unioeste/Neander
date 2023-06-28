library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity opAND is
    port(
    x,y : in std_logic_vector(7 downto 0);
    s   : out std_logic_vector(7 downto 0);
);

architecture and of opAND is
     begin
        s(0) <= x(0) and y(0);
        s(1) <= x(1) and y(1);
        s(2) <= x(2) and y(2);
        s(3) <= x(3) and y(3);
        s(4) <= x(4) and y(4);
        s(5) <= x(5) and y(5);
        s(6) <= x(6) and y(6);
        s(7) <= x(7) and y(7);
end architecture;