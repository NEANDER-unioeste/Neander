library ieee;
use ieee.std_logic_1164.all;

entity RED_mar is 
    port(
        end_in  : in std_logic_vector(7 downto 0);
        clk     : in std_logic;
        pr, cl      : in std_logic;
        nrw     : in std_logic;
        end_out : out std_logic_vector(7 downto 0)
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
    u_reg0 : regCarga1bit port map(end_in => end_in(0), end_out => end_out(0), clk => clk, pr => pr, cl => cl, nrw => nrw);
    
    u_reg1 : regCarga1bit port map(end_in => end_in(1), end_out => end_out(1), clk => clk, pr => pr, cl => cl, nrw => nrw);   

    u_reg2 : regCarga1bit port map(end_in => end_in(2), end_out => end_out(2), clk => clk, pr => pr, cl => cl, nrw => nrw);   
    u_reg3 : regCarga1bit port map(end_in => end_in(3), end_out => end_out(3), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg4 : regCarga1bit port map(end_in => end_in(4), end_out => end_out(4), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg5 : regCarga1bit port map(end_in => end_in(5), end_out => end_out(5), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg6 : regCarga1bit port map(end_in => end_in(6), end_out => end_out(6), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg7 : regCarga1bit port map(end_in => end_in(7), end_out => end_out(7), clk => clk, pr => pr, cl => cl, nrw => nrw);       
    


end architecture; 