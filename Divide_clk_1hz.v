3: Chương trình verilog
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
