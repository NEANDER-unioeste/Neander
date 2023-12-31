library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ulinha is
    port(
        x, y   : in std_logic_vector(7 downto 0);
        ulaOp  : in std_logic(2 downto 0);
        s_ula  : out std_logic_vector(7 downto 0);
        nz     : out std_logic_vector(1 downto 0)
    );
end entity; 

architecture ula of ulinha is

    component ac is 
    port(
        d      : in std_logic_vector(7 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(7 downto 0)
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

    signal s_not, s_and, s_or, s_add, s_saida: std_logic_vector(7 downto 0);

begin

    s_not <= not(x);
    s_and <= x and y;
    s_or <=  x or y;
    s_ula <= s_saida;

    u_add : ac     port map(x, y, "0", s_add); 
    u_nz  : nz     port map(s_saida, nz);
    u_ula : mux5x8 port map(s_not, s_and, s_or, s_add, y, ula0p, s_saída);

end architecture
