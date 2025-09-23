----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.09.2025 11:59:00
-- Design Name: 
-- Module Name: Reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 16 veces la figura 6 del enunciado
--                      otra idea es cambiar el mux por uno de 2 entradas de 16 bits
--                      y que el d de cada flip flop se calcule llamando a mux_out(x)
--                      para esto habr�a q hacer signal mux_out: std_logic_vector(15 downto 0)
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

entity Register_File is
    Port ( clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           C : in STD_LOGIC;
           S_Reg : in STD_LOGIC_VECTOR (1 downto 0);
           select_Second : in STD_LOGIC_VECTOR (1 downto 0);
           L_reg : in STD_LOGIC;
           select_First : in STD_LOGIC_VECTOR (1 downto 0);
           result : in STD_LOGIC_VECTOR (15 downto 0);
           Reg_D : out STD_LOGIC_VECTOR (15 downto 0);
           Reg_C : out STD_LOGIC_VECTOR (15 downto 0);
           Reg_B : out STD_LOGIC_VECTOR (15 downto 0);
           Reg_A : out STD_LOGIC_VECTOR (15 downto 0);
           Status_out : out STD_LOGIC_VECTOR (2 downto 0);
           second_Operator : out STD_LOGIC_VECTOR (15 downto 0);
           first_Operator : out STD_LOGIC_VECTOR (15 downto 0));
end Register_File;

architecture Behavioral of Register_File is

component Reg
    Port ( clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (15 downto 0);
           dataout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal load_A : STD_LOGIC;
signal load_B : STD_LOGIC;
signal load_C : STD_LOGIC;
signal load_D : STD_LOGIC;
signal  RegA : STD_LOGIC_VECTOR (15 downto 0);
signal  RegB : STD_LOGIC_VECTOR (15 downto 0);
signal  RegC : STD_LOGIC_VECTOR (15 downto 0);
signal  RegD : STD_LOGIC_VECTOR (15 downto 0);

begin

with S_reg select
    Load_A <= L_reg when "00",
         '0' when others;
 
with S_reg select       
    Load_B <= L_reg when "01",
         '0' when others;

with S_reg select       
    Load_C <= L_reg when "10",
         '0' when others;

with S_reg select  
    Load_D <= L_reg when "11",
         '0' when others;

inst_RegA : Reg port map(
            clock => clock,
            clear => clear,
            load => Load_A,
            datain => result,
            dataout => RegA
            );
inst_RegB : Reg port map(
            clock => clock,
            clear => clear,
            load => Load_B,
            datain => result,
            dataout => RegB
            );
inst_RegC : Reg port map(
            clock => clock,
            clear => clear,
            load => Load_C,
            datain => result,
            dataout => RegC
            );
inst_RegD : Reg port map(
            clock => clock,
            clear => clear,
            load => Load_D,
            datain => result,
            dataout => RegD
            );
            
with select_First select
    first_Operator <= RegA when "00",
                   RegB when "01",
                   RegC when "10",
                   RegD when "11";

with select_Second select
    second_Operator <= RegA when "00",
                   RegB when "01",
                   RegC when "10",
                   RegD when "11";                                  
                   

end Behavioral;