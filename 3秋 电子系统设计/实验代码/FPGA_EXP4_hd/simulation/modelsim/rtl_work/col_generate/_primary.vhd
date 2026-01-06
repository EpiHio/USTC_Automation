library verilog;
use verilog.vl_types.all;
entity col_generate is
    port(
        clk             : in     vl_logic;
        col_signal      : out    vl_logic_vector(3 downto 0)
    );
end col_generate;
