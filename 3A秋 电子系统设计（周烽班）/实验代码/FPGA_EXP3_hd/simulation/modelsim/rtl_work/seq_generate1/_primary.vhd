library verilog;
use verilog.vl_types.all;
entity seq_generate1 is
    port(
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        seq1            : out    vl_logic
    );
end seq_generate1;
