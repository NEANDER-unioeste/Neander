 -- SOMADOR DE 1 BIT

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity somador_1bit is 
    port(
        canal_a : in std_logic;
        canal_b : in std_logic;
        canal_cin : in std_logic;
        canal_cout : out std_logic;
        saida_soma : out std_logic
    );

end entity;

architecture somando_1bit of somador_1bit is
begin

    saida_soma <= (canal_a xor canal_b) xor canal_cin;
    canal_cout <= (canal_a and canal_b) or (canal_a and canal_cin) or (canal_b and canal_cin);

end architecture;

-- SOMADOR DE 8 BITS

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity opADD is
    port(
        canal_x : in std_logic_vector(7 downto 0);
        canal_y : in std_logic_vector(7 downto 0);
        canal_cinn : in std_logic;
        canal_coutt : out std_logic;
        saida_somaa : out std_logic_vector(7 downto 0)
    );
end entity;
   
architecture somador_8bits of opADD is
    component somador_1bit
        port(
            canal_a : in std_logic;
            canal_b : in std_logic;
            canal_cin : in std_logic;
            canal_cout : out std_logic;
            saida_soma : out std_logic
        );
    end component;
        
    signal aux : std_logic_vector(7 downto 0);

begin

    u_somador1 : somador_1bit port map(canal_x(0), canal_y(0), canal_cinn, aux(0), saida_somaa(0));
    u_somador2 : somador_1bit port map(canal_x(1), canal_y(1), aux(0), aux(1), saida_somaa(1));
    u_somador3 : somador_1bit port map(canal_x(2), canal_y(2), aux(1), aux(2), saida_somaa(2));
    u_somador4 : somador_1bit port map(canal_x(3), canal_y(3), aux(2), aux(3), saida_somaa(3));
    u_somador5 : somador_1bit port map(canal_x(4), canal_y(4), aux(3), aux(4), saida_somaa(4));
    u_somador6 : somador_1bit port map(canal_x(5), canal_y(5), aux(4), aux(5), saida_somaa(5));
    u_somador7 : somador_1bit port map(canal_x(6), canal_y(6), aux(5), aux(6), saida_somaa(6));
    u_somador8 : somador_1bit port map(canal_x(7), canal_y(7), aux(6), aux(7), saida_somaa(7));
    canal_coutt <= aux(6) xor aux(7);

end architecture;