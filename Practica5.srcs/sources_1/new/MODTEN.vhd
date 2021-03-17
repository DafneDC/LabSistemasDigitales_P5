----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2021 03:01:34 PM
-- Design Name: 
-- Module Name: MODTEN - Behavioral
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

entity MODTEN is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end MODTEN;

architecture Behavioral of MODTEN is
component FlipFlopJK is
port(SN, RN, J, K, CLK: in std_logic;
            Q, QN: out std_logic);
end component;

signal Reset2, JKE1, JKE2, JKE3: std_logic;
signal not2: std_logic_vector(3 downto 0);
signal aux: std_logic_vector(3 downto 0);

begin
JKE1 <= aux(0)and JKS;
JKE2 <= JKE1 and aux(1);
JKE3 <= JKE2 and aux(2);
Reset2 <= not(((not aux(0)) AND aux(1) AND (not aux(2)) AND aux(3)) OR Reset); --1010 

JK1: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=>JKS,K=> JKS, CLK=>CLK,Q=> aux(0),QN=> not2(0));
JK2: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=> JKE1,K=> JKE1,CLK=> CLK,Q=> aux(1),QN=> not2(1));
JK3: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=> JKE2,K=> JKE2,CLK=> CLK,Q=> aux(2),QN=> not2(2));
JK4: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=> JKE3,K=> JKE3,CLK=> CLK,Q=> aux(3),QN=> not2(3));

Cuenta(0) <= aux(0);
Cuenta(1) <= aux(1);
Cuenta(2) <= aux(2);
Cuenta(3) <= aux(3);

end Behavioral;
