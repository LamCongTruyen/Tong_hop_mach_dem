// Chương trình Verilog
// code 
module bcd_counter_up(
    input  CLK,
    input reset,
    input pause,
    output [3:0] LED
    );
wire w; //khai bao tin hieu ket noi ben trong
// Kết nối theo thứ tự
CLK_DIV_1HZ  U1 (CLK, w); 
up_counter	U2 (w, reset, pause,LED);
endmodule
// code xung
module CLK_DIV_1HZ(clk_ht,clk_1hz );
    input clk_ht;
    output clk_1hz;
   
reg clk_1hz = 0;
reg [16:0] counter = 0;  
always @ (posedge clk_ht)  
    begin
    counter <= counter + 1;
        if (counter == 16'd50000)         //counter là hằng số đếm, Counter = (fin/fout)/2    
            begin    
                    counter <= 0;
                    clk_1hz <= ~clk_1hz;    
            end
        else
            clk_1hz <= clk_1hz;
    end

endmodule
// code đếm 
module up_counter(
    input CLK,
    input reset,
    input pause,
    output [3:0] counter_bcd
    );
	 
	 reg [3:0] counter_tam = 0; 
always @(posedge CLK) begin
        if (reset) 
            counter_tam <= 4'b0000;  // Reset về 0000
        else if (!pause) begin
            if (counter_tam == 4'b1001)  // Nếu đạt 9 (BCD)
                counter_tam <= 4'b0000;  // Quay về 0000
            else
                counter_tam <= counter_tam + 1; // Đếm lên bình thường
        end
    end
	assign counter_bcd = ~counter_tam; 
endmodule
