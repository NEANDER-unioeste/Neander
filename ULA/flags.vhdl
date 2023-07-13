library ieee;
use ieee.std_logic_1164.all;

entity flags is 
    port(
        d      : in std_logic_vector(1 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(1 downto 0)
    );
end entity;

architecture regCarga of flags is

    component regCarga1bit is
        port(
            d       : in  std_logic;
            clk     : in  std_logic;
            pr, cl  : in  std_logic;
            nrw     : in  std_logic;
            s       : out std_logic
        );
    end component;

begin

    -- instâncias de regCarga1bit (2 vezes)
    u_reg0 : regCarga1bit port map(d => d(0), s => s(0), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg1 : regCarga1bit port map(d => d(1), s => s(1), clk => clk, pr => pr, cl => cl, nrw => nrw);   

end architecture;
