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


component Control_unit is
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
end component;

component ALU is
Port ( a        : in  std_logic_vector (15 downto 0);   -- Primer operando.
           b        : in  std_logic_vector (15 downto 0);   -- Segundo operando.
           sop      : in  std_logic_vector (2 downto 0);   -- Selector de la operaci�n.
           c        : out std_logic;                       -- Se�al de 'carry'.
           z        : out std_logic;                       -- Se�al de 'zero'.
           n        : out std_logic;                       -- Se�al de 'nagative'.
           result   : out std_logic_vector (15 downto 0));
end component;
signal LIT : STD_LOGIC_VECTOR(15 downto 0);
signal va_control_unit : STD_LOGIC_VECTOR(45 downto 0);


begin
LIT <= rom_dataout(15 downto 0);
va_control_unit <= rom_dataout(61 downto 15);

end Behavioral;

