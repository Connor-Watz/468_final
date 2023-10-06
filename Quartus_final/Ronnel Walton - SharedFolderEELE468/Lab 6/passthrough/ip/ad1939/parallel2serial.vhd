library ieee;
use ieee.std_logic_1164.all;

entity parallel2serial is
    generic(
	width : natural := 32
    );

    port(
	clk         : in  std_logic;
	data_in     : in  std_logic_vector(width - 1 downto 0);
	load        : in  std_logic;
	data_out    : out std_logic
	);
end entity parallel2serial;

architecture behavior of parallel2serial is

    signal temp : std_logic_vector(width - 1 downto 0) := (others => '0');

begin

    toSerial : process(clk,data_in,load)
    begin
	if(load = '1') then
	    temp <= data_in;
        elsif rising_edge(clk) then
            
	    temp <= temp(width - 2 downto 0) & '0';
	end if;
    end process toSerial;

    data_out <= temp(width - 1);

end architecture behavior;
