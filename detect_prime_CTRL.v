//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lee Sangyeop
// 
// Create Date: 2023/11/14 19:19:14
// Design Name: 
// Module Name: detect_prime_CTRL
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

 /*
   [a]
[f]   [b]
   [g]
[e]   [c]
   [d]   [dp]
*/
 
    
//Display(Y, prime_Sig, [39:0] bcd, [7:0] oS_COM, [7:0] oS_ENS0, oS_ENS1, oS_ENS2, ... oS_ENS7 )
//key_pad_Input(clk, rst, key_row, key_col, seg_data, seg_com, bcd);
//Display(Y, ret, bcd, oS_COM, oS_ENS);

module detect_prime_CTRL(
    input clk, 
    input rst, 
    input flush,
    input [2:0] key_col,
    output wire [3:0] key_row,
    output wire [7:0] oS_COM,
    output wire [7:0] oS_ENS,
    output LED1, LED2, LED3
    );
    
    wire Y, ret;
    wire [63:0] bin;
    wire [35:0] bcd;
    wire clk_out;
    
    divider U0(clk, clk_out);
    key_pad_Input U1(clk, flush, key_row, key_col, bcd);
    bcd2bin U2(bcd, bin);
    is_prime U3(clk_out, rst, bin, Y, ret);
    display U4(clk, rst, bcd, oS_ENS, oS_COM);
    /*
    module display(
    input clk, rst,
    input [35:0] ram,
    output reg [7:0] seg_data,
    output reg [7:0] seg_com
    );
    */
    assign LED1 = Y;
    assign LED2 = (~Y)*ret;
    assign LED3 = (~Y)*(~ret);
 
endmodule
