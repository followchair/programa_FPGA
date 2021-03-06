--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:45 01/23/2013
-- Design Name:   
-- Module Name:   C:/XilinxAriketak/EDK/DispositivoGuia/DivFreq_10Hz_tb.vhd
-- Project Name:  DispositivoGuia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DivFreq_10Hz
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
 
ENTITY DivFreq_10Hz_tb IS
END DivFreq_10Hz_tb;
 
ARCHITECTURE behavior OF DivFreq_10Hz_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DivFreq_10Hz
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         En : IN  std_logic;
         clk10Hz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal En : std_logic := '0';

 	--Outputs
   signal clk10Hz : std_logic;

   -- Clock period definitions
   constant clk_period : time := 25 ns; -- clock de 40 MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DivFreq_10Hz PORT MAP (
          clk => clk,
          rst => rst,
          En => En,
          clk10Hz => clk10Hz
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
		En<='0';
		wait for 100 ns;	
		rst<='0';
		wait for 45 us;
		En<='1';
		wait for 45 us;	
		En<='0';
      wait for clk_period*10;

      -- insert stimulus here 
		
      wait;
   end process;

END;
