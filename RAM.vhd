library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port (
        clk   : in  std_logic;
        addr  : in  std_logic_vector(5 downto 0);
        wen   : in  std_logic;
        wdata : in  std_logic_vector(3 downto 0);
        rdata : out std_logic_vector(3 downto 0)
    );
end entity RAM;

architecture Behavioral of RAM is
    type mem_type is array (0 to 63) of std_logic_vector(3 downto 0);
    signal sig_ram : mem_type;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if wen = '1' then
                sig_ram(to_integer(unsigned(addr))) <= wdata;
            end if;
            -- Moved this inside clock process to target M9K memory blocks
            rdata <= sig_ram(to_integer(unsigned(addr)));
        end if;
    end process;
end architecture Behavioral;
