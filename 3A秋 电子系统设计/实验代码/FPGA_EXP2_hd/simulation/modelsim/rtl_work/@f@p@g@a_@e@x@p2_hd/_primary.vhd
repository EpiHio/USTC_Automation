library verilog;
use verilog.vl_types.all;
entity FPGA_EXP2_hd is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        input_data      : in     vl_logic_vector(3 downto 0);
        reg_choose      : in     vl_logic_vector(2 downto 0);
        DP              : out    vl_logic;
        LED_data        : out    vl_logic_vector(6 downto 0);
        LED_choose      : out    vl_logic_vector(7 downto 0);
        clkout_debug    : out    vl_logic
    );
end FPGA_EXP2_hd;
