library ieee;
use ieee.std_logic_1164.all;

entity rdm is 
    port(
        data_in      : in std_logic_vector(7 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        data_out      : out std_logic_vector(7 downto 0)
    );
end entity;                                                                                                                                                                                                                                                                                                                                                                                                                                 

architecture regCarga of rdm is                                                     

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
    u_reg0 : regCarga1bit port map(data_in => data_in(0), data_out => data_out(0), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg1 : regCarga1bit port map(data_in => data_in(1), data_out => data_out(1), clk => clk, pr => pr, cl => cl, nrw => nrw);   
    u_reg2 : regCarga1bit port map(data_in => data_in(2), data_out => data_out(2), clk => clk, pr => pr, cl => cl, nrw => nrw);   
    u_reg3 : regCarga1bit port map(data_in => data_in(3), data_out => data_out(3), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg4 : regCarga1bit port map(data_in => data_in(4), data_out => data_out(4), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg5 : regCarga1bit port map(data_in => data_in(5), data_out => data_out(5), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg6 : regCarga1bit port map(data_in => data_in(6), data_out => data_out(6), clk => clk, pr => pr, cl => cl, nrw => nrw);
    u_reg7 : regCarga1bit port map(data_in => data_in(7), data_out => data_out(7), clk => clk, pr => pr, cl => cl, nrw => nrw);       
    


end architecture; 
