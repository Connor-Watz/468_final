library ieee;
use ieee.std_logic_1164.all;

entity serial2parallel is
    generic(
	width : natural := 32
    );

    port(
	clk         : in  std_logic;
	data_in     : in  std_logic;
	data_out    : out std_logic_vector(width - 1 downto 0));
end entity serial2parallel;

architecture behavior of serial2parallel is

    signal temp : std_logic_vector(width - 1 downto 0) := (others => '0');

begin
    
    toParallel : process(clk, data_in)
    begin
	if rising_edge(clk) then
	    temp(width - 1 downto 1) <= temp (width - 2 downto 0);			-- Shift entire register left one, MSB out
	    temp(0) <= data_in;							-- Append current data to end
	end if;
    end process toParallel;

    data_out <= temp;

end architecture behavior;
