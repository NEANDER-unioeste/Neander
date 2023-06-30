library ieee;
use ieee.std_logic_1164.all;

entity reg_Carga_1bit is
    port(
        d        : in  std_logic;
        clk      : in  std_logic;
        cl, pr   : in  std_logic;
        q, nq    : out std_logic
    );
end reg_Carga_1bit;

architecture ff of ffD is
    signal s_snj,  s_snk   : std_logic;
    signal s_sns,  s_snr   : std_logic;
    signal s_sns2, s_snr2  : std_logic;
    signal s_eloS, s_eloR  : std_logic;
    signal s_eloQ, s_elonQ : std_logic;
    signal s_nClock        : std_logic;
begin
    
    q  <= not(pr and s_sns2 and s_elonQ);
    nq <= not(cl and s_snr2 and s_eloQ);

    s_nClock <= not(clk);
    
    s_snj <= not(d and clk and s_elonQ);
    s_snk <= not(not d and clk and s_eloQ);
    
    s_sns <= not(pr and s_snj and s_eloR);
    s_snr <= not(cl and s_snk and s_eloS);
    
    s_sns2 <= s_sns nand s_nClock;
    s_snr2 <= s_snr nand s_nClock;
    
    s_eloS <= s_sns; 
    s_eloR <= s_snr;
    
    s_eloQ  <= not(pr and s_sns2 and s_elonQ);
    s_elonQ <= not(cl and s_snr2 and s_eloQ);
    

end architecture;
