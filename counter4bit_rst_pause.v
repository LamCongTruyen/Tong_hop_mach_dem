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
