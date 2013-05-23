--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:51 01/23/2013
-- Design Name:   
-- Module Name:   C:/XilinxAriketak/EDK/DispositivoGuia/principal_tb.vhd
-- Project Name:  DispositivoGuia
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: principal
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
 
ENTITY principal_tb IS
END principal_tb;
 
ARCHITECTURE behavior OF principal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT principal
    PORT(
         Boton_on : IN  std_logic;
         Boton_off : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         Emisor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Boton_on : std_logic := '0';
   signal Boton_off : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Emisor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: principal PORT MAP (
          Boton_on => Boton_on,
          Boton_off => Boton_off,
          clk => clk,
          rst => rst,
          Emisor => Emisor
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
		wait for 100 ns;	
		Boton_on<='1';
		wait for 100 ns;	
		Boton_on<='0';
		wait for 200 us;
		Boton_off<='1';
		wait for 100 ns;	
		Boton_off<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
