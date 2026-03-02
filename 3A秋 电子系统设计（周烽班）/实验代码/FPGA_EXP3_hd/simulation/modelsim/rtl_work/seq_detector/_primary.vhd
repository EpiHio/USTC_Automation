library verilog;
use verilog.vl_types.all;
entity seq_detector is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        s3              : integer := 3;
        s4              : integer := 4;
        s5              : integer := 5;
        s6              : integer := 6;
        s7              : integer := 7;
        s8              : integer := 8;
        s9              : integer := 9
    );
    port(
        clk             : in     vl_logic;
        ena             : in     vl_logic;
        seq_in          : in     vl_logic;
        seq_out         : out    vl_logic;
        LED_data        : out    vl_logic_vector(6 downto 0);
        LED_choose      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of s0 : constant is 1;
    attribute mti_svvh_generic_type of s1 : constant is 1;
    attribute mti_svvh_generic_type of s2 : constant is 1;
    attribute mti_svvh_generic_type of s3 : constant is 1;
    attribute mti_svvh_generic_type of s4 : constant is 1;
    attribute mti_svvh_generic_type of s5 : constant is 1;
    attribute mti_svvh_generic_type of s6 : constant is 1;
    attribute mti_svvh_generic_type of s7 : constant is 1;
    attribute mti_svvh_generic_type of s8 : constant is 1;
    attribute mti_svvh_generic_type of s9 : constant is 1;
end seq_detector;
