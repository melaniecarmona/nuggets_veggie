----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.09.2025 15:35:33
-- Design Name: 
-- Module Name: Control_unit - Behavioral
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

entity Control_unit is
    Port ( rom : in STD_LOGIC_VECTOR (45 downto 0);
           status : in STD_LOGIC_VECTOR (2 downto 0);
           L_reg : out STD_LOGIC;
           selectfirst : out STD_LOGIC_VECTOR (1 downto 0);
           selectsecond : out STD_LOGIC_VECTOR (1 downto 0);
           SelOne : out STD_LOGIC_VECTOR (1 downto 0);
           SelTwo : out STD_LOGIC_VECTOR (1 downto 0);
           loadPC : out STD_LOGIC;
           Sel_Alu : out STD_LOGIC_VECTOR (2 downto 0);
           w: out STD_LOGIC;
           Sel_Add : out STD_LOGIC;
           S_Reg : out STD_LOGIC_VECTOR (1 downto 0));
end Control_unit;

architecture Behavioral of Control_unit is

signal s_l_pc : STD_LOGIC_VECTOR(7 downto 0);
signal s_L_reg : STD_LOGIC;
signal s_selectfirst : STD_LOGIC_VECTOR(3 downto 0);
signal s_selectsecond : STD_LOGIC_VECTOR(3 downto 0);
signal s_s_reg : STD_LOGIC_VECTOR(3 downto 0);
signal s_SelOne : STD_LOGIC_VECTOR(2 downto 0);
signal s_SelTwo : STD_LOGIC_VECTOR(3 downto 0);
signal s_loadPC : STD_LOGIC_VECTOR(7 downto 0);
signal s_Sel_Alu : STD_LOGIC_VECTOR(7 downto 0);
signal s_sel_add : STD_LOGIC_VECTOR(2 downto 0);
signal c : STD_LOGIC;
signal z : STD_LOGIC;
signal n : STD_LOGIC;
signal JGT : STD_LOGIC;
signal JGE : STD_LOGIC;
signal JNE : STD_LOGIC;
signal JLE : STD_LOGIC;

begin
JLE <= status(1) or status(0);
JNE <= not(status(1));
JGE <= not(status(0));
JGT <= not(status(0) and status(1));
c <= status(2);
z <= status(1);
n <= status(0);
s_l_pc <= rom(43 downto 36);
s_sel_add <= rom(33 downto 31);
s_SelTwo <= rom(27 downto 24);
s_SelOne <= rom(23 downto 21);
s_s_reg <= rom(20 downto 17);
s_selectsecond <= rom(16 downto 14);
s_selectfirst <= rom(12 downto 9);
s_L_reg <= rom(8);
s_Sel_Alu <= rom(7 downto 0);



with s_Sel_Alu select
    Sel_Alu <= "000" when "00000001",
               "001" when "00000010",
               "010" when "00000100",
               "011" when "00001000",
               "100" when "00010000",
               "101" when "00100000",
               "110" when "01000000",
               "111" when "10000000",
               "000" when others;

with s_L_reg select
     L_reg <= '1' when '1',
              '0' when others;
              
with s_selectfirst select
     selectfirst <= "00" when "0001",
                    "01" when "0010",
                    "10" when "0100",
                    "11" when "1000",
                    "00" when others;

with s_selectsecond select
     selectsecond <= "00" when "0001",
                    "01" when "0010",
                    "10" when "0100",
                    "11" when "1000",
                    "00" when others;
                    
with s_s_reg select
     S_Reg <= "00" when "0001",
                    "01" when "0010",
                    "10" when "0100",
                    "11" when "1000",
                    "00" when others;                 
with s_SelOne select
     SelOne <= "00" when "001",
               "01" when "010",
               "10" when "100",
               "00" when others;      
               
with s_SelTwo select
     SelTwo <= "00" when "0001",
               "01" when "0010",
               "10" when "0100",
               "11" when "1000",
               "00" when others;                

with s_sel_add select
     Sel_Add <= '1' when "010",
                '0' when others;
                
with s_l_pc select
    loadPC <= '1' when "00000001",
               z when "00000010",
               JNE when "00000100",
               JGT when "00001000",
               JGE when "00010000",
               n when "00100000",
               JLE when "01000000",
               c when "10000000",
               '0' when others;
              
end Behavioral;
