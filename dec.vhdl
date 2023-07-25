library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decodificador is
    port(
        entrada : std_logic_vector(7 downto 0);
        NOP     : out std_logic;
        zADD    : out std_logic;
        STA     : out std_logic;
        LDA     : out std_logic;
        zOR     : out std_logic;
        zAND    : out std_logic;
        zNOT    : out std_logic;
        JMP     : out std_logic;
        JN      : out std_logic;
        JZ      : out std_logic;
        HLT     : out std_logic
    );
end entity;

architecture dec of decodificador is
begin
    NOP <= '1' when (entrada = "00000001") else '0';

    STA <= '1' when (entrada = "00000010") else '0';
    
    LDA <= '1' when (entrada = "00000011") else '0';

    zADD <= '1' when (entrada = "00000100") else '0';

    zOR  <= '1' when (entrada = "00000101") else '0';

    zAND <= '1' when (entrada = "00000110") else '0';

    zNOT <= '1' when (entrada = "00000111") else '0';

    JMP <= '1' when (entrada = "00001000") else '0';

    JN  <= '1' when (entrada = "00001001") else '0';

    JZ  <= '1' when (entrada = "00001010") else '0';

    HLT <= '1' when (entrada = "00001011") else '0';
end architecture;