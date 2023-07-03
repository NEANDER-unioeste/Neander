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
        a, b, sel in std_logic;
        s out std_logic
    );

    end component;

    signal datain, dataout : std_logic; 

begin
    s <= dataout;
    u_mux : mux2x1 port map(dataout, d, nrw, datain);
    u_reg : ffd port map(datain, clk, pr, cl, dataout);
  

end architecture;
