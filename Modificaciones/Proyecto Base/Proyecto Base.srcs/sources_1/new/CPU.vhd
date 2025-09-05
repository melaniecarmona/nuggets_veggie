library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;


entity CPU is
    Port (
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           ram_address : out STD_LOGIC_VECTOR (11 downto 0);
           ram_datain : out STD_LOGIC_VECTOR (15 downto 0);
           ram_dataout : in STD_LOGIC_VECTOR (15 downto 0);
           ram_write : out STD_LOGIC;
           rom_address : out STD_LOGIC_VECTOR (11 downto 0);
           rom_dataout : in STD_LOGIC_VECTOR (61 downto 0);
           dis : out STD_LOGIC_VECTOR (15 downto 0);
           regA : out STD_LOGIC_VECTOR (15 downto 0);
           regB : out STD_LOGIC_VECTOR (15 downto 0);
           regC : out STD_LOGIC_VECTOR (15 downto 0);
           regD : out STD_LOGIC_VECTOR (15 downto 0));

end CPU;

architecture Behavioral of CPU is

begin

end Behavioral;

