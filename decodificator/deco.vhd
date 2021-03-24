library ieee;
use ieee.std_logic_1164.all;
entity deco is port(
	clr, clk: in std_logic;
	u: in std_logic_vector(3 downto 0);
	d: in std_logic_vector(2 downto 0);
	display: out std_logic_vector(6 downto 0);
	contAnillo: inout std_logic_vector(2 downto 0)
);
end deco;

architecture aDeco of deco is
constant Num0: std_logic_vector(6 downto 0):= "1111110";--7E
constant Num1: std_logic_vector(6 downto 0):= "0110000";--30
constant Num2: std_logic_vector(6 downto 0):= "1101101";--6D
constant Num3: std_logic_vector(6 downto 0):= "1111001";--79
constant Num4: std_logic_vector(6 downto 0):= "0110011";--33
constant Num5: std_logic_vector(6 downto 0):= "1011011";--5B
constant Num6: std_logic_vector(6 downto 0):= "1011111";--5F
constant Num7: std_logic_vector(6 downto 0):= "1110000";--70
constant Num8: std_logic_vector(6 downto 0):= "1111111";--7F
constant Num9: std_logic_vector(6 downto 0):= "1110011";--73
begin 
	process(clk, clr)
	begin 
		if(clr='1')then
			contAnillo<= "011";
			display <=(others =>'0');
		elsif(rising_edge(clk)) then
			contAnillo<=TO_STDLOGICVECTOR( TO_BITVECTOR(contAnillo) ROL 1);
		end if;
	end process;

	process (contAnillo, u, d) 
	begin 
		if(contAnillo ="110") then
			case u is
 		   		when "0000"=> display <= Num0;
	 		    when "0001"=> display <= Num1;
 			    when "0010"=> display <= Num2;
 			    when "0011"=> display <= Num3;
 		    	when "0100"=> display <= Num4;
	 		    when "0101"=> display <= Num5;
 			    when "0110"=> display <= Num6;
 			    when "0111"=> display <= Num7;
 		    	when "1000"=> display <= Num8;
	 		    when "1001"=> display <= Num9;
				when others=> display <=(others =>'-');
			end case;
		 elsif(contAnillo = "101") then
		 	case d is
 		 	    when "000"=> display <= Num0;
	 		    when "001"=> display <= Num1;
 			    when "010"=> display <= Num2;
 			    when "011"=> display <= Num3;
 		    	when "100"=> display <= Num4;
	 		    when "101"=> display <= Num5;
 			    when "110"=> display <= Num6;
 			    when "111"=> display <= Num7;
				when others=> display <=(others =>'-');
			end case;
		 else 
		 	display <= (others =>'0');
 		 end if;
	end process;
end aDeco;
