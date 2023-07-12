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

    u_somador1 : somador_1bit port map(canal_a => canal_x(0), canal_b => canal_y(0), canal_cin => canal_cinn, canal_cout => aux(0), saida_soma => saida_somaa(0));
    u_somador2 : somador_1bit port map(canal_a => canal_x(1), canal_b => canal_y(1), canal_cin => aux(0), canal_cout => aux(1), saida_soma => saida_somaa(1));
    u_somador3 : somador_1bit port map(canal_a => canal_x(2), canal_b => canal_y(2), canal_cin => aux(1), canal_cout => aux(2), saida_soma => saida_somaa(2));
    u_somador4 : somador_1bit port map(canal_a => canal_x(3), canal_b => canal_y(3), canal_cin => aux(2), canal_cout => aux(3), saida_soma => saida_somaa(3));
    u_somador5 : somador_1bit port map(canal_a => canal_x(4), canal_b => canal_y(4), canal_cin => aux(3), canal_cout => aux(4), saida_soma => saida_somaa(4));
    u_somador6 : somador_1bit port map(canal_a => canal_x(5), canal_b => canal_y(5), canal_cin => aux(4), canal_cout => aux(5), saida_soma => saida_somaa(5));
    u_somador7 : somador_1bit port map(canal_a => canal_x(6), canal_b => canal_y(6), canal_cin => aux(5), canal_cout => aux(6), saida_soma => saida_somaa(6));
    u_somador8 : somador_1bit port map(canal_a => canal_x(7), canal_b => canal_y(7), canal_cin => aux(6), canal_cout => aux(7), saida_soma => saida_somaa(7));
    canal_coutt <= aux(6) xor aux(7);

end architecture;