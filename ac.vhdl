--registrador com carga de 8 bits
--usando 8 reg de 1 bit
library ieee;
use ieee.std_logic_1164.all;

entity ac is 
    port(
        d      : in std_logic_vector(7 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(7 downto 0)
    );
end entity;

architecture regCarga of ac is

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

    -- instâncias de regCarga1bit (8 vezes)
    u_reg0 : regCarga1bit port map(d => d(0), s => s(0), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg1 : regCarga1bit port map(d => d(1), s => s(1), clk => clk, pr => pr, cl => cl, nrw => nrw);   
    u_reg2 : regCarga1bit port map(d => d(2), s => s(2), clk => clk, pr => pr, cl => cl, nrw => nrw);   
    u_reg3 : regCarga1bit port map(d => d(3), s => s(3), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg4 : regCarga1bit port map(d => d(4), s => s(4), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg5 : regCarga1bit port map(d => d(5), s => s(5), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg6 : regCarga1bit port map(d => d(6), s => s(6), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg7 : regCarga1bit port map(d => d(7), s => s(7), clk => clk, pr => pr, cl => cl, nrw => nrw);       
    


end architecture;
