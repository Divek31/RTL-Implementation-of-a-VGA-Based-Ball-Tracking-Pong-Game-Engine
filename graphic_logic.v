module graphic_logic(
    input clk, reset, video_on,
    input [9:0] pix_x, pix_y,
    output reg [11:0] graph_rgb
);
    reg [9:0] ball_x, ball_y;
    reg [9:0] x_vel = 2, y_vel = 2; // Ball speed
    
    // Ball Movement Logic (Updated at 60Hz)
    wire refr_tick = (pix_x==0 && pix_y==480); 
    always @(posedge clk) begin
        if (refr_tick) begin
            // Bounce Logic
            if (ball_x <= 0 || ball_x >= 630) x_vel <= -x_vel;
            if (ball_y <= 0 || ball_y >= 470) y_vel <= -y_vel;
            ball_x <= ball_x + x_vel;
            ball_y <= ball_y + y_vel;
        end
    end

    // Draw Logic
    wire ball_on = (pix_x >= ball_x && pix_x <= ball_x+10) && 
                   (pix_y >= ball_y && pix_y <= ball_y+10);

    always @* begin
        if (!video_on) graph_rgb = 12'h000;
        else if (ball_on) graph_rgb = 12'hF00; // Red Ball
        else graph_rgb = 12'h000; // Black Background
    end
endmodule