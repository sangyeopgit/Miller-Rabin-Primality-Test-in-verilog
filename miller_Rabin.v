//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/07 16:12:39
// Design Name: 
// Module Name: miller_Rabin
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

// 61 = 111101
module miller_Rabin(
    input clk,
    input rst,
    input [63:0] n,
    input [5:0] a,
    //Y = 0 when the module end
    output reg Y,
    //ret = 1 means true
    output reg ret
    );
    
    //assign temp variables
    reg [63:0] d;
    reg [63:0] pow_res;
    reg [63:0] temp_d;
    reg [63:0] temp_a;
    reg s1;
    reg s0 ;
    
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin //initialize variables
            d <= n-1;
            pow_res <= 1;
            temp_d <= d;
            temp_a <= a;
            s1 <= 1'b0;
            s0 <= 1'b0;
            Y <= 1'b1;
        end
        else begin
            if(Y == 1'b0) Y = 1'b0; // hold the Y value
            else begin
                if(temp_d != 0) begin
                    if(temp_d[0] == 1'b1) pow_res = (pow_res * temp_a)%n;
                    temp_a = (temp_a*temp_a)%n;
                    temp_d = {1'b0, (temp_d >> 1)};
                end
                else begin
                    s1 = (pow_res == n-1);
                    s0 = (d[0] == 1'b1);
                    Y = ~(s1 | s0);
                    ret = (~s1 & s0)&(s1|(pow_res == 1)) | s1;
                    d = {1'b0, (d >> 1)};
                    
                    //initialize the value
                    pow_res = 1;
                    temp_d = d;
                    temp_a = a;
                end
            end // end Y
        end // end rst
    end // end always

endmodule
