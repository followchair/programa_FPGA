----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:43 01/23/2013 
-- Design Name: 
-- Module Name:    principal - Behavioral 
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

entity principal is
    Port ( switch : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Emisor : out  STD_LOGIC_VECTOR (4 downto 0));
end principal;

architecture Behavioral of principal is

component FSM_Boton is
	Port ( B_onOff : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           generar_data : out  STD_LOGIC);
end component;

component timer_100ms is
Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           En : in  STD_LOGIC;
           señal_100ms : out  STD_LOGIC);
end component;

component timer_200ms is
 Port ( En : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			   clk : in  STD_LOGIC;
           señal_200ms : out  STD_LOGIC);
end component;

component FSM_datasend is
Port ( Señal_100ms : in  STD_LOGIC;
			  Señal_200ms : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           generar_data : in  STD_LOGIC;
			  En_timer : out  STD_LOGIC;
           data : out  STD_LOGIC);
end component;

component mux is
Port ( data_on : in  STD_LOGIC;
           data_off : in  STD_LOGIC;
           Sel : in  STD_LOGIC;
           data_out : out  STD_LOGIC);
end component;

signal s_en_data, s_enable, s_100ms, s_200ms, s_data, s_dataEmisor : STD_LOGIC;

begin

U1: FSM_Boton port map
(	B_onOff => switch,
	clk => clk,
	rst => rst,
	generar_data => s_en_data
);

U2: timer_100ms port map
(	clk => clk,
   rst => rst,
   En => s_enable,
   señal_100ms => s_100ms
);

U3: timer_200ms port map
(	rst => rst,
	clk => clk,
   En => s_enable,
   señal_200ms => s_200ms
);

U4: FSM_datasend port map
(	Señal_100ms => s_100ms,
	Señal_200ms => s_200ms,
   clk => clk,
   rst => rst,
   generar_data => s_en_data,
	En_timer => s_enable,
   data => s_data
);

U5: mux port map
(	data_on => s_data,
   data_off => (not s_data),
   Sel => switch,
   data_out => s_dataEmisor
);

emisor(0)<= s_dataEmisor;
emisor(1)<= s_dataEmisor;
emisor(2)<= s_dataEmisor;
emisor(3)<= s_dataEmisor;
emisor(4)<= s_dataEmisor;

end Behavioral;

