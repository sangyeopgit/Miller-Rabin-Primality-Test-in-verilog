//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 16:27:59
// Design Name: 
// Module Name: bcd2bin
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


module bcd2bin(
    input [35:0] bcd,
    output [63:0] bin
    );
    
    assign bin = bcd[3:0]
               +10*bcd[7:4]
               +100*bcd[11:8]
               +1000*bcd[15:12]
               +10000*bcd[19:16]
               +100000*bcd[23:20]
               +1000000*bcd[27:24]
               +10000000*bcd[31:28]
               +100000000*bcd[35:32];
endmodule
