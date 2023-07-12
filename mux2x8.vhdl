library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2x8 is 
    port(
        x   : in std_logic_vector(7 downto 0);
        y   : in std_logic_vector(7 downto 0);
        sel : in std_logic;
        s   : out std_logic_vector(7 downto 0)
    );
end mux5x8;

architecture mux of mux2x8 is 
begin
    
    s <= x when sel = "0";
    s <= y when sel = "1";

end mux;