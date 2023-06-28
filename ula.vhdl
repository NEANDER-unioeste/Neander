library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ula is
    port(
        x, y   : in std_logic_vector(7 downto 0);
        ulaOp  : in std_logic;
        s      : out std_logic_vector(7 downto 0)
    );
end entity;