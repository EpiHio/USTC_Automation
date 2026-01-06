library verilog;
use verilog.vl_types.all;
entity FPGA_EXP4_hd is
    port(
        clk             : in     vl_logic;
        row_signal      : in     vl_logic_vector(3 downto 0);
        col_signal      : out    vl_logic_vector(3 downto 0);
        LED_data        : out    vl_logic_vector(6 downto 0);
        LED_choose      : out    vl_logic
    );
end FPGA_EXP4_hd;
