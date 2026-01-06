library verilog;
use verilog.vl_types.all;
entity FPGA_EXP5_IP is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sign            : out    vl_logic_vector(7 downto 0)
    );
end FPGA_EXP5_IP;
