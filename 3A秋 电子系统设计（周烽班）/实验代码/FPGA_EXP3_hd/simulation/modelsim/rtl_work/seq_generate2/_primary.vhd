library verilog;
use verilog.vl_types.all;
entity seq_generate2 is
    port(
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        seq2            : out    vl_logic
    );
end seq_generate2;
