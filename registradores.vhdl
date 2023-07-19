 -- REGISTRADOR DE CARGA DE 1 BIT
 
library ieee;
use ieee.std_logic_1164.all;

entity reg_Carga_1bit is
    port(
        d        : in  std_logic;
        clk      : in  std_logic;
        cl, pr   : in  std_logic;
        nrw      : in  std_logic;
        s        : out std_logic
    ); 
end reg_Carga_1bit;

architecture reg1_1bit of reg_Carga_1bit is
    component ffd is
        port(
            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;
    
    component mux2x1 is 
    port(
        a, b, sel : in std_logic;
        s         : out std_logic
    );

    end component;

    signal datain, dataout : std_logic; 

begin
    s <= dataout;
    u_mux : mux2x1 port map(dataout, d, nrw, datain);
    u_reg : ffd port map(datain, clk, pr, cl, dataout);
  

end architecture;

 -- REGISTRADOR DE 2 BITS

library ieee;
use ieee.std_logic_1164.all;

entity reg_Carga_2bit is 
    port(
        d      : in std_logic_vector(1 downto 0);
        clk    : in std_logic;
        pr, cl : in std_logic;
        nrw    : in std_logic;
        s      : out std_logic_vector(1 downto 0)
    );
end entity;

architecture regCarga2bit of reg_Carga_2bit is

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


-- REGISTRADOR COM CARGA 8 BITS

library ieee;
use ieee.std_logic_1164.all;

entity reg_Carga_8bit is 
    port(
        data_in  : in std_logic_vector(7 downto 0);
        clk      : in std_logic;
        pr, cl   : in std_logic;
        nrw      : in std_logic;
        data_out : out std_logic_vector(7 downto 0)
    );
end entity;     

architecture regCarga of reg_Carga_8bit is                                                     

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
    u_reg0 : regCarga1bit port map(data_in(0), clk, pr, cl, nrw, data_out(0));
    u_reg1 : regCarga1bit port map(data_in(1), clk, pr, cl, nrw, data_out(1));   
    u_reg2 : regCarga1bit port map(data_in(2), clk, pr, cl, nrw, data_out(2));   
    u_reg3 : regCarga1bit port map(data_in(3), clk, pr, cl, nrw, data_out(3));
    u_reg4 : regCarga1bit port map(data_in(4), clk, pr, cl, nrw, data_out(4));
    u_reg5 : regCarga1bit port map(data_in(5), clk, pr, cl, nrw, data_out(5));
    u_reg6 : regCarga1bit port map(data_in(6), clk, pr, cl, nrw, data_out(6));
    u_reg7 : regCarga1bit port map(data_in(7), clk, pr, cl, nrw, data_out(7));       
    


end architecture; 