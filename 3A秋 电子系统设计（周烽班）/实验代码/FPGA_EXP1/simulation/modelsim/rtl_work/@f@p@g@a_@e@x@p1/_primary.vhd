library verilog;
use verilog.vl_types.all;
entity FPGA_EXP1 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        y0              : out    vl_logic;
        y1              : out    vl_logic;
        y2              : out    vl_logic;
        y3              : out    vl_logic;
        y4              : out    vl_logic;
        y5              : out    vl_logic;
        y6              : out    vl_logic;
        y7              : out    vl_logic
    );
end FPGA_EXP1;
