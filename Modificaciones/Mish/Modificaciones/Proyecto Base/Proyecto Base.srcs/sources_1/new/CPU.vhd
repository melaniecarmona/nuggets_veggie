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

component Control_U is
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

component Super_Register_File is 
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
           first_operator : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component;

signal LIT : STD_LOGIC_VECTOR(15 downto 0);
signal va_control_unit : STD_LOGIC_VECTOR(45 downto 0);
signal pcin : STD_LOGIC_VECTOR(11 downto 0);
signal statuss : STD_LOGIC_VECTOR(2 downto 0);
signal mux_1 : STD_LOGIC_VECTOR(1 downto 0);
signal mux_2 : STD_LOGIC_VECTOR(1 downto 0);
signal mux_s : STD_LOGIC;
signal C : STD_LOGIC;
signal Z : STD_LOGIC;
signal N : STD_LOGIC;
signal s_first : STD_LOGIC_VECTOR(1 downto 0);
signal s_second : STD_LOGIC_VECTOR(1 downto 0);
signal lL_reg : STD_LOGIC;
signal sS_reg : STD_LOGIC_VECTOR(1 downto 0);
signal l_pc : STD_LOGIC;
signal SOP : STD_LOGIC_VECTOR(2 downto 0);
signal re_sult : STD_LOGIC_VECTOR(15 downto 0);
signal S_Op :  STD_LOGIC_VECTOR(15 downto 0);
signal F_Op : STD_LOGIC_VECTOR(15 downto 0);
signal out_1 : STD_LOGIC_VECTOR(15 downto 0);
signal out_2 : STD_LOGIC_VECTOR(15 downto 0);
signal pc_out_signal : STD_LOGIC_VECTOR(11 downto 0);

begin
LIT <= rom_dataout(61 downto 46);
va_control_unit <= rom_dataout(61 downto 16);
pcin <= rom_dataout(11 downto 0);
rom_address <= pc_out_signal;

inst_Control_Unit: Control_U port map(
rom => va_control_unit,
status => statuss,
L_Reg => lL_reg,
selectfirst => s_first,
selectsecond => s_second,
SelOne =>  mux_1,
SelTwo => mux_2,
loadPC => l_pc,
Sel_Alu => SOP,
w => ram_write,
Sel_Add => mux_s,
S_Reg => sS_reg
);

ins_Alu: ALU port map(
a => out_1,
b => out_2,
sop => SOP,
c => C,
z => Z,
n => N,
result => re_sult
);

inst_sup_reg_fil: Super_Register_File port map(
pc_in => pcin,
load_pc => l_pc,
clock => clock,
clear => clear,
n => N,
z => Z,
c => C,
s_Reg => sS_reg,
select_second => s_second,
l_Reg => lL_reg,
select_first => s_first,
rslt => re_sult,
pc_out => pc_out_signal,
reg_d => regD,
reg_c => regC,
reg_b => regB,
reg_a => regA,
status_out => statuss,
second_operator => S_Op,
first_operator => F_Op
);

with mux_1 select
out_1 <= "0000000000000000" when "00",
         "0000000000000001" when "01",
         F_Op when "10",
         "0000000000000000" when others;
         
with mux_2 select
out_2 <= "0000000000000000" when "00",
         S_Op when "01",
         LIT when "10",
         ram_dataout when "11",
         "0000000000000000" when others;

with mux_s select
ram_address <= S_Op(11 downto 0) when '0',
         LIT(11 downto 0) when '1',
         "000000000000" when others;

ram_datain <= S_Op;

end Behavioral;

