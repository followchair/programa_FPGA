--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:06:28 01/23/2013
-- Design Name:   
-- Module Name:   C:/XilinxAriketak/EDK/DispositivoGuia/timer_200ms_tb.vhd
-- Project Name:  DispositivoGuia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timer_200ms
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY timer_200ms_tb IS
END timer_200ms_tb;
 
ARCHITECTURE behavior OF timer_200ms_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timer_200ms
    PORT(
         En : IN  std_logic;
         clk_señal_100ms : IN  std_logic;
         rst : IN  std_logic;
         señal_200ms : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal En : std_logic := '0';
   signal clk_señal_100ms : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal señal_200ms : std_logic;

   -- Clock period definitions
   constant clk_señal_100ms_period : time := 200 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timer_200ms PORT MAP (
          En => En,
          clk_señal_100ms => clk_señal_100ms,
          rst => rst,
          señal_200ms => señal_200ms
        );

   -- Clock process definitions
   clk_señal_100ms_process :process
   begin
		clk_señal_100ms <= '0';
		wait for clk_señal_100ms_period/2;
		clk_señal_100ms <= '1';
		wait for clk_señal_100ms_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst<='1';
		En<='0';
		wait for 100 ns;	
		rst<='0';
		wait for 1 us;
		En<='1';
		wait for 1 us;
		En<='0';
		wait for 1 us;
		En<='1';
      wait for clk_señal_100ms_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
