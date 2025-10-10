library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Basys3 is
    Port (
        sw          : in   std_logic_vector (15 downto 0); -- No Tocar - Se�ales de entrada de los interruptores -- Arriba   = '1'   -- Los 16 swiches.
        led         : out  std_logic_vector (15 downto 0)  -- No Tocar - Se�ales de salida a los leds            -- Prendido = '1'   -- Los 16 leds.
          );
end Basys3;

architecture Behavioral of Basys3 is
-- Inicio de la declaraci�n de los componentes.

component FullAdder4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end component;

-- Fin de la declaraci�n de los componentes.
-- Inicio de la declaraci�n de se�ales.

   -- Borrame: Aqu� se declaran las se�ales que  se van a usar.

-- Fin de la declaraci�n de los se�ales.
begin
-- Inicio de declaraci�n de comportamientos.

-- Fin de declaraci�n de comportamientos.
-- Inicio de declaraci�n de instancias de componentes.

inst_FA4: FullAdder4 port map( -- Primera instancia de FA
    A => sw(15 downto 12),
    B => sw(11 downto 8),
    Cin => sw(7), 
    S => led(3 downto 0),
    Cout => led(4)
);

-- Fin de declaraci�n de instancias de componentes.   
end Behavioral;