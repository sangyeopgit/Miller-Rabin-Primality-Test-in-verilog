
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/05 15:03:15
// Design Name: 
// Module Name: display
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


module display(
    input clk, rst,
    input [35:0] ram,
    output reg [7:0] seg_data,
    output reg [7:0] seg_com
    );
    
    integer cnt;
    
    //seg_com = 8'b01111111;
    always @(posedge clk) 
        if(rst) begin
            seg_data <= 8'b0000_0000;
            seg_com <= 8'b0000_0000;
            cnt = 0;
        end
        else begin
            if(cnt >= 7) cnt = 0;
            else cnt = cnt + 1;
            case(cnt)
                0 : begin
                    seg_com <= 8'b11111110;
                    case(ram[3:0])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////
                    
                    end
                    
                1 : begin
                    seg_com <= 8'b11111101;
                    case(ram[7:4])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                    
                    
                    
                    end
                 2 : begin
                    seg_com <= 8'b11111011;
                    case(ram[11:8])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                    
                    
                    
                    end
                 3 : begin
                    seg_com <= 8'b11110111;
                    case(ram[15:12])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                    
                    
                    
                    end
                 4 : begin
                    seg_com <= 8'b11101111;
                    case(ram[19:16])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                        
                    
                    
                    end
                 5 : begin
                    seg_com <= 8'b11011111;
                    case(ram[23:20])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                      
                    
                    
                    end
                 6 : begin
                    seg_com <= 8'b10111111;
                    case(ram[27:24])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                       
                    
                    
                    end
                 7 : begin
                    seg_com <= 8'b01111111;
                    case(ram[31:28])
                        4'h0 : seg_data <= 8'b1111_1100;
                        4'h1 : seg_data <= 8'b0110_0000;
                        4'h2 : seg_data <= 8'b1101_1010;
                        4'h3 : seg_data <= 8'b1111_0010;
                        
                        4'h4 : seg_data <= 8'b0110_0110;
                        4'h5 : seg_data <= 8'b1011_0110;
                        4'h6 : seg_data <= 8'b1011_1110;
                        4'h7 : seg_data <= 8'b1110_0000;
                        
                        4'h8 : seg_data <= 8'b1111_1110;
                        4'h9 : seg_data <= 8'b1111_0110;
                        4'hc : seg_data <= 8'b0000_1100;
                        4'h0 : seg_data <= 8'b0110_0000;
                        
                        4'hf : seg_data <= 8'b0000_0000;
                    endcase
                    ///////////////////////////////////                              
                    
                    
                    end
                    
            endcase
        end
endmodule
