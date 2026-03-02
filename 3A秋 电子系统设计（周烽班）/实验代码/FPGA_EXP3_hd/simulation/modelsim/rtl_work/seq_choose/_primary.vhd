library verilog;
use verilog.vl_types.all;
entity seq_choose is
    port(
        choose          : in     vl_logic;
        seq1            : in     vl_logic;
        seq2            : in     vl_logic;
        seq_out         : out    vl_logic
    );
end seq_choose;
