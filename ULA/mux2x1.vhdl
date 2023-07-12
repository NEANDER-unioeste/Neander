library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2x1 is 
    port(
        a, b, sel : in std_logic;
        s         : out std_logic
    );

end entity;

architecture operacao of mux2x1 is

begin

    s <= a when sel = '0';
    s <= b when sel = '1';

end operacao;