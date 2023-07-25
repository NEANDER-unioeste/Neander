library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
    port(
        nbarr_inc            : in std_logic;
        PC_rw                : in std_logic;
        clk, cl              : in std_logic;
        interface_barramento : inout std_logic_vector(7 downto 0);
        saida                : out std_logic_vector(7 downto 0)
    );
end entity;

architecture pc of PC is

    component mux2x8 is 
        port(
            x   : in std_logic_vector(7 downto 0);
            y   : in std_logic_vector(7 downto 0);
            sel : in std_logic;
            s   : out std_logic_vector(7 downto 0)
        );
    end component;

    component reg_Carga_8bit is 
        port(
            data_in  : in std_logic_vector(7 downto 0);
            clk      : in std_logic;
            pr, cl   : in std_logic;
            nrw      : in std_logic;
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    component opADD is
        port(
            canal_x : in std_logic_vector(7 downto 0);
            canal_y : in std_logic_vector(7 downto 0);
            canal_cinn : in std_logic;
            canal_coutt : out std_logic;
            saida_somaa : out std_logic_vector(7 downto 0)
        );
    end component;

    

    signal s_mux2pc, sadd, s_PCatual :  std_logic_vector(7 downto 0);
    signal s_opADD_cin, s_opADD_cout: std_logic;

    begin

    u_mux2x8 :  mux2X8 port map(interface_barramento, sadd, nbarr_inc, s_mux2pc);
    u_add    : opADD port map("00000001", s_PCatual, s_opADD_cin, s_opADD_cout, sadd);
    u_pc     :  reg_Carga_8bit port map(s_mux2pc, clk, '1', cl, PC_rw, saida);


end architecture;