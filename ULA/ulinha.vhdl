library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ulinha is
    port(
        x, y   : in std_logic_vector(7 downto 0);
        ulaOp  : in std_logic_vector(2 downto 0);
        s_ula  : out std_logic_vector(7 downto 0);
        nz     : out std_logic_vector(1 downto 0)
    );
end entity; 

architecture ula of ulinha is

    component opADD is
        port(
            canal_x : in std_logic_vector(7 downto 0);
            canal_y : in std_logic_vector(7 downto 0);
            canal_cinn : in std_logic;
            canal_coutt : out std_logic;
            saida_somaa : out std_logic_vector(7 downto 0)
        );
    end component;

    component mux5x8 is 
    port(
        i100 : in std_logic_vector(7 downto 0);
        i011 : in std_logic_vector(7 downto 0);
        i010 : in std_logic_vector(7 downto 0);
        i001 : in std_logic_vector(7 downto 0);
        i000 : in std_logic_vector(7 downto 0);
        sel  : in std_logic_vector(2 downto 0);
        s    : out std_logic_vector(7 downto 0)
    );
    end component;

    component nz is
        port (
          datain : in std_logic_vector(7 downto 0);
          dnz : out std_logic_vector(1 downto 0)
        );
    end component;

    signal s_not, s_and, s_or, s_add, s_resultado: std_logic_vector(7 downto 0);

begin

    s_not <= not(x);
    s_and <= x and y;
    s_or  <=  x or y;
    s_ula <= s_resultado;

    u_nz  : nz     port map(s_resultado, nz);
    u_ula : mux5x8 port map(s_not, s_and, s_or, s_add, y, ula0p, s_resultado);

end architecture;
