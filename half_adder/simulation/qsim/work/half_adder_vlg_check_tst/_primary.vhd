library verilog;
use verilog.vl_types.all;
entity half_adder_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Sum             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end half_adder_vlg_check_tst;
