----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:29 01/23/2013 
-- Design Name: 
-- Module Name:    DivFreq_10Hz - Behavioral 
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

entity DivFreq_10Hz is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           En : in  STD_LOGIC;
           señal_100ms : out  STD_LOGIC);
end DivFreq_10Hz;

architecture Behavioral of DivFreq_10Hz is

--signal s_clk10Hz: STD_LOGIC;
signal Cont: STD_LOGIC_VECTOR(21 downto 0);

begin
process ( clk, rst, En )
begin
	if (rst = '1') then
		Cont <= (others => '0');
	--	clk10Hz <='0';
	elsif clk'event and clk='1' then
		if En = '0' then
			Cont <= (others => '0');
		else
		--if Cont = 4000001 then
			if Cont = 401 then -- Para la SIMULACIÓN he reducido el tiempo a 10u seg
			--Cont <= (others => '0');
			Cont <="0000000000000000000010";
		--	s_clk1Hz <= not s_clk1Hz;
			--clk10Hz <= '1';
			else
				Cont <= Cont + 1;
			--	clk10Hz <= '0';
			end if;
		end if;
	end if;
end process;

with Cont select
señal_100ms <= '1' when "0000000000000110010001", --401!! SIMULATZEKO
			--'1' when "1111010000100100000001", --4000001
			  '0' when others;

end Behavioral;

