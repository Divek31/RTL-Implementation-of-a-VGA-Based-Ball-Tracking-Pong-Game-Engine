module vga_sync(
    input clk, reset,
    output hsync, vsync, video_on, p_tick,
    output [9:0] x, y
);
    // VGA 640x480 Standards
    localparam HD = 640, HF = 16, HB = 48, HR = 96;
    localparam VD = 480, VF = 10, VB = 33, VR = 2;

    reg [9:0] h_count_reg, v_count_reg;
    wire h_end = (h_count_reg == (HD+HF+HB+HR-1));
    wire v_end = (v_count_reg == (VD+VF+VB+VR-1));

    always @(posedge clk or posedge reset) begin
        if (reset) begin h_count_reg <= 0; v_count_reg <= 0; end
        else if (h_end) begin
            h_count_reg <= 0;
            if (v_end) v_count_reg <= 0;
            else v_count_reg <= v_count_reg + 1;
        end
        else h_count_reg <= h_count_reg + 1;
    end

    assign hsync = ~(h_count_reg >= (HD+HF) && h_count_reg <= (HD+HF+HR-1));
    assign vsync = ~(v_count_reg >= (VD+VF) && v_count_reg <= (VD+VF+VR-1));
    assign video_on = (h_count_reg < HD) && (v_count_reg < VD);
    assign x = h_count_reg; assign y = v_count_reg;
endmodule