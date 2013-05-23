--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:10:56 01/22/2013
-- Design Name:   
-- Module Name:   C:/XilinxAriketak/EDK/DispositivoGuia/FSM_Boton_tb2.vhd
-- Project Name:  DispositivoGuia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FSM_Boton
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
 
ENTITY FSM_Boton_tb2 IS
END FSM_Boton_tb2;
 
ARCHITECTURE behavior OF FSM_Boton_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FSM_Boton
    PORT(
         B_on : IN  std_logic;
         B_off : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         OnOff : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B_on : std_logic := '0';
   signal B_off : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal OnOff : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FSM_Boton PORT MAP (
          B_on => B_on,
          B_off => B_off,
          clk => clk,
          rst => rst,
          OnOff => OnOff
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
		 wait for 100 ns; -- wait until global set/reset completes
			rst <= '1';
			wait for 100 ns; 
			rst <= '0';
			wait for 100 ns; 
			B_on <= '1';
			B_off <= '0';
			wait for 100 ns; 
			B_on <= '0';
			B_off <= '0';
			wait for 100 ns; 
			B_on <= '0';
			B_off <= '1';
			wait for 100 ns; 
			B_on <= '0';
			B_off <= '0';
			wait for 100 ns; 
			B_on <= '0';
			B_off <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
