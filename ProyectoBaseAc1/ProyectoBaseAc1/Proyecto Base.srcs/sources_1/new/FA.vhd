----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.08.2024 13:31:57
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

component HA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal s1 : std_logic; -- Declaracion de senales
signal c1 : std_logic;
signal c2 : std_logic;

begin

cout <= c1 or c2;

inst_HA: HA port map( -- Primera instancia de HA
    A => a, -- Conexiones de los puertos de la instancia
    B => b, -- Conexiones incorrectas ojo
    S => s1, -- Conexiones incorrectas ojo 
    C => c1 -- Conexiones incorrectas ojo
);
inst_HA2: HA port map( -- Segunda instancia de HA
    A => s1, -- Conexiones incorrectas ojo
    B => cin, -- Conexiones incorrectas ojo
    S => s, -- Conexiones incorrectas ojo
    C => c2 -- Conexiones incorrectas ojo
);

end Behavioral;
