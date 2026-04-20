module top_pong(
    input clk_100MHz,       // Basys3/Nexys Clock
    input reset,
    output h_sync, v_sync,
    output [3:0] vga_red, vga_green, vga_blue
);
    wire pixel_clk;
    wire video_on;
    wire [9:0] h_count, v_count;
    wire [11:0] rgb_output;

    // 1. Simple Clock Divider (100MHz to 25MHz approx)
    reg [1:0] clk_div;
    always @(posedge clk_100MHz) clk_div <= clk_div + 1;
    assign pixel_clk = clk_div[1];

    // 2. VGA Sync Generator
    vga_sync sync_unit (
        .clk(pixel_clk), .reset(reset),
        .hsync(h_sync), .vsync(v_sync),
        .video_on(video_on), .p_tick(),
        .x(h_count), .y(v_count)
    );

    // 3. Game Logic & Object Rendering
    graphic_logic game_unit (
        .clk(pixel_clk), .reset(reset),
        .video_on(video_on), .pix_x(h_count), .pix_y(v_count),
        .graph_rgb(rgb_output)
    );

    // Final RGB Output
    assign {vga_red, vga_green, vga_blue} = (video_on) ? rgb_output : 12'h000;

endmodule