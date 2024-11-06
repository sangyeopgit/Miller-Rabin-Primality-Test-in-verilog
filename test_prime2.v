`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/26 02:41:17
// Design Name: 
// Module Name: test_prime2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/*module detect_prime_CTRL(
    input clk, 
    input rst, 
    input flush,
    input [2:0] key_col,
    output wire [3:0] key_row,
    output wire [7:0] oS_COM,
    output wire [7:0] oS_ENS,
    output LED1, LED2, LED3
    );*/

module test_prime2;
    reg clk, rst, flush;
    reg [2:0] col_pressed;
    reg [3:0] row_pressed;
    wire [2:0] key_col;
    wire [3:0] key_row;  
    wire [7:0] oS_COM;
    wire [7:0] oS_ENS;
    wire LED1, LED2, LED3;
    wire [35:0] bcd;
    wire [63:0] bin;
    
    detect_prime_CTRL UUT(clk, rst, flush, key_col, key_row, oS_COM, oS_ENS, LED1, LED2, LED3, bcd, bin);
    assign key_col = &(key_row === row_pressed)? col_pressed : 3'b000;
    
    
    always begin
        #5
        clk = ~clk;
    end
    //100003679 or
        
    initial begin
       clk <= 0;
       rst <= 1;
       flush <= 1;
       #6
       rst <= 0;
       flush <= 0;
       
       #15
       row_pressed <= 4'b1000;
       col_pressed <= 3'b100; // 1
       
       #49
       row_pressed <= 4'b0000;
       col_pressed <= 3'b000;
       
       #50
       row_pressed <= 4'b0010;
       col_pressed <= 3'b001; // 9
       
       #100
       row_pressed <= 4'b0000;
       col_pressed <= 3'b000;
       $display("print binary : %d", bin);
       #50
       rst <= 1;
       #20
       rst <= 0;
       
       #1000;
       
    end
    
    
endmodule
