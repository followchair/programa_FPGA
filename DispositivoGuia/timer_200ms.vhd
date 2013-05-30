----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:20 01/23/2013 
-- Design Name: 
-- Module Name:    timer_200ms - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timer_200ms is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           En : in  STD_LOGIC;
           señal_200ms : out  STD_LOGIC);
end timer_200ms;

architecture Behavioral of timer_200ms is

--signal Cont: STD_LOGIC_VECTOR(25 downto 0); --LED?
signal Cont: STD_LOGIC_VECTOR(23 downto 0); --ONA

begin
process ( clk, rst, En )
begin
	if (rst = '1') then
		Cont <= (others => '0');
	elsif clk'event and clk='1' then
		if En = '0' then
			Cont <= (others => '0');
		else
		if Cont = 12000001 then --ONA
			--if Cont = 1200 then -- Para la SIMULACIÓN he reducido el tiempo a 10u seg
			--if Cont = 60000000 then --LED
			Cont <="001111010000100100000000"; --ONA
			--Cont <="01001100010010110100000000"; --LED
			else
				Cont <= Cont + 1;
			end if;
		end if;
	end if;
end process;

with Cont select
señal_200ms <= --'1' when "11100100111000011100000000", --LED
				-- '1' when "0000000000010010110000", --1200!! SIMULATZEKO
		       '1' when "101101110001101100000001", --12000001 --ONA
			  '0' when others;

end Behavioral;
