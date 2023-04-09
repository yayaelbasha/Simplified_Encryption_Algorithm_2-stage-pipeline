Library ieee;
use ieee.std_logic_1164.all;

entity bufferr is   

port (
  clk, arst: in std_logic;  
  k01,k11,k21,k31:  in std_logic_vector (7 downto 0);
  d01,d11: in std_logic_vector (7 downto 0);  
  d0_out1: in std_logic_vector (15 downto 0); 
  k02,k12,k22,k32:  out std_logic_vector (7 downto 0);
  d02,d12: out std_logic_vector (7 downto 0);
  d0_out2: out std_logic_vector (15 downto 0)   

);
end entity;

architecture myImp of bufferr is 
begin


PROCESS(clk)
 	BEGIN
	IF arst= '1' THEN 
		k02<="00000000";
		k12<="00000000";
		k22<="00000000";
		k32<="00000000";
		d0_out2<="0000000000000000";
		d12<="00000000";
	ELSIF rising_edge(clk) THEN 
		k02<=k01;
		k12<=k11;
		k22<=k21;
		k32<=k31;
		d0_out2<=d0_out1;
		d12<=d11;
		d02<=d01;

	END IF;
END PROCESS;

end myImp;
