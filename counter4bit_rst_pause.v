3: Chương trình Verilog
Chương trình tổng
module topmodule(
    input CLK,
    output [3:0] LED,
    input pause,
    input reset
    );
wire w; //khai bao tin hieu ket noi ben trong
// Kết nối theo thứ tự
CLK_DIV_1HZ  U1 (CLK, w); 
up_counter	U2 (w, reset, pause, LED);

endmodule
chương trình xung
module CLK_DIV_1HZ(clk_ht,clk_1hz);
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
chương trình đếm
module up_counter(
    input CLK,
    input reset,
    input pause,
    output [3:0] counter_up 
    );
reg [3:0] counter_up_tam = 0; 

     always @(posedge CLK) begin
        if (reset) 
            counter_up_tam <= 4'b0000;  // Reset bộ đếm về 0
        else if (!pause) 
            counter_up_tam <= counter_up_tam + 1; // Chỉ đếm lên khi pause = 0
    end

    assign counter_up = ~counter_up_tam; 

endmodule
