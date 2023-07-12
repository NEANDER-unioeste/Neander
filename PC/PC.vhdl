library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
    port(
        nbarr_inc            : in std_logic;
        PC_rw                : in std_logic;
        clk, cl              : in std_logic;
        interface_barramento : inout std_logic_vector(7 downto 0);
        saida                : in std_logic_vector(7 downto 0)
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
    end mux2x8;

    component pc is 
        port(
            d      : in std_logic_vector(7 downto 0);
            clk    : in std_logic;
            pr, cl : in std_logic;
            nrw    : in std_logic;
            s      : out std_logic_vector(7 downto 0)
        );
    end component;

    component add8bits is
        port(
            canal_x : in std_logic_vector(7 downto 0);
            canal_y : in std_logic_vector(7 downto 0);
            canal_cinn : in std_logic;
            canal_coutt : out std_logic;
            saida_somaa : out std_logic_vector(7 downto 0)
        );
    end component;

    begin

    signal s_mux2pc, sadd, s_PCatual :  std_logic_vector(7 downto 0);

    u_mux2x8 :  port map(interface_barramento, sadd, nbarr_inc, s_mux2pc);
    u_add    :  port map("00000001", s_PCatual, sadd); --lidar com in out do somador
    u_pc     :  port map(s_mux2pc, clk, '1', cl, PC_rw, saida);


end architecture;