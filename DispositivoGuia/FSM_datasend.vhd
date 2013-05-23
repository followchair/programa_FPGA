----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:52 01/23/2013 
-- Design Name: 
-- Module Name:    FSM_datasend - Behavioral 
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

entity FSM_datasend is
    Port ( Señal_100ms : in  STD_LOGIC;
			  Señal_200ms : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           generar_data : in  STD_LOGIC;
			  En_timer : out  STD_LOGIC;
           data : out  STD_LOGIC);
end FSM_datasend;

architecture Behavioral of FSM_datasend is

type opciones is (ESPERAR_BOTON, SEND, SUMA);
signal estado: opciones;

signal cont: STD_LOGIC_VECTOR (2 downto 0);
--signal OnOff: STD_LOGIC; -- 1:ON		0:OFF

begin
process (clk, rst, generar_data, Señal_100ms, Señal_200ms)
begin
	if rst = '1' then
			estado<=ESPERAR_BOTON;
	elsif clk'event and clk = '1' then
		case estado is
			when ESPERAR_BOTON =>
				cont <= "100";
				En_timer <= '0';
				if generar_data='1' then
					cont<=(others => '0');
					En_timer <= '1';
					estado<=SEND;
				end if;
			when SEND =>
				if (cont = 0 or cont = 3) then
					--if Señal_100ms'event and Señal_100ms = '1' then
					if Señal_100ms = '1' then
						estado<=SUMA;
					end if;
				elsif (cont = 1 or cont = 2) then
					if Señal_200ms = '1' then
					--if Señal_200ms'event and Señal_200ms = '1' then
						estado<=SUMA;
					end if;
				end if;
			when SUMA =>
				if cont = 3 then
						estado<=ESPERAR_BOTON;
				else
					cont <= cont + 1;
					estado<=SEND;
				end if;
		end case;
	end if;
end process;

with cont select
data <=  '1' when "000",
			'1' when "010",
			'1' when "100",
			'0' when others;

end Behavioral;

