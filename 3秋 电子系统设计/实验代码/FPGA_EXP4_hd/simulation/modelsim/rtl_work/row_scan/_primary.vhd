library verilog;
use verilog.vl_types.all;
entity row_scan is
    port(
        clk             : in     vl_logic;
        col_signal      : in     vl_logic_vector(3 downto 0);
        row_signal      : in     vl_logic_vector(3 downto 0);
        LED_data        : out    vl_logic_vector(6 downto 0);
        LED_choose      : out    vl_logic
    );
end row_scan;
