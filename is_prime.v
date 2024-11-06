//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 02:47:54
// Design Name: 
// Module Name: is_prime
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


module is_prime(
    input clk,
    input rst,
    input [63:0] x,
    output Y,
    output ret
    );
   
    
    wire G0, G1, G2;
    wire ret0, ret1, ret2;
    //miller_Rabin(clk, rst, n,  a, Y, ret);
    miller_Rabin mR0(clk, rst, x, 2, G0, ret0);
    miller_Rabin mR1(clk, rst, x, 7, G1, ret1);
    miller_Rabin mR2(clk, rst, x, 61, G2, ret2);
    
    wire G;
    assign G = G0 | G1 | G2;
    assign Y = G;
    assign ret = (~G)*(ret0*ret1*ret2 | x == 2 | x == 7 | x == 61);
endmodule
