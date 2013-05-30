----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:53:36 01/23/2013 
-- Design Name: 
-- Module Name:    timer_100ms - Behavioral 
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

entity timer_100ms is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           En : in  STD_LOGIC;
           señal_100ms : out  STD_LOGIC);
end timer_100ms;

architecture Behavioral of timer_100ms is

signal Cont: STD_LOGIC_VECTOR(21 downto 0); --ona
--signal Cont: STD_LOGIC_VECTOR(24 downto 0); --LED-akin Probatzeko

begin
process ( clk, rst, En )
begin
	if (rst = '1') then
		Cont <= (others => '0');
	elsif clk'event and clk='1' then
		if En = '0' then
			Cont <= (others => '0');
		else
		if Cont = 4000001 then --ona
			--if Cont = 20000001 then--LED
		--	if Cont = 401 then -- Para la SIMULACIÓN he reducido el tiempo a 10u seg
			Cont <="0000000000000000000010"; --ona
			--Cont <="0000000000000000000000010"; --LED
			else
				Cont <= Cont + 1;
			end if;
		end if;
	end if;
end process;

with Cont select
señal_100ms <= --'1' when "1001100010010110100000001", --20000001-LED
			--'1' when "0000000000000110010001", --401!! SIMULATZEKO
			'1' when "1111010000100100000001", --4000001 --ONA
			  '0' when others;

end Behavioral;

