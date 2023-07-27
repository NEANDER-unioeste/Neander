library ieee;
use ieee.std_logic_1164.all; 

entity UCzao is
    port(
        barramento          : in std_logic_vector(7 downto 0);
        flagNZ              : in std_logic_vector(1 downto 0);
        RI_nrw, cl, clk     : in std_logic;
        barramento_controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture controle_modulo of UCzao is
    
    component reg_Carga_8bit is --RI
        port(
            data_in  : in std_logic_vector(7 downto 0);
            clk      : in std_logic;
            pr, cl   : in std_logic;
            nrw      : in std_logic;
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;  

    component decodificador is
        port(
            instrin : in std_logic_vector(7 downto 0);
            instrout: out std_logic_vector(10 downto 0)
        );
    end component;

    component uc is
        port(
            entradaDEC : in std_logic_vector(10 downto 0);
            nz         : in std_logic_vector(1 downto 0);
            cl, clk    : in std_logic;
            saida      : out std_logic_vector(10 downto 0)
        );
    end component ; 

    signal ri2decodificador : std_logic_vector(7 downto 0);
    signal decodificador2uc : std_logic_vector(10 downto 0);
    
    begin

    -- RI (reg carga 8 bits)
    RI_reg : reg_Carga_8bit port map(barramento, clk, '1' , cl, RI_nrw, ri2decodificador);

    -- Decodificador
    dec : decodificador port map(ri2decodificador,decodificador2UC);

    -- UC
    cu_comp : uc port map(decodificador2uc,flagNZ, cl, clk,barramento_controle);
    
end architecture controle_modulo;