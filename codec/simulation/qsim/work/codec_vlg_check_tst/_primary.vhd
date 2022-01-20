library verilog;
use verilog.vl_types.all;
entity codec_vlg_check_tst is
    port(
        Y               : in     vl_logic;
        Z               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end codec_vlg_check_tst;
