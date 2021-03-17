----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2021 02:58:48 PM
-- Design Name: 
-- Module Name: MOD12 - Behavioral
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

entity MOD12 is  -- mod24
    Port ( CLK : in STD_LOGIC;
           JKSF : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (7 downto 0));
end MOD12;

architecture Behavioral of MOD12 is

--component FlipFlopJK is
--port(SN, RN, J, K, CLK: in std_logic;
 --           Q, QN: out std_logic);
--end component;

component MOD3 is
port( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (1 downto 0));
end component;



component MODTEN is
    Port ( CLK : in STD_LOGIC;
           JKS : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal aux: std_logic_vector(5 downto 0);
signal Reset2, Reset3, Reset4, not2: std_logic;

begin

Reset2 <= aux(0) AND (not aux(1)) AND (not aux(2)) AND aux(3) and JKSF; -- 1001
Reset3 <= (aux(5) AND aux(2)) OR Reset; -- 0010 0100 BCD     
Reset4 <= not ((aux(5) AND aux(2)) OR Reset);

--JK1: FlipFlopJK port map(SN=>'1', RN=>Reset4, J=>Reset2, K=>Reset2, CLK=>CLK, Q=>aux(4), QN=>not2);
MOD1: MODTEN port map (CLK=>CLK, JKS=>JKSF, Reset=>Reset3, Cuenta(3 downto 0)=>aux(3 downto 0));
MOD2: MOD3 port map (CLK=> CLK, JKS=>Reset2, Reset=>Reset3,Cuenta(1 downto 0)=>aux(5 downto 4)  );
Cuenta(7)<='0';
Cuenta(6)<='0';
Cuenta(5)<=aux(5);
Cuenta(4)<=aux(4);
Cuenta(3)<=aux(3);
Cuenta(2)<=aux(2);
Cuenta(1)<=aux(1);
Cuenta(0)<=aux(0);

end Behavioral;
