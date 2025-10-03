library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( a        : in  std_logic_vector (15 downto 0);   -- Primer operando.
           b        : in  std_logic_vector (15 downto 0);   -- Segundo operando.
           sop      : in  std_logic_vector (2 downto 0);   -- Selector de la operaci�n.
           c        : out std_logic;                       -- Se�al de 'carry'.
           z        : out std_logic;                       -- Se�al de 'zero'.
           n        : out std_logic;                       -- Se�al de 'nagative'.
           result   : out std_logic_vector (15 downto 0));  -- Resultado de la operaci�n.
end ALU;

architecture Behavioral of ALU is

signal alu_result   : std_logic_vector(15 downto 0);
signal adder_result   : std_logic_vector(15 downto 0);
signal cout_adder : std_logic;
signal b_signal   : std_logic_vector(15 downto 0);
signal cin_adder : std_logic;


component Adder8 is
    Port ( a  : in  std_logic_vector (15 downto 0);
           b  : in  std_logic_vector (15 downto 0);
           ci : in  std_logic;
           s  : out std_logic_vector (15 downto 0);
           co : out std_logic);
end component;

begin

-- Sumador/Restaror

with sop select
    b_signal <= not b     when "001", -- sub
                b when others; -- other operation
                  
with sop select
    cin_adder <= '1' when "001", -- sub
                 '0' when others;   
             
-- Resultado de la Operaci�n
               
with sop select
    alu_result <= adder_result     when "000", -- add
                  adder_result     when "001", -- sub
                  a and b     when "010", -- and
                  a or b     when "011", -- or
                  a xor b     when "100", -- xor
                  not a     when "101", -- not 
                  '0'& a(15 downto 1)     when "110", -- shr
                  a(14 downto 0) & '0'     when "111"; -- shl
                  
result  <= alu_result;

inst_sum: Adder8 port map(
        a      => a,
        b      => b_signal,
        ci     => cin_adder,
        s      => adder_result,
        co     => cout_adder
);


-- Flags c z n
with sop select
    c <=  cout_adder     when "000", -- add
          cout_adder     when "001", -- sub
          a(0)    when "110", -- shr
          a(15)     when "111", -- shl
          '0'     when others;
          
with alu_result select
    z <=  '1'     when "0000000000000000", -- 
          '0'     when others;
          
with sop select
    n <=  not cout_adder     when "001", -- sub
          '0'     when others;
         
    
    end Behavioral;
    
