library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memoria is 
    port(
        interface_barramento : inout std_logic_vector(7 downto 0);
        end_PC               : in std_logic_vector(7 downto 0);
        end_Barr             : in std_logic_vector(7 downto 0);
        nbarr_PC             : in std_logic;
        rem_rw               : in std_logic;
        mem_rw               : in std_logic;
        rdm_rw               : in std_logic;
        clk                  : in std_logic;
        cl                   : in std_logic
    );
end entity;

architecture mem of memoria is  

    component reg_Carga_8bit is 
        port(
            data_in  : in std_logic_vector(7 downto 0);
            clk      : in std_logic;
            pr, cl   : in std_logic;
            nrw      : in std_logic;
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;  

    component as_ram is
        port(
            addr  : in    std_logic_vector(7 downto 0);
            data  : inout std_logic_vector(7 downto 0);
            notrw : in    std_logic;
            reset : in    std_logic
        );
    end component as_ram;

    signal s_mux2rem, s_rem2mem, s_mem2rdm , s_rdm2barr: std_logic_vector(7 downto 0); 
    
    begin
        
        interface_barramento <= s_rdm2barr when mem_rw = '0' else (others => 'Z');
        s_mem2rdm <= interface_barramento when mem_rw = '1' else (others => 'Z');

        s_mux2rem <= end_PC when nbarr_PC = '1' else end_Barr;
       
        u_mem : as_ram port map(s_rem2mem, s_mem2rdm, mem_rw, cl);
        u_rem : reg_Carga_8bit port map(s_mux2rem, clk, '1', cl, rem_rw,s_rem2mem);
        u_rdm : reg_Carga_8bit port map(s_mem2rdm, clk, '1', cl, rdm_rw, s_rdm2barr);

end architecture;