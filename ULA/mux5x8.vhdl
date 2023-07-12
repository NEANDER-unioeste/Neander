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
end mux5x8;

architecture mux of mux5x8 is 
begin
    
    s <= i000 when sel = "000"; --LDA
    s <= i001 when sel = "001"; --ADD
    s <= i010 when sel = "010"; --OR
    s <= i011 when sel = "011"; --AND
    s <= i100 when sel = "100"; --NOT

end mux;

