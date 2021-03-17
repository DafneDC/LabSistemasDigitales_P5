------------------------------------------------------------------------------------
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

entity MOD3 is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
end MOD3;

architecture Behavioral of MOD3 is

component FlipFlopJK is
port(SN, RN, J, K, CLK: in std_logic;
            Q, QN: out std_logic);
end component;

signal Reset2, JKE1: std_logic;
signal not2: std_logic_vector(1 downto 0);
signal aux: std_logic_vector(1 downto 0);

begin
JKE1 <= aux(0) and JKS;
Reset2 <= not(( aux(1) AND aux(0)) OR Reset); --011

JK1: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=> JKS, K=>JKS,CLK=> CLK,Q=> aux(0),QN=> not2(0));
JK2: FlipFlopJK port map(SN=>'1',RN=> Reset2,J=> JKE1,K=>JKE1,CLK=>CLK,Q=>aux(1),QN=>not2(1));

Cuenta(0) <= aux(0);
Cuenta(1) <= aux(1);

end Behavioral;