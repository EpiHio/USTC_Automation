library verilog;
use verilog.vl_types.all;
entity FPGA_EXP3_hd is
    port(
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        choose          : in     vl_logic;
        \signal\        : out    vl_logic;
        LED_data        : out    vl_logic_vector(6 downto 0);
        LED_choose      : out    vl_logic
    );
end FPGA_EXP3_hd;
