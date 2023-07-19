library ieee ;
use ieee.std_logic_1164.all ;

entity nz is
  port (
    datain : in std_logic_vector(7 downto 0);
    dnz : out std_logic_vector(1 downto 0)
  );
end entity;

architecture detector of nz is

begin

  dnz (0)<= not(datain(7) or datain(6) or datain(5) or datain(4) or datain(3) or datain(2) or datain(1) or datain(0));
  dnz (1)<= datain(7);

end architecture ;