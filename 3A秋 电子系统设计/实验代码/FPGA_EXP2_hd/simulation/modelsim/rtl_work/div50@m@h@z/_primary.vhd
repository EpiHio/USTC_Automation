library verilog;
use verilog.vl_types.all;
entity div50MHZ is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clkout          : out    vl_logic
    );
end div50MHZ;
