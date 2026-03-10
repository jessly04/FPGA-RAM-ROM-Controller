library ieee;
use ieee.std_logic_1164.all;

entity Lab10 is
    port (
        MAX10_CLK1_50 : in  std_logic;
        KEY           : in  std_logic_vector(1 downto 0);
        SW            : in  std_logic_vector(9 downto 0);
        HEX0          : out std_logic_vector(6 downto 0);
        HEX1          : out std_logic_vector(6 downto 0)
    );
end entity Lab10;

architecture Structural of Lab10 is
    component RAM is
        port (
            clk   : in  std_logic;
            addr  : in  std_logic_vector(5 downto 0);
            wen   : in  std_logic;
            wdata : in  std_logic_vector(3 downto 0);
            rdata : out std_logic_vector(3 downto 0)
        );
    end component;

    component ROM is
        port (
            addr  : in  std_logic_vector(5 downto 0); 
            rdata : out std_logic_vector(3 downto 0)
        );
    end component;

    component hex_encoder is
        port (
            binary : in  std_logic_vector(3 downto 0);
            HEX    : out std_logic_vector(6 downto 0)
        );
    end component;

    -- internal signals
    signal rdata_ram : std_logic_vector(3 downto 0);
    signal rdata_rom : std_logic_vector(3 downto 0);

begin

    RAM_inst : RAM
        port map (
            clk   => MAX10_CLK1_50,
            addr  => SW(5 downto 0),       
            wen   => not KEY(0), -- Pushbuttons are active-low (0 when pressed)
            wdata => SW(9 downto 6),       
            rdata => rdata_ram             
        );

    ROM_inst : ROM
        port map (
            addr  => SW(5 downto 0),      
            rdata => rdata_rom             
        );

    HEX0_inst : hex_encoder
        port map (
            binary => rdata_ram,            
            HEX    => HEX0                   
        );

    HEX1_inst : hex_encoder
        port map (
            binary => rdata_rom,            
            HEX    => HEX1                   
        );

end architecture Structural;
