Library ieee;
use ieee.std_logic_1164.all;

entity Pipe_Enc is   

port (
  clk, arst: in std_logic; 
  din: in std_logic_vector (15 downto 0); 
  key:  in std_logic_vector (31 downto 0); 

  CipherOut: out std_logic_vector (31 downto 0) 

);
end entity;

architecture myImp of Pipe_Enc is 

component Enc is   

port (
  k0,k1:  in std_logic_vector (7 downto 0);
  d0,d1: in std_logic_vector (7 downto 0);  

  d0_out: out std_logic_vector (15 downto 0)  

);
end component;

component bufferr is 

port (
  clk, arst: in std_logic;  
  k01,k11,k21,k31:  in std_logic_vector (7 downto 0);
  d01,d11: in std_logic_vector (7 downto 0);  
  d0_out1: in std_logic_vector (15 downto 0); 
  k02,k12,k22,k32:  out std_logic_vector (7 downto 0);
  d02,d12: out std_logic_vector (7 downto 0);
  d0_out2: out std_logic_vector (15 downto 0)  

);
end component;

signal k01,k11,k21,k31,d01,d11,d02,d12,k02,k12,k22,k32 : std_logic_vector(7 downto 0);
signal d0_out1,d0_out2,d1_out : std_logic_vector(15 downto 0);
begin
k01<=key(7 downto 0);
k11<=key(15 downto 8);
k21<=key(23 downto 16);
k31<=key(31 downto 24);
d01<=din(7 downto 0);
d11<=din(15 downto 8);

b1: bufferr PORT MAP(clk,arst,k01,k11,k21,k31,d01,d11,d0_out1,k02,k12,k22,k32,d02,d12,d0_out2);

e1: Enc PORT MAP(k01,k11,d01,d11,d0_out1);
e2: Enc PORT MAP(k22,k32,d12,d02,d1_out);

CipherOut <= d1_out&d0_out2;

end myImp;
