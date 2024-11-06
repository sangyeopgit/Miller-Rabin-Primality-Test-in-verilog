//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/21 10:03:27
// Design Name: 
// Module Name: kepad
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


module key_pad_Input(clk, rst, key_row, key_col, bcd);
    input clk, rst;
    input wire [2:0] key_col;
    output [3:0] key_row;
    

    output [35:0] bcd;
    
    reg [7:0] seg_data;
    reg [3:0] key_row;
    reg [1:0] cnt_key;
    reg [3:0] reg_key;
    reg [35:0] bcd;
    reg [3:0] D_in;
    wire key_stop;
    
    assign key_stop = key_col[0] | key_col[1] | key_col[2];
    
    always @(posedge clk) begin
        if(rst) begin
            cnt_key = 0;
        end
        else cnt_key = cnt_key + 1;
    end
    
    always @(posedge clk) begin
        if(rst) key_row = 4'b0000;
        else
            if(!key_stop) begin
                case(cnt_key)
                    2'b00 : key_row = 4'b1000;
                    2'b01 : key_row = 4'b0100;
                    2'b10 : key_row = 4'b0010;
                    2'b11 : key_row = 4'b0001;
                endcase
            end
    end
    
    always @ (posedge clk) begin
        if(rst) begin
                reg_key = 4'hf;
                D_in = 4'hf;
                bcd = 0;
        end
        else
            case(key_row)
                4'b1000:
                    case(key_col)
                        3'b100 : if(D_in != 4'h1) begin
                                    reg_key <= 4'h1;
                                    D_in <= 4'h1;
                                    bcd = {bcd[31:0] , 4'h1};
                                 end
                        3'b010 : if(D_in != 4'h2) begin
                                    reg_key <= 4'h2;
                                    D_in <= 4'h2;
                                    bcd = {bcd[31:0] , 4'h2};
                                 end
                        3'b001 : if(D_in != 4'h3) begin
                                    reg_key <= 4'h3;
                                    D_in <= 4'h3;
                                    bcd = {bcd[31:0] , 4'h3};
                                 end   
                        default : begin
                                    reg_key <= 4'hf;
                                    D_in <= 4'hf;
                                  end
                    endcase
                
                4'b0100 : 
                    case(key_col)
                        3'b100 :  if(D_in != 4'h4) begin
                                    reg_key <= 4'h4;
                                    D_in <= 4'h4;
                                    bcd = {bcd[31:0] , 4'h4};
                                  end
                        3'b010 : if(D_in != 4'h5) begin
                                    reg_key <= 4'h5;
                                    D_in <= 4'h5;
                                    bcd = {bcd[31:0] , 4'h5};
                                  end
                        3'b001 : if(D_in != 4'h6) begin
                                    reg_key <= 4'h6;
                                    D_in <= 4'h6;
                                    bcd = {bcd[31:0] , 4'h6};
                                  end
                        default : begin
                                    reg_key <= 4'hf;
                                    D_in <= 4'hf;
                                  end
                    endcase
                    
                4'b0010 : 
                    case(key_col)
                        3'b100 : if(D_in != 4'h7) begin
                                    reg_key <= 4'h7;
                                    D_in <= 4'h7;
                                    bcd = {bcd[31:0] , 4'h7};
                                  end
                        3'b010 : if(D_in != 4'h8) begin
                                    reg_key <= 4'h8;
                                    D_in <= 4'h8;
                                    bcd = {bcd[31:0] , 4'h8};
                                  end
                        3'b001 : if(D_in != 4'h9) begin
                                    reg_key <= 4'h9;
                                    D_in <= 4'h9;
                                    bcd = {bcd[31:0] , 4'h9};
                                  end
                        default : begin
                                    reg_key <= 4'hf;
                                    D_in <= 4'hf;
                                  end
                    endcase
                    
                4'b0001 : 
                    case(key_col)
                        3'b100 : if(D_in != 4'hc) begin
                                    reg_key <= 4'hc;
                                    D_in <= 4'hc;
                                    bcd = {bcd[31:0] , 4'hc};
                                  end
                        3'b010 : if(D_in != 4'h0 )begin
                                    reg_key <= 4'h0;
                                    D_in <= 4'h0;
                                    bcd = {bcd[31:0] , 4'h0};
                                  end
                        3'b001 : if(D_in != 4'hd) begin
                                    reg_key <= 4'hd;
                                    D_in <= 4'hd;
                                    bcd = {bcd[31:0] , 4'hd};
                                  end
                        default : begin
                                    reg_key <= 4'hf;
                                    D_in <= 4'hf;
                                  end
                    endcase
                default : begin
                                reg_key <= 4'hf;
                                D_in <= 4'hf;
                          end 
            endcase // endkey_row
    end // endalways
    
    
    
    
endmodule

