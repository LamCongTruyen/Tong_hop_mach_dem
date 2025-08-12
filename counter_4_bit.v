3: Chương trình verilog
// code tổng
module up_counter_topmodule (CLK, LED);
input CLK;
output [3:0] LED;
wire w; //khai bao tin hieu ket noi ben trong
// Kết nối theo thứ tự
CLK_DIV_1HZ  U1 (CLK, w); 
up_counter	U2 (w, LED);
endmodule


// code CLK
module CLK_DIV_1HZ (clk_ht, clk_1hz);
input clk_ht;                //Xung clock của CPLD là 100KHz được cấp ở chân P38
output clk_1hz;          //Ngõ ra của bộ chia xung

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
module up_counter (clk, counter_up); 
	input clk;
	output [3:0] counter_up;
	reg [3:0] counter_up_tam = 0;
	always @(posedge clk)
	begin
	 counter_up_tam <= counter_up_tam + 4'd1;
	end 
        assign counter_up = ~counter_up_tam; //dao tin hieu vi led tren kit sang o muc 0
endmodule
