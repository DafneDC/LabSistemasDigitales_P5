----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2021 02:40:37 PM
-- Design Name: 
-- Module Name: MOD60min - Behavioral
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

entity MOD60min is
    Port ( CLK : in STD_LOGIC;
           JKSF : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (7 downto 0));
end MOD60min;

architecture Behavioral of MOD60min is
component MODSIX is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MODTEN is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal aux: std_logic_vector(7 downto 0);
signal Reset2: std_logic;

begin

Reset2 <=  aux(0) AND (not aux(1)) AND (not aux(2)) AND aux(3) and JKSF;
MOD1: MODSIX port map(CLK=>CLK, JKS=>Reset2, Reset=>Reset, Cuenta(3 downto 0)=>aux(7 downto 4));
MOD2: MODTEN port map(CLK=>CLK, JKS=>JKSF, Reset=>Reset, Cuenta(3 downto 0)=>aux(3 downto 0));

Cuenta(7)<=aux(7);
Cuenta(6)<=aux(6);
Cuenta(5)<=aux(5);
Cuenta(4)<=aux(4);
Cuenta(3)<=aux(3);
Cuenta(2)<=aux(2);
Cuenta(1)<=aux(1);
Cuenta(0)<=aux(0);

end Behavioral;