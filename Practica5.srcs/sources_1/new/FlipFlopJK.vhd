----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2021 03:32:29 PM
-- Design Name: 
-- Module Name: FlipFlopJK - Behavioral
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

entity FlipFlopJK is
    Port ( SN : in STD_LOGIC;
           RN : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Q : out STD_LOGIC;
           QN : out STD_LOGIC);
end FlipFlopJK;

architecture Behavioral of FlipFlopJK is
signal Qint: std_logic := '0';
begin
    Q <= Qint;
    QN <= not Qint;
       process(SN, RN, CLK)
       begin
          if RN = '0' then Qint <= '0';
          elsif SN = '0' then Qint <= '1';
          elsif CLK'event and CLK='0' then
          Qint <= (J and not Qint) or (not K and Qint);
        end if;
       end process;
end Behavioral;
