--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:43:18 01/23/2013
-- Design Name:   
-- Module Name:   C:/XilinxAriketak/EDK/DispositivoGuia/FSM_datasend_tb.vhd
-- Project Name:  DispositivoGuia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_datasend
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
 
ENTITY FSM_datasend_tb IS
END FSM_datasend_tb;
 
ARCHITECTURE behavior OF FSM_datasend_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_datasend
    PORT(
         Señal_100ms : IN  std_logic;
         Señal_200ms : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         B_On : IN  std_logic;
         B_Off : IN  std_logic;
         En_timer : OUT  std_logic;
         data : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Señal_100ms : std_logic := '0';
   signal Señal_200ms : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal B_On : std_logic := '0';
   signal B_Off : std_logic := '0';

 	--Outputs
   signal En_timer : std_logic;
   signal data : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_datasend PORT MAP (
          Señal_100ms => Señal_100ms,
          Señal_200ms => Señal_200ms,
          clk => clk,
          rst => rst,
          B_On => B_On,
          B_Off => B_Off,
          En_timer => En_timer,
          data => data
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst<='1';
		wait for 100 ns;	
		rst<='0';
--		wait for 100 ns;	
--		B_Off<='1';
		wait for 95 ns;	
		B_On<='1';
		wait for 1 us;
		Señal_100ms <= '1';
		wait for 100 ns;
		Señal_100ms <= '0';
		wait for 2 us;
		Señal_200ms <= '1';
		wait for 100 ns;
		Señal_200ms <= '0';
		wait for 2 us;
		Señal_200ms <= '1';
		wait for 100 ns;
		Señal_200ms <= '0';
		wait for 1 us;
		Señal_100ms <= '1';
		wait for 100 ns;
		Señal_100ms <= '0';
		wait for 100 ns;
		B_Off<='0';
		wait for 100 ns;
		B_Off<='1';
		wait for 1 us;
		Señal_100ms <= '1';
		wait for 100 ns;
		Señal_100ms <= '0';
		wait for 2 us;
		Señal_200ms <= '1';
		wait for 100 ns;
		Señal_200ms <= '0';
		wait for 2 us;
		Señal_200ms <= '1';
		wait for 100 ns;
		Señal_200ms <= '0';
		wait for 1 us;
		Señal_100ms <= '1';
		wait for 100 ns;
		Señal_100ms <= '0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
