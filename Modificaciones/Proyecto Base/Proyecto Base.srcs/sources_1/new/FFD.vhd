library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD is
    Port (
        clk : in std_logic;
        d   : in std_logic;
        q   : out std_logic
    );
end FFD;

architecture Behavioral of FFD is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;
end Behavioral;
