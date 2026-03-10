library ieee;
use ieee.std_logic_1164.all;

entity ROM is
    port (
        addr  : in  std_logic_vector(5 downto 0);
        rdata : out std_logic_vector(3 downto 0)
    );
end entity ROM;

architecture Behavioral of ROM is
begin
     process(addr)
    begin
        case addr is
          -- given table from lab instructions
            when "000000" => rdata <= "1010"; -- 00: A
            when "000001" => rdata <= "0111"; -- 01: 7
            when "000010" => rdata <= "0011"; -- 02: 3
            when "000011" => rdata <= "1111"; -- 03: F
            when "000100" => rdata <= "0100"; -- 04: 4
            when "000101" => rdata <= "1001"; -- 05: 9
            when "000110" => rdata <= "1110"; -- 06: E
            when "000111" => rdata <= "0000"; -- 07: 0
            when "001000" => rdata <= "0101"; -- 08: 5
            when "001001" => rdata <= "1011"; -- 09: B
            when "001010" => rdata <= "0010"; -- 0A: 2
            when "001011" => rdata <= "1101"; -- 0B: D
            when "001100" => rdata <= "0001"; -- 0C: 1
            when "001101" => rdata <= "0110"; -- 0D: 6
            when "001110" => rdata <= "1100"; -- 0E: C
            when "001111" => rdata <= "1000"; -- 0F: 8
            when others   => rdata <= "0000"; -- All others: 0
        end case;
    end process;
end architecture Behavioral;
