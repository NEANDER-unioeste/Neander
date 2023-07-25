library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port(
        Q : in std_logic_vector(2 downto 0);
        J : out std_logic_vector(2 downto 0);
        K : out std_logic_vector(2 downto 0)
    );
    
end entity;

architecture main of controle is
begin

    J(0) <= '1';
    K(0) <= not(Q(2)) and Q(1);
    J(1) <= Q(0);
    K(1) <= not(Q(0)) or Q(2);
    J(2) <= Q(1) and not(Q(0));
    K(2) <= not(Q(0)) or Q(1);
    
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        clk, reset : in std_logic;
        z          : out std_logic_vector(2 downto 0)
    );
end entity;

architecture main of contador is
    component controle is
        port(
            Q : in std_logic_vector(2 downto 0);
            J : out std_logic_vector(2 downto 0);
            K : out std_logic_vector(2 downto 0)
        );
    end component;

    component ffjk is
        port(
            j, k   : in std_logic;
            clock  : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

    signal sJ, sK, sQ, sNQ : std_logic_vector(2 downto 0);
    signal vcc : std_logic := '1';

begin
    u_CTRL: controle port map(sQ, sJ, sK);

    u_FFJK0 : ffjk port map(sJ(0), sK(0), clk, reset, vcc, sQ(0), sNQ(0));
    u_FFJK1 : ffjk port map(sJ(1), sK(1), clk, vcc, reset, sQ(1), sNQ(1));
    u_FFJK2 : ffjk port map(sJ(2), sK(2), clk, vcc, reset, sQ(2), sNQ(2));

    z <= sQ;
end architecture;