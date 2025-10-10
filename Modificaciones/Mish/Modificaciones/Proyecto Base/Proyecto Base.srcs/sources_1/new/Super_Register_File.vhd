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
    Port ( pc_in : in STD_LOGIC_VECTOR(11 downto 0);
           load_pc : in STD_LOGIC;
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           n : in STD_LOGIC;
           z : in STD_LOGIC;
           c : in STD_LOGIC;
           s_Reg : in STD_LOGIC_VECTOR (1 downto 0);
           select_second : in STD_LOGIC_VECTOR (1 downto 0);
           l_Reg : in STD_LOGIC;
           select_first : in STD_LOGIC_VECTOR (1 downto 0);
           rslt : in STD_LOGIC_VECTOR (15 downto 0);
           pc_out : out STD_LOGIC_VECTOR (11 downto 0);
           reg_d : out STD_LOGIC_VECTOR (15 downto 0);
           reg_c : out STD_LOGIC_VECTOR (15 downto 0);
           reg_b : out STD_LOGIC_VECTOR (15 downto 0);
           reg_a : out STD_LOGIC_VECTOR (15 downto 0);
           status_out : out STD_LOGIC_VECTOR (2 downto 0);
           second_operator : out STD_LOGIC_VECTOR (15 downto 0);
           first_operator : out STD_LOGIC_VECTOR (15 downto 0));
end Super_Register_File;

architecture Behavioral of Super_Register_File is

-- Inicio de la declaracion de los componentes.
component Register_File
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
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
           first_Operator : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

component PC
    Port ( PC_in : in STD_LOGIC_VECTOR(11 downto 0);
           clock : in std_logic;
           clear : in std_logic;
           load_PC : in std_logic;
           PC_out : out std_logic_vector (11 downto 0)
           );
end component;

-- Declaración señales.
signal clear_regfile: std_logic;

begin

inst_RegFile: Register_File port map(
                                      clk => clock,
                                      clr => clear,
                                      N => n,
                                      Z => z,
                                      C => c,
                                      S_Reg => s_reg,
                                      select_Second => select_second,
                                      L_reg => l_reg,
                                      select_First => select_first,
                                      result => rslt,
                                      Reg_D => reg_D,
                                      Reg_C => reg_C,
                                      Reg_B => reg_B,
                                      Reg_A => reg_A,
                                      Status_out => status_out,
                                      second_Operator => second_operator,
                                      first_Operator => first_operator
                                      );
inst_PC: PC port map(
                     PC_in => pc_in,
                     clock => clock,
                     clear => clear,
                     load_PC => load_pc,
                     PC_out => pc_out
                     );

end Behavioral;

