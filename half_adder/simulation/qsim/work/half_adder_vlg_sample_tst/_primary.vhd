library verilog;
use verilog.vl_types.all;
entity half_adder_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end half_adder_vlg_sample_tst;
