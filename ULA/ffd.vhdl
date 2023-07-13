library ieee;
use ieee.std_logic_1164.all; -- std_logic para detectar erros

entity ffd is
    port(
        d      : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
end entity;

architecture latch of ffd is
    component ffjk is
        port(
            j, k   : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic 
        );
    end component;

    signal sq  : std_logic := '0'; -- opcional -> valor inicial
    signal snq : std_logic := '1';
    signal nj  : std_logic;
begin

    u_td : ffjk port map(d, nj, clk, pr, cl, q, nq);
    nj <= not(d);

end architecture;
