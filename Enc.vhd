Library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Enc is   

port (
  k0,k1:  in std_logic_vector (7 downto 0);
  d0,d1: in std_logic_vector (7 downto 0);  

  d0_out: out std_logic_vector (15 downto 0)

);
end entity;

architecture myImp of Enc is 
CONSTANT delta : std_logic_vector(15 downto 0) := X"9E37";
signal w1,w2,w3,w4,w5,w6,w7 : std_logic_vector(15 downto 0);
begin

w1 <= std_logic_vector(unsigned("00000000"&d1) sll 2);
w2 <= std_logic_vector(unsigned(w1) + unsigned(k0));
w3 <= std_logic_vector(unsigned(d1) + unsigned(delta));
w4 <= std_logic_vector(unsigned("00000000"&d1) srl 3);
w5 <= std_logic_vector(unsigned(w4) + unsigned(k1));
w6 <= w2 xor w3;
w7 <= w6 xor w5;
d0_out <= std_logic_vector(unsigned(d0) + unsigned(w7));



end myImp;
