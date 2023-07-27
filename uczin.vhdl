library ieee;
use ieee.std_logic_1164.all;
 
entity contador is 
    port(
        clk   : in  std_logic;
        RESET : in  std_logic;
        VCC   : in  std_logic; 
        Sai   : out std_logic_vector (2 downto 0)
    );
end entity;
 
architecture contagem of contador is

    component ffjk is
        port(
            j, k   : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        ); 
    end component;

    component ctrl is
        port(
          q : in  std_logic_vector(2 downto 0);
          j : out std_logic_vector(2 downto 0);
          k : out std_logic_vector(2 downto 0)
        );
    end component;

    signal Q, notQ : std_logic_vector (2 downto 0); 
    signal J, K    : std_logic_vector (2 downto 0); 

    begin
        u_ctrl : ctrl port map(
        Q, J, K
        );

        u_bit0 : ffjk port map(
        J(0), K(0), clk, VCC, RESET, Q(0), notQ(0)
        );

        u_bit1 : ffjk port map(
        J(1), K(1), clk, VCC, RESET, Q(1), notQ(1)
        );

        u_bit2 : ffjk port map(
        J(2), K(2), clk, VCC, RESET, Q(2), notQ(2)
        );

        Sai <= Q;

end architecture;

--MODULO NOP
library ieee;
use ieee.std_logic_1164.all;

entity mod_NOP is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_NOP is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= '1';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(2)) and not(b(1)) and b(0); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not(b(2)) and not(b(1)) and not(b(0)); -- REM
    controle(1) <= not(b(2)) and not(b(1)) and b(0); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO STA
library ieee;
use ieee.std_logic_1164.all;

entity mod_STA is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_STA is
begin

    -- Barr

    controle(10) <= '1';
    controle(9) <= not b(2) or not b(0);

    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw

    controle(5) <= not b(1) and (b(2) xor b(0)); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= b(2) and b(1) and not b(0); -- MEM
    controle(2) <= (b(0) and (b(2) xor b(1))) or (not(b(2)) and not(b(1)) and not(b(0))); -- REM
    controle(1) <= not b(1) and (b(2) xor b(0)); -- RDM
    controle(0) <= not b(2) and b(1) and not b(0); -- RI


end architecture;

--MODULO LDA
library ieee;
use ieee.std_logic_1164.all;

entity mod_LDA is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_LDA is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= not(b(2)) or b(1) or not(b(0));
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(1)) and (b(2) xor b(0)); -- PC
    controle(4) <= b(2) and b(1) and b(0); -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= (not(b(1)) and (b(2) xnor b(0))) or (not(b(2)) and b(1) and b(0)); -- REM
    controle(1) <= (b(2) and not(b(0))) or (not(b(2)) and not(b(1)) and b(0)); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO ADD
library ieee;
use ieee.std_logic_1164.all;

entity mod_ADD is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_ADD is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= not(b(2)) or b(1) or not(b(0));
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '1';
    -- !rw
    controle(5) <= not(b(1)) and (b(2) xor b(0)); -- PC
    controle(4) <= b(2) and b(1) and b(0); -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= (not(b(1)) and (b(2) xnor b(0))) or (not(b(2)) and b(1) and b(0)); -- REM
    controle(1) <= (b(2) and not(b(0))) or (not(b(2)) and not(b(1)) and b(0)); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO AND
library ieee;
use ieee.std_logic_1164.all;

entity mod_AND is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_AND is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= not(b(2)) or b(1) or not(b(0));
    -- OP
    controle(8) <= '0';
    controle(7) <= '1';
    controle(6) <= '1';
    -- !rw
    controle(5) <= not(b(1)) and (b(2) xor b(0)); -- PC
    controle(4) <= b(2) and b(1) and b(0); -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= (not(b(1)) and (b(2) xnor b(0))) or (not(b(2)) and b(1) and b(0)); -- REM
    controle(1) <= (b(2) and not(b(0))) or (not(b(2)) and not(b(1)) and b(0)); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO OR
library ieee;
use ieee.std_logic_1164.all;

entity mod_OR is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_OR is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= not(b(2)) or b(1) or not(b(0));
    -- OP
    controle(8) <= '0';
    controle(7) <= '1';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(1)) and (b(2) xor b(0)); -- PC
    controle(4) <= b(2) and b(1) and b(0); -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= (not(b(1)) and (b(2) xnor b(0))) or (not(b(2)) and b(1) and b(0)); -- REM
    controle(1) <= (b(2) and not(b(0))) or (not(b(2)) and not(b(1)) and b(0)); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO NOT
library ieee;
use ieee.std_logic_1164.all;

entity mod_NOT is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_NOT is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= '1';
    -- OP
    controle(8) <= '1';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(2)) and not(b(1)) and b(0); -- PC
    controle(4) <= b(2) and b(1) and b(0); -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not(b(2)) and not(b(1)) and not(b(0)); -- REM
    controle(1) <= not(b(2)) and not(b(1)) and b(0); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO JMP
