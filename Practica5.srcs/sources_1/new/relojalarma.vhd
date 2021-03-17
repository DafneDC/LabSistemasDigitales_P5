----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2021 03:51:20 PM
-- Design Name: 
-- Module Name: relojalarma - Behavioral
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

entity relojalarma is
    Port ( clk_in : in STD_LOGIC;
           hrs_dec : out STD_LOGIC_VECTOR (3 downto 0);
           hrs_uni : out STD_LOGIC_VECTOR (3 downto 0);
           min_dec : out STD_LOGIC_VECTOR (3 downto 0);
           min_uni : out STD_LOGIC_VECTOR (3 downto 0);
           seg_dec : out STD_LOGIC_VECTOR (3 downto 0);
           seg_uni : out STD_LOGIC_VECTOR (3 downto 0));
end relojalarma;


architecture Behavioral of relojalarma is
component MOD60seg is
    Port ( CLK : in STD_LOGIC;
           JKSF : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MOD60min is
    Port ( CLK : in STD_LOGIC;
           JKSF : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component MOD12 is
    Port ( CLK : in STD_LOGIC;
           JKSF : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Cuenta : out STD_LOGIC_VECTOR (7 downto 0));
end component;

--component freq_divisor is
--port (
--	clk50mhz: 	in STD_LOGIC;
--	clk:		out STD_LOGIC
--);
--end component;
--component FlipFlopJK is
--port(SN, RN, J, K, CLK: in std_logic;
  --          Q, QN: out std_logic);
--end component;

--signal auxclk: std_logic;
signal aux: std_logic_vector(23 downto 0);
signal Reset2, Reset3: std_logic;
begin -- 5 -- 9 -- 0101 1001


Reset2 <= aux(0) AND aux(3) AND aux(4) AND aux(6); --0101 1001
Reset3 <= aux(8) AND aux(11) AND aux(12) AND aux(14)AND aux(0) AND aux(3) AND aux(4) AND aux(6); --
--Reset4 <= aux(20) AND aux(17);

--FREQ: freq_divisor port map (clk50mhz=> clk_in, clk=> auxclk);
HORAS: MOD12 port map (CLK=>clk_in, JKSF=>Reset3, Reset=>'0', Cuenta(7 downto 0)=>aux(23 downto 16));
MIN: MOD60min port map (CLK=>clk_in, JKSF=>Reset2, Reset=>'0', Cuenta(7 downto 0)=>aux(15 downto 8) );
SEG: MOD60seg port map (CLK=>clk_in, JKSF=>'1', Reset=>'0', Cuenta(7 downto 0)=>aux(7 downto 0));
--AMPM: FlipFlopJK port map(SN=>'1',RN=>'1',J=>'1',K=>'1',CLK=>Reset4);

hrs_dec <= aux(23 downto 20);
hrs_uni <= aux(19 downto 16);
min_dec <= aux(15 downto 12);
min_uni <= aux(11 downto 8);
seg_dec <= aux(7 downto 4);
seg_uni <= aux(3 downto 0);

end Behavioral;
