----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2021 05:43:50 PM
-- Design Name: 
-- Module Name: main - Behavioral
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

entity main is
    Port ( CLK100MHZ : in STD_LOGIC;
           D7A : out STD_LOGIC_VECTOR (7 downto 0);
           D71 : out STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is

component Seg7 is
       Port(ck : in  std_logic;                          
			number : in  std_logic_vector (63 downto 0);
			seg : out  std_logic_vector (7 downto 0);
			an : out  std_logic_vector (7 downto 0));
end component;

component freq_divisor is
       Port (clk50mhz: 	in STD_LOGIC;
	           clk: out STD_LOGIC);
end component;

component relojalarma is
    Port ( clk_in : in STD_LOGIC;
           hrs_dec : out STD_LOGIC_VECTOR (3 downto 0);
           hrs_uni : out STD_LOGIC_VECTOR (3 downto 0);
           min_dec : out STD_LOGIC_VECTOR (3 downto 0);
           min_uni : out STD_LOGIC_VECTOR (3 downto 0);
           seg_dec : out STD_LOGIC_VECTOR (3 downto 0);
           seg_uni : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal SCLK: std_logic := '0';
signal d7s : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111100000000000000000000000000000000";
signal hrsdec : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal hrsuni : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal mindec : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal minuni : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal segdec : STD_LOGIC_VECTOR (3 downto 0):="0000";
signal seguni : STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

divis: freq_divisor port map (clk50mhz=>CLK100MHZ, clk=>SCLK);
reloj: relojalarma port map (clk_in => SCLK, hrs_dec => hrsdec, hrs_uni => hrsuni, min_dec => mindec,
                             min_uni => minuni, seg_dec => segdec, seg_uni => seguni);
Segm7: Seg7 port map (ck=>CLK100MHZ, number=>d7s, seg=> D7A, an=>D71);

--process(SCLK)
process(CLK100MHZ, SCLK)
begin
    if SCLK'event and SCLK='1' then
        
        --case (hrsdec) is
                       --when "0000" => d7s(47 downto 40) <= "11000000";
                        --when "0001" => d7s(47 downto 40) <= "11111001";
                        --when "0010" => d7s(47 downto 40) <= "10100100";
                        --when "0011" => d7s(47 downto 40) <= "10110000";
                        --when "0100" => d7s(47 downto 40) <= "10011001";
                        --when "0101" => d7s(47 downto 40) <= "10010010";
                        --when "0110" => d7s(47 downto 40) <= "10000010";
                        --when "0111" => d7s(47 downto 40) <= "11111000";
                        --when "1000" => d7s(47 downto 40) <= "10000000";
                        --when "1001" => d7s(47 downto 40) <= "10010000";
                        --when others => d7s(47 downto 40) <= "11111111";
                        --end case;
    
        --case (hrsuni) is
                        --when "0000" => d7s(39 downto 32) <= "11000000";
                        --when "0001" => d7s(39 downto 32) <= "11111001";
                        --when "0010" => d7s(39 downto 32) <= "10100100";
                       --when "0011" => d7s(39 downto 32) <= "10110000";
                        --when "0100" => d7s(39 downto 32) <= "10011001";
                        --when "0101" => d7s(39 downto 32) <= "10010010";
                        --when "0110" => d7s(39 downto 32) <= "10000010";
                        --when "0111" => d7s(39 downto 32) <= "11111000";
                        --when "1000" => d7s(39 downto 32) <= "10000000";
                        --when "1001" => d7s(39 downto 32) <= "10010000";
                        --when others => d7s(39 downto 32) <= "11111111";
                        --end case;

        case (hrsdec) is
                        when "0000" => d7s(31 downto 24) <= "11000000";
                        when "0001" => d7s(31 downto 24) <= "11111001";
                        when "0010" => d7s(31 downto 24) <= "10100100";
                        when "0011" => d7s(31 downto 24) <= "10110000";
                        when "0100" => d7s(31 downto 24) <= "10011001";
                        when "0101" => d7s(31 downto 24) <= "10010010";
                        when "0110" => d7s(31 downto 24) <= "10000010";
                        when "0111" => d7s(31 downto 24) <= "11111000";
                        when "1000" => d7s(31 downto 24) <= "10000000";
                        when "1001" => d7s(31 downto 24) <= "10010000";
                        when others => d7s(31 downto 24) <= "11111111";
                        end case;
    
        case (hrsuni) is
                        when "0000" => d7s(23 downto 16) <= "11000000";
                        when "0001" => d7s(23 downto 16) <= "11111001";
                        when "0010" => d7s(23 downto 16) <= "10100100";
                        when "0011" => d7s(23 downto 16) <= "10110000";
                        when "0100" => d7s(23 downto 16) <= "10011001";
                        when "0101" => d7s(23 downto 16) <= "10010010";
                        when "0110" => d7s(23 downto 16) <= "10000010";
                        when "0111" => d7s(23 downto 16) <= "11111000";
                        when "1000" => d7s(23 downto 16) <= "10000000";
                        when "1001" => d7s(23 downto 16) <= "10010000";
                        when others => d7s(23 downto 16) <= "11111111";
                        end case;


        case (mindec) is
                        when "0000" => d7s(15 downto 8) <= "11000000";
                        when "0001" => d7s(15 downto 8) <= "11111001";
                        when "0010" => d7s(15 downto 8) <= "10100100";
                        when "0011" => d7s(15 downto 8) <= "10110000";
                        when "0100" => d7s(15 downto 8) <= "10011001";
                        when "0101" => d7s(15 downto 8) <= "10010010";
                        when "0110" => d7s(15 downto 8) <= "10000010";
                        when "0111" => d7s(15 downto 8) <= "11111000";
                        when "1000" => d7s(15 downto 8) <= "10000000";
                        when "1001" => d7s(15 downto 8) <= "10010000";
                        when others => d7s(15 downto 8) <= "11111111";
                        end case;
    
        case (minuni) is
                        when "0000" => d7s(7 downto 0) <= "11000000";
                        when "0001" => d7s(7 downto 0) <= "11111001";
                        when "0010" => d7s(7 downto 0) <= "10100100";
                        when "0011" => d7s(7 downto 0) <= "10110000";
                        when "0100" => d7s(7 downto 0) <= "10011001";
                        when "0101" => d7s(7 downto 0) <= "10010010";
                        when "0110" => d7s(7 downto 0) <= "10000010";
                        when "0111" => d7s(7 downto 0) <= "11111000";
                        when "1000" => d7s(7 downto 0) <= "10000000";
                        when "1001" => d7s(7 downto 0) <= "10010000";
                        when others => d7s(7 downto 0) <= "11111111";
                        end case;
    end if;
end process;
end Behavioral;