library ieee;
use ieee.std_logic_1164.all;

entity mod_JMP is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_JMP is
begin

    -- Barr
    controle(10) <= not b(2) or (b(1) and not b(0));
    controle(9) <= '1';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not b(1) and b(0); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not b(2) and (b(1) xnor b(0)); -- REM (not b(2) and not b(1) and not b(0)) or (not b(2) and b(1) and b(0))
    controle(1) <= not b(1) and (b(2) xor b(0)); -- RDM
    controle(0) <= not b(2) and b(1) and not b(0); -- RI
end architecture;

--MODULO JN 
library ieee;
use ieee.std_logic_1164.all;

entity mod_JN is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_JN is
begin

    -- Barr
    controle(10) <= '1';
    controle(9) <= '1';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(2)) and b(0); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not(b(2)) and not(b(1)) and not(b(0)); -- REM
    controle(1) <= not(b(2)) and not(b(1)) and b(0); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO JZ
library ieee;
use ieee.std_logic_1164.all;

entity mod_JZ is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_JZ is
begin
    
    -- Barr
    controle(10) <= '1';
    controle(9) <= '1';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= not(b(2)) and b(0); -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= not(b(2)) and not(b(1)) and not(b(0)); -- REM
    controle(1) <= not(b(2)) and not(b(1)) and b(0); -- RDM
    controle(0) <= not(b(2)) and b(1) and not(b(0)); -- RI

end architecture;

--MODULO HLT
library ieee;
use ieee.std_logic_1164.all;

entity mod_HLT is
    port(
        b : in std_logic_vector(2 downto 0);
        controle : out std_logic_vector(10 downto 0)
    );
end entity;

architecture bhvr of mod_HLT is
begin

    -- Barr
    controle(10) <= '0';
    controle(9) <= '0';
    -- OP
    controle(8) <= '0';
    controle(7) <= '0';
    controle(6) <= '0';
    -- !rw
    controle(5) <= '0'; -- PC
    controle(4) <= '0'; -- AC
    controle(3) <= '0'; -- MEM
    controle(2) <= '0'; -- REM
    controle(1) <= '0'; -- RDM
    controle(0) <= '0'; -- RI

end architecture;

--------------------------------------------------UC PEQUENA---------------------------------------------
---------------------------------------------------------------------------------------------------------
library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity uc is
  port(
      entradaDEC : in std_logic_vector(10 downto 0);
      nz         : in std_logic_vector(1 downto 0);
      cl, clk    : in std_logic;
      saida      : out std_logic_vector(10 downto 0)
  );
end uc ; 

architecture UC of uc is

  component contador is
    port(
        clk, reset : in std_logic;
        z          : out std_logic_vector(2 downto 0)
    );
  end component;
  
  component mod_NOP is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;
  
  component mod_STA is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_LDA is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_ADD is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_AND is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_OR is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_NOT is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_JMP is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_JN is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_JZ is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  component mod_HLT is
    port(
      b : in std_logic_vector(2 downto 0);
      controle : out std_logic_vector(10 downto 0)
    );
  end component;

  signal sCounter : std_logic_vector (2 downto 0);
  signal sNop, sSta, sLda, sAdd, sAnd, sOr, sNot, sJmp, sJN, sJZ, sHLT, dec2uc : std_logic_vector(10 downto 0);

begin

  u_counter : contador port map(clk, cl, sCounter);
  u_NOP : mod_NOP port map(sCounter, sNOP);
  u_STA : mod_STA port map(sCounter, sSta);
  u_LDA : mod_LDA port map(sCounter, sLDA);
  u_AND : mod_AND port map(sCounter, sAND);
  u_ADD : mod_ADD port map(sCounter, sADD);
  u_OR  : mod_OR  port map(sCounter, sOR);
  u_NOT : mod_NOT port map(sCounter, sNot);
  u_HLT : mod_HLT port map(sCounter, sHLT);
  u_JMP : mod_JMP port map(sCounter, sJmp);
  u_JN  : mod_JN  port map(sCounter, sJN);
  u_JZ  : mod_JZ  port map(sCounter, sJZ);

  saida <=  sNop when dec2uc="10000000000" else
            sSta when dec2uc="01000000000" else
            sLda when dec2uc="00100000000" else
            sAdd when dec2uc="00010000000" else
            sAnd when dec2uc="00001000000" else
            sOr  when dec2uc="00000100000" else
            sNot when dec2uc="00000010000" else
            sJmp when dec2uc="00000001000" else

            sJmp when dec2uc = ("00000000100") and (NZ(1) = '1') else    
            sJN  when dec2uc = ("00000000100") and (NZ(1) = '0') else 

            sJMP when dec2uc = ("00000000010") and (NZ(0) = '1') else
            sJZ  when dec2uc = ("00000000010") and (NZ(0) = '0' ) else

            sJN  when dec2uc="00000000100" else
            sJZ  when dec2uc="00000000010" else
            sHlt when dec2uc="00000000001" else
            (others => 'Z');

end architecture;
