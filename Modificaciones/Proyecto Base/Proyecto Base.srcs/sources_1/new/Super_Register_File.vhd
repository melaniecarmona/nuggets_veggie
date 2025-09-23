----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2025 11:20:19
-- Design Name: 
-- Module Name: Super_Register_File - Behavioral
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

entity Super_Register_File is
    Port ( PC_in : in STD_LOGIC;
           load_PC : in STD_LOGIC;
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           N : in STD_LOGIC;
           Z : in STD_LOGIC;
           C : in STD_LOGIC;
           S_Reg : in STD_LOGIC_VECTOR (1 downto 0);
           selectSecond : in STD_LOGIC_VECTOR (1 downto 0);
           L_Reg : in STD_LOGIC;
           selectFirst : in STD_LOGIC_VECTOR (1 downto 0);
           result : in STD_LOGIC_VECTOR (15 downto 0);
           PC_out : out STD_LOGIC_VECTOR (11 downto 0);
           regD : out STD_LOGIC_VECTOR (15 downto 0);
           regC : out STD_LOGIC_VECTOR (15 downto 0);
           regB : out STD_LOGIC_VECTOR (15 downto 0);
           regA : out STD_LOGIC_VECTOR (15 downto 0);
           Status_out : out STD_LOGIC_VECTOR (2 downto 0);
           secondOperator : out STD_LOGIC_VECTOR (15 downto 0);
           firstOperator : out STD_LOGIC_VECTOR (15 downto 0));
end Super_Register_File;

architecture Behavioral of Super_Register_File is

-- Inicio de la declaracion de los componentes.
component Register_File
    Port ( clock : in std_logic;
           clear : in std_logic;
           N : in std_logic;
           Z : in std_logic;
           C : in std_logic;
           S_Reg : in std_logic_vector (1 downto 0);
           select_Second : in std_logic_vector (1 downto 0);
           L_reg : in std_logic;
           select_First : in std_logic_vector (1 downto 0);
           result : in std_logic_vector (15 downto 0);
           Reg_D : out std_logic_vector (15 downto 0);
           Reg_C : out std_logic_vector (15 downto 0);
           Reg_B : out std_logic_vector (15 downto 0);
           Reg_A : out std_logic_vector (15 downto 0);
           Status_out : out std_logic_vector (2 downto 0);
           second_Operator : out std_logic_vector (15 downto 0);
           first_Operator : out std_logic_vector (15 downto 0)
           );
end component;

component PC
    Port ( PC_in : in std_logic;
           clear : in std_logic;
           load_PC : in std_logic;
           PC_out : out std_logic_vector (11 downto 0)
           );
end component;

-- Declaración señales.
signal clear_regfile: std_logic;

begin


end Behavioral;
