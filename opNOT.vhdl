library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity opNOT is
    port(
    x   : in std_logic_vector(7 downto 0);
    s   : out std_logic_vector(7 downto 0);
);

architecture not of opNOT is
     begin
        s(0) <= not(x(0));
        s(1) <= not(x(1));
        s(2) <= not(x(2));
        s(3) <= not(x(3));
        s(4) <= not(x(4));
        s(5) <= not(x(5));
        s(6) <= not(x(6));
        s(7) <= not(x(7));
end architecture;