library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux5x8 is 
    port(
    i100 : in std_logic_vector(7 downto 0);
    i011 : in std_logic_vector(7 downto 0);
    i010 : in std_logic_vector(7 downto 0);
    i001 : in std_logic_vector(7 downto 0);
    i000 : in std_logic_vector(7 downto 0);
    sel  : in std_logic_vector(2 downto 0);
    s    : out std_logic_vector(7 downto 0)
);

