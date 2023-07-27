library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity neander is
    port(
        rst : in std_logic;
        clk : in std_logic
    );
end entity;

architecture neander_pc of neander is
    
    component UCzao is
        port(
            barramento          : in std_logic_vector(7 downto 0);
            flagNZ              : in std_logic_vector(1 downto 0);
            RI_nrw, cl, clk     : in std_logic;
            barramento_controle : out std_logic_vector(10 downto 0)
        );
    end component;

    component ULA is 
        port(
            barramento : inout std_logic_vector(7 downto 0);
            mem_rw : in std_logic;
            AC_rw : in std_logic;
            ula_op : in std_logic_vector(2 downto 0);
            reset, clk : in std_logic;
            interface_flags : out std_logic_vector(1 downto 0)   
        );
    end component;

    component MEM is 
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
    end component;

    component PCzao is
        port(
            nbarr_inc            : in std_logic;
            PC_rw                : in std_logic;
            clk, cl              : in std_logic;
            interface_barramento : inout std_logic_vector(7 downto 0);
            s_endPC2MEM          : out std_logic_vector(7 downto 0)
        );
    end component;
    
    signal barramento : std_logic_vector(7 downto 0); --Barramento principal
    signal s_bctrl : std_logic_vector(10 downto 0); --Barramento controle
    signal s_endPC : std_logic_vector(7 downto 0); -- Saida PC
    signal flagsNZ : std_logic_vector(1 downto 0); -- Flags negativo e zero

begin

    -- ULA
    ula_modulo  : ULA port map(barramento,s_bctrl(3),s_bctrl(4),s_bctrl(8 downto 6),rst,clk,flagsNZ);

    -- MEM
    mem_modulo  : MEM port map(barramento, s_endPC, barramento, s_bctrl(9), s_bctrl(2), s_bctrl(3), s_bctrl(1), clk, rst);

    -- PC
    pc_modulo   : PCzao port map(s_bctrl(10), s_bctrl(5),  clk, rst, barramento, s_endPC );

    -- UC
    uc_modulo   : UCzao port map(barramento, flagsNZ, s_bctrl(0), rst, clk, s_bctrl);

end architecture;