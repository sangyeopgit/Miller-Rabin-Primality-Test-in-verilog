`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/05 15:42:22
// Design Name: 
// Module Name: clk_divder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Createdx
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module divider(
    input clk_in,
    output reg clk_out
    );
    
    integer param = 24;
    reg [25:0] q;
    wire [25:0] r;
    
    initial
    begin
        q <= 0;
        clk_out <= 0;
    end 
    
    always @(posedge clk_in)
        begin
        if (q == param)
            begin
            clk_out <= ~clk_out;
            q <= 0;
            end
        else
            q <= r;
        end
    assign r = q + 1;   
endmodule

