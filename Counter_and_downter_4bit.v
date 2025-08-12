3: Chương trình verilog
//  
module up_down_counter(
    input clk,
    output [3:0] counter_up_down
    );

reg [3:0] counter_up_down_tam;
reg count; 
initial 
	begin
		counter_up_down_tam = 4'b0000;
		count = 1'b0;
	end
always @(posedge clk)
	begin
		if(count == 1'b0) begin
			if(counter_up_down_tam == 4'b1111) begin
				count <= 1'b1;
				counter_up_down_tam <= counter_up_down_tam - 4'd1;
				end
			else begin
				counter_up_down_tam <= counter_up_down_tam + 4'd1;
			end
		end
		else begin
			if(counter_up_down_tam == 4'b0000) begin
				count <= 1'b0;
				counter_up_down_tam <= counter_up_down_tam + 4'd1;
				end
			else begin
				counter_up_down_tam <= counter_up_down_tam - 4'd1;
			end
		 end
	end
        assign counter_up_down = ~counter_up_down_tam; //dao tin hieu vi led tren kit sang o muc 0

endmodule

//

module CLK_DIV_1HZ(
    input clk_ht,
    output reg clk_1hz = 0
    );
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

//module top_module(
    input CLK,
    output [3:0] LED
    );
wire w; //khai bao tin hieu ket noi ben trong
// Kết nối theo thứ tự
CLK_DIV_1HZ  U1 (CLK, w); 
up_down_counter	U2 (w, LED);

endmodule
