library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_neander is
end entity;

architecture tb_neander of tb_neander is

    constant clk_period: time := 20 ns;

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

    component UCzao is
        port(
            barramento          : in std_logic_vector(7 downto 0);
            flagNZ              : in std_logic_vector(1 downto 0);
            RI_nrw, cl, clk     : in std_logic;
            barramento_controle : out std_logic_vector(10 downto 0)
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

    signal sclk : std_logic := '1';
    signal sbarramento : std_logic_vector(7 downto 0);
    signal smem_rw : std_logic;
    signal sAC_rw : std_logic;
    signal sula_op : std_logic_vector(2 downto 0);
    signal sreset : std_logic;
    signal sinterface_flags : std_logic_vector(1 downto 0);
    signal sflagNZ : std_logic_vector(1 downto 0);
    signal sRI_nrw, scl, sclk2 : std_logic;
    signal sbarramento_controle : std_logic_vector(10 downto 0);
    signal send_PC, send_Barr : std_logic_vector(7 downto 0);
    signal snbarr_PC, srem_rw, srdm_rw : std_logic;

begin
    u_ULA : ULA port map(
        sbarramento,
        smem_rw,
        sAC_rw,
        sula_op,
        sreset,
        sclk,
        sinterface_flags
    );

    u_UCzao : UCzao port map(
        sbarramento,
        sflagNZ,
        sRI_nrw,
        scl,
        sclk2,
        sbarramento_controle
    );

    u_MEM : MEM port map(
        sbarramento,
        send_PC,
        send_Barr,
        snbarr_PC,
        srem_rw,
        smem_rw,
        srdm_rw,
        sclk,
        scl
    );

    testedabench : process
    begin

        scl <= '0';
        wait for clk_PERIOD;

        scl <= '1';
        wait for 666*clk_PERIOD;
        wait;
        end process;

        p_clock_n : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2;
    end process;

end architecture;