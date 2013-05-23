----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:48:10 01/22/2013 
-- Design Name: 
-- Module Name:    FSM_Boton - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_Boton is
    Port ( B_onOff : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  generar_data : out  STD_LOGIC);
end FSM_Boton;

architecture Behavioral of FSM_Boton is

type opciones is (C_OFF, C_ON, DATA);
signal estado: opciones;


begin

process (clk,rst)
begin
	if rst = '1' then
			estado<=C_OFF;
	elsif clk'event and clk = '1' then
		case estado is
			when C_OFF => 
				if B_onOff = '1' then
					estado<=DATA;
				end if;
			when DATA => 
				if B_onOff = '1' then
					estado<=C_ON;
				else
					estado<=C_OFF;
				end if;
			when C_ON =>
				if B_onOff = '0' then
					estado<=DATA;
				end if;
		end case;
	end if;
end process;

with estado select
generar_data <= '1' when DATA,
					 '0' when others;

end Behavioral;

