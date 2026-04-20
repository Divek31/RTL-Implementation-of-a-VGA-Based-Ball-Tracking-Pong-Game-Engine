module tb_pong();
    reg clk;
    reg reset;
    wire h_sync, v_sync;
    wire [3:0] r, g, b;

    // Project ko connect karo
    top_pong dut (.clk_100MHz(clk), .reset(reset), .h_sync(h_sync), .v_sync(v_sync), 
                  .vga_red(r), .vga_green(g), .vga_blue(b));

    // 100MHz Clock generator
    always #5 clk = ~clk; 

    initial begin
        clk = 0; reset = 1; #20;
        reset = 0; // Reset off, game start!
        #1000000;  // Simulation ko thodi der chalne do
        $finish;
    end
endmodule