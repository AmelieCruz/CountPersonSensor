library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity detector is port(
	clr, clk: in std_logic;
	sen: in std_logic_vector(1 downto 0);
	d: out std_logic_vector(2 downto 0);
	u: out std_logic_vector(3 downto 0)
);
end detector;

architecture aDetector of detector is
type estados is(q0,q1,q2,q3,q4,q5,q6,q7);
signal act, sig: estados;
signal sal: std_logic_vector(1 downto 0);
begin 
	process (clk, clr) 
		begin
		if(clr='1') then
			act<= q0;
			d<=(others =>'0');
			u<=(others =>'0');
		elsif(rising_edge(clk))then
			act<=sig;
			case sal is
				when "00"=>
					d<=d;
					u<=u;
				when "01"=>
					if(u = "1001") then
						u <="0000";
						d<= d+1;
					else 
						u<=u+1;
					end if;
				when "10" =>
					if(u="0000")then
						u<="1001";
						d<=d-1;
					else 
						u<=u-1;
					end if;
				 when others =>
					d<=(others =>'-');
					u<=(others =>'-');
			end case;


		end if;
	end process;
	process (sen, act) 
	begin
		case act is
			when q0 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q1;
				else
					sal <= "00";
					sig<= q7;
				end if;
			when q1 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q1;
				else
					sal <= "00";
					sig<= q2;
				end if;
			when q2 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q3;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q1;
				else
					sal <= "00";
					sig<= q2;
				end if;
			when q3 => 
				if(sen ="00") then
					sal <= "01";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q3;
				elsif(sen ="10") then
					sal <= "01";
					sig<= q1;
				else
					sal <= "00";
					sig<= q2;
				end if;
			when q4 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q1;
				else
					sal <= "00";
					sig<= q5;
				end if;
			when q5 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q6;
				else
					sal <= "00";
					sig<= q5;
				end if;
			when q6 => 
				if(sen ="00") then
					sal <= "10";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "10";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q6;
				else
					sal <= "00";
					sig<= q5;
				end if;
			when q7 => 
				if(sen ="00") then
					sal <= "00";
					sig<= q0;
				elsif(sen ="01") then
					sal <= "00";
					sig<= q4;
				elsif(sen ="10") then
					sal <= "00";
					sig<= q1;
				else
					sal <= "00";
					sig<= q7;
				end if;
			when others => 
				sig<= q0;
				sal<="00";
		end case;
	end process;
end aDetector;
