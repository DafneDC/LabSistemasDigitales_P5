----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2021 03:44:28 PM
-- Design Name: 
-- Module Name: reloj-alarma - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reloj-alarma is
    Port ( clk_in : in STD_LOGIC;
           hrs_dec : out STD_LOGIC_VECTOR (3 downto 0);
           hrs_uni : out STD_LOGIC_VECTOR (3 downto 0);
           min_dec : out STD_LOGIC_VECTOR (3 downto 0);
           min_uni : out STD_LOGIC_VECTOR (3 downto 0);
           seg_dec : out STD_LOGIC_VECTOR (3 downto 0);
           seg_uni : out STD_LOGIC_VECTOR (3 downto 0));
end reloj-alarma;

architecture Behavioral of reloj-alarma is

begin


end Behavioral;
