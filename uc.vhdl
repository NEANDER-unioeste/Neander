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

architecture arch of uc is

begin

end architecture ;