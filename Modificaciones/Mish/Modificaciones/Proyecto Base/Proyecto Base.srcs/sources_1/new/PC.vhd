----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.09.2025 07:45:40
-- Design Name: 
-- Module Name: PC - Behavioral
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

entity PC is
    Port ( PC_in   : in STD_LOGIC_VECTOR(11 downto 0);
           clock   : in STD_LOGIC;
           clear   : in STD_LOGIC;
           load_PC : in STD_LOGIC;
           PC_out  : out STD_LOGIC_VECTOR(11 downto 0));
end PC;

architecture Behavioral of PC is

    component FFD is
        Port ( d : in STD_LOGIC;
               clk : in STD_LOGIC;
               q : out STD_LOGIC);
    end component;

signal current_pc : STD_LOGIC_VECTOR(11 downto 0);
signal next_pc : STD_LOGIC_VECTOR(11 downto 0);
signal pc_plus_one : STD_LOGIC_VECTOR(11 downto 0);
signal final_d : STD_LOGIC_VECTOR(11 downto 0);

begin

    pc_plus_one(0) <= not current_pc(0);
    pc_plus_one(1) <= current_pc(1) xor current_pc(0);
    pc_plus_one(2) <= current_pc(2) xor (current_pc(1) and current_pc(0));
    pc_plus_one(3) <= current_pc(3) xor (current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(4) <= current_pc(4) xor (current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(5) <= current_pc(5) xor (current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(6) <= current_pc(6) xor (current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(7) <= current_pc(7) xor (current_pc(6) and current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(8) <= current_pc(8) xor (current_pc(7) and current_pc(6) and current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(9) <= current_pc(9) xor (current_pc(8) and current_pc(7) and current_pc(6) and current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(10) <= current_pc(10) xor (current_pc(9) and current_pc(8) and current_pc(7) and current_pc(6) and current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));
    pc_plus_one(11) <= current_pc(11) xor (current_pc(10) and current_pc(9) and current_pc(8) and current_pc(7) and current_pc(6) and current_pc(5) and current_pc(4) and current_pc(3) and current_pc(2) and current_pc(1) and current_pc(0));

GEN_NEXT_PC: for i in 0 to 11 generate
    next_pc(i) <= (load_PC and PC_in(i)) or (not load_PC and pc_plus_one(i));
end generate GEN_NEXT_PC;

GEN_CLEAR: for i in 0 to 11 generate
   final_d(i) <= '0' when clear = '1' else next_pc(i);
end generate GEN_CLEAR;

GEN_PC_FF: for i in 0 to 11 generate
    PC_BIT: FFD port map(
         d => final_d(i),  
         clk => clock,
         q => current_pc(i)
         );
end generate GEN_PC_FF;

PC_out <= current_pc;

end Behavioral;