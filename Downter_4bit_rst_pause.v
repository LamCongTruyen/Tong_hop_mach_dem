3: Chương trình verilog
module CLK_DIV_1HZ(
    input clk_ht ,
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

///

module down_counter(
    input clk,
    output [3:0] counter_down,
    input rst,
    input pause
    );
reg [3:0] counter_up_tam = 0;
initial counter_up_tam <= 4'b1111;
always @(posedge clk)
	begin
	if(rst) begin
		counter_up_tam <= 4'b1111;
		end
	else if(counter_up_tam == 4'b0000) begin
		counter_up_tam <= 4'b1111;
		end
	else if(pause) begin
		counter_up_tam <= counter_up_tam;
		end
	else
	 counter_up_tam <= counter_up_tam - 4'd1;
	end 
        assign counter_down = ~counter_up_tam; //dao tin hieu vi led tren kit sang o muc 0
endmodule

//

module top_module(

    input CLK,

    output [3:0] LED,

    input RST,

    input PAUSE

    );

wire w; //khai bao tin hieu ket noi ben trong

// Kết nối theo thứ tự

CLK_DIV_1HZ  U1 (CLK, w); 

down_counter	U2 (w,LED, RST, PAUSE);

endmodule
