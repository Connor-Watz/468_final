
# Timing Specification Constraints

create_clock -name clk -period 10.200543ns -waveform {0.0ns 5.100271ns} [get_ports {clk}]
derive_pll_clocks
derive_clock_uncertainty
