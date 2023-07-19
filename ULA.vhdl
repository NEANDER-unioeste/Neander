library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ULA is 
    port(
        barramento : inout std_logic_vector(7 downto 0);
        mem_rw : in std_logic;
        AC_rw : in std_logic;
        ula_op : in std_logic_vector(2 downto 0);
        reset, clk : in std_logic;
        interface_flags : out std_logic_vector(1 downto 0)   
    );
end entity;

architecture ulona of ULA is
    
    component reg_Carga_8bit is 
        port(
            d      : in std_logic_vector(7 downto 0);
            clk    : in std_logic;
            pr, cl : in std_logic;
            nrw    : in std_logic;
            s      : out std_logic_vector(7 downto 0)
        );
    end component;

    component reg_Carga_2bit is 
        port(
            d      : in std_logic_vector(1 downto 0);
            clk    : in std_logic;
            pr, cl : in std_logic;
            nrw    : in std_logic;
            s      : out std_logic_vector(1 downto 0)
        );
    end component;

    component ulinha is
        port(
            x, y   : in std_logic_vector(7 downto 0);
            ulaOp  : in std_logic_vector(2 downto 0);
            s_ula  : out std_logic_vector(7 downto 0);
            nz     : out std_logic_vector(1 downto 0)
        );
    end component; 

    signal s_ula2ac, s_ac2ula : std_logic_vector(7 downto 0);
    signal s_ac2flags : std_logic_vector(1 downto 0);

    begin
        barramento <= s_ac2ula when mem_rw ='1' else (others => 'Z');

    u_ulinha    : ulinha port map(s_ac2ula, barramento, ula_op, s_ula2ac,s_ac2flags); 
    u_ac        : reg_Carga_8bit  port map(s_ula2ac, clk, '1', reset, AC_rw, s_ac2ula);
    u_flags     : reg_Carga_2bit port map(s_ac2flags, clk, '1', reset, AC_rw, interface_flags);

end architecture;