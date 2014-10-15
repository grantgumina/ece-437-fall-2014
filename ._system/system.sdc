create_clock -name CLK [get_ports {CLK}] -period 150MHz
create_clock -name CLK_50 [get_ports {CLOCK_50}] -period 150MHz
create_generated_clock -divide_by 2 -source [get_ports CLK] -name CPUCLK [get_pins CPUCLK|q]
create_generated_clock -divide_by 2 -source [get_ports CLOCK_50] -name CPUCLK [get_pins system:SYS|CPUCLK|q]
