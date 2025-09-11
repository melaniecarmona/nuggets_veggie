----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.09.2025 11:59:00
-- Design Name: 
-- Module Name: Reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: 16 veces la figura 6 del enunciado
--                      otra idea es cambiar el mux por uno de 2 entradas de 16 bits
--                      y que el d de cada flip flop se calcule llamando a mux_out(x)4
--                      para esto habría q hacer signal mux_out: std_logic_vector(15 downto 0)
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

entity Reg is
    Port ( clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           datain : in STD_LOGIC_VECTOR (15 downto 0);
           dataout : out STD_LOGIC_VECTOR (15 downto 0));
end Reg;

architecture Behavioral of Reg is

-- Inicio de la declaracion de los componentes.

component FFD
    Port (
        clk : in std_logic;
        d   : in std_logic;
        q   : out std_logic
        );
end component;

-- Declaración señales.
signal q_ffd : std_logic_vector(15 downto 0);

signal mux_out: std_logic_vector(15 downto 0);

signal mux_out15 : std_logic;
signal mux_out14 : std_logic;
signal mux_out13 : std_logic;
signal mux_out12 : std_logic;
signal mux_out11 : std_logic;
signal mux_out10 : std_logic;
signal mux_out9 : std_logic;
signal mux_out8 : std_logic;
signal mux_out7 : std_logic;
signal mux_out6 : std_logic;
signal mux_out5 : std_logic;
signal mux_out4 : std_logic;
signal mux_out3 : std_logic;
signal mux_out2 : std_logic;
signal mux_out1 : std_logic;
signal mux_out0 : std_logic;

signal d15 : std_logic;
signal d14 : std_logic;
signal d13 : std_logic;
signal d12 : std_logic;
signal d11 : std_logic;
signal d10 : std_logic;
signal d9 : std_logic;
signal d8 : std_logic;
signal d7 : std_logic;
signal d6 : std_logic;
signal d5 : std_logic;
signal d4 : std_logic;
signal d3 : std_logic;
signal d2 : std_logic;
signal d1 : std_logic;
signal d0 : std_logic;
    
begin

-- Mux con dos entradas de 16 bit
with load select
    mux_out <= datain when '0',
               q_ffd when '1';   
              
-- NOT reset AND Mux
d15 <= (not clear) and mux_out(15);
-- instancias de FFD
inst_FFD15: FFD port map(
            clk   =>clock,
            d     =>d15,
            q     =>q_ffd(15)
        );
        
-- Mux con dos entradas de 1 bit
with load select
    mux_out14 <= datain(14) when '0',
                 q_ffd(14) when '1';               
-- NOT reset AND Mux
d14 <= (not clear) and mux_out14;
-- instancias de FFD
inst_FFD14: FFD port map(
            clk   =>clock,
            d     =>d14,
            q     =>q_ffd(14)
        );
        
-- Mux con dos entradas de 1 bit
with load select
    mux_out13 <= datain(13) when '0',
                 q_ffd(13) when '1';               
-- NOT reset AND Mux
d13 <= (not clear) and mux_out13;
-- instancias de FFD
inst_FFD13: FFD port map(
            clk   =>clock,
            d     =>d13,
            q     =>q_ffd(13)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out12 <= datain(12) when '0',
                 q_ffd(12) when '1';               
-- NOT reset AND Mux
d12 <= (not clear) and mux_out12;
-- instancias de FFD
inst_FFD12: FFD port map(
            clk   =>clock,
            d     =>d12,
            q     =>q_ffd(12)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out11 <= datain(11) when '0',
                 q_ffd(11) when '1';               
-- NOT reset AND Mux
d11 <= (not clear) and mux_out11;
-- instancias de FFD
inst_FFD11: FFD port map(
            clk   =>clock,
            d     =>d10,
            q     =>q_ffd(11)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out10 <= datain(10) when '0',
                 q_ffd(10) when '1';               
-- NOT reset AND Mux
d10 <= (not clear) and mux_out10;
-- instancias de FFD
inst_FFD10: FFD port map(
            clk   =>clock,
            d     =>d10,
            q     =>q_ffd(10)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out9 <= datain(9) when '0',
                 q_ffd(9) when '1';               
-- NOT reset AND Mux
d9 <= (not clear) and mux_out9;
-- instancias de FFD
inst_FFD9: FFD port map(
            clk   =>clock,
            d     =>d9,
            q     =>q_ffd(9)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out8 <= datain(8) when '0',
                 q_ffd(8) when '1';               
-- NOT reset AND Mux
d8 <= (not clear) and mux_out8;
-- instancias de FFD
inst_FFD8: FFD port map(
            clk   =>clock,
            d     =>d14,
            q     =>q_ffd(8)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out7 <= datain(7) when '0',
                 q_ffd(7) when '1';               
-- NOT reset AND Mux
d7 <= (not clear) and mux_out7;
-- instancias de FFD
inst_FFD7: FFD port map(
            clk   =>clock,
            d     =>d7,
            q     =>q_ffd(7)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out6 <= datain(6) when '0',
                 q_ffd(6) when '1';               
-- NOT reset AND Mux
d6 <= (not clear) and mux_out6;
-- instancias de FFD
inst_FFD6: FFD port map(
            clk   =>clock,
            d     =>d6,
            q     =>q_ffd(6)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out5 <= datain(5) when '0',
                 q_ffd(5) when '1';               
-- NOT reset AND Mux
d5 <= (not clear) and mux_out5;
-- instancias de FFD
inst_FFD5: FFD port map(
            clk   =>clock,
            d     =>d5,
            q     =>q_ffd(5)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out4 <= datain(4) when '0',
                 q_ffd(4) when '1';               
-- NOT reset AND Mux
d4 <= (not clear) and mux_out4;
-- instancias de FFD
inst_FFD4: FFD port map(
            clk   =>clock,
            d     =>d4,
            q     =>q_ffd(4)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out3 <= datain(3) when '0',
                 q_ffd(3) when '1';               
-- NOT reset AND Mux
d3 <= (not clear) and mux_out3;
-- instancias de FFD
inst_FFD3: FFD port map(
            clk   =>clock,
            d     =>d3,
            q     =>q_ffd(3)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out2 <= datain(2) when '0',
                 q_ffd(2) when '1';               
-- NOT reset AND Mux
d2 <= (not clear) and mux_out2;
-- instancias de FFD
inst_FFD2: FFD port map(
            clk   =>clock,
            d     =>d2,
            q     =>q_ffd(2)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out1 <= datain(1) when '0',
                 q_ffd(1) when '1';               
-- NOT reset AND Mux
d1 <= (not clear) and mux_out1;
-- instancias de FFD
inst_FFD1: FFD port map(
            clk   =>clock,
            d     =>d1,
            q     =>q_ffd(1)
        );

-- Mux con dos entradas de 1 bit
with load select
    mux_out0 <= datain(0) when '0',
                 q_ffd(0) when '1';               
-- NOT reset AND Mux
d0 <= (not clear) and mux_out0;
-- instancias de FFD
inst_FFD0: FFD port map(
            clk   =>clock,
            d     =>d0,
            q     =>q_ffd(0)
        );


dataout <= q_ffd;
end Behavioral;
