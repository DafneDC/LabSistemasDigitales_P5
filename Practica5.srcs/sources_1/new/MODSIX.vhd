----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2021 03:39:37 PM
-- Design Name: 
-- Module Name: MODSIX - Behavioral
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

entity MODSIX is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end MODSIX;

architecture Behavioral of MODSIX is

component FlipFlopJK is
port(SN, RN, J, K, CLK: in std_logic;
            Q, QN: out std_logic);
end component;

signal Reset2, JKE1, JKE2: std_logic;
signal not2: std_logic_vector(2 downto 0);
signal aux: std_logic_vector(2 downto 0);

begin
JKE1 <= aux(0) and JKS;
JKE2 <= JKE1 and aux(1);
Reset2 <= not(((not aux(0)) AND aux(1) AND aux(2)) OR Reset); --011 110

JK1: FlipFlopJK port map('1', Reset2, JKS, JKS, CLK, aux(0), not2(0));
JK2: FlipFlopJK port map('1', Reset2, JKE1, JKE1, CLK, aux(1), not2(1));
JK3: FlipFlopJK port map('1', Reset2, JKE2, JKE2, CLK, aux(2), not2(2));

Cuenta(0) <= aux(0);
Cuenta(1) <= aux(1);
Cuenta(2) <= aux(2);
Cuenta(3) <= '0';


end Behavioral;
