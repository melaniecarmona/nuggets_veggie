----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.08.2025 16:32:31
-- Design Name: 
-- Module Name: FullAdder4 - Behavioral
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

entity FullAdder4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end FullAdder4;

architecture Behavioral of FullAdder4 is

component FA is
    Port ( a : in STD_LOGIC;     
           b : in STD_LOGIC;     
           s : out STD_LOGIC;    
           cin : in STD_LOGIC;   
           cout : out STD_LOGIC);
end component;

signal c1 : std_logic;
signal c2 : std_logic;
signal c3 : std_logic;

begin

inst_FA: FA port map( -- Primera instancia de FA
    a => A(0),
    b => B(0),
    s => S(0), 
    cin => Cin,
    cout => c1
);
inst_FA2: FA port map( -- Segunda instancia de FA
    a => A(1),
    b => B(1),
    s => S(1), 
    cin => c1,
    cout => c2
);
inst_FA3: FA port map( -- Tercera instancia de FA
    a => A(2),
    b => B(2),
    s => S(2), 
    cin => c2,
    cout => c3
);
inst_FA4: FA port map( -- Cuarta instancia de FA
    a => A(3),
    b => B(3),
    s => S(3), 
    cin => c3,
    cout => Cout
);

end Behavioral;
