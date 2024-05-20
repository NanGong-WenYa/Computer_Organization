`timescale 1ns / 1ps
module add1(

    input a,
    input b,
    input cin,
    output reg sum,
    output reg cout
);

    always @ (a, b, cin)
    begin 
        sum = a ^ b ^ cin;
        cout = (a & b) | (cin & (a ^ b)); 
    end

endmodule

module add16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] carry; // 进位信号数组

    // 实例化16个1位全加器并连线
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_loop
            add1 adder_inst (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : carry[i - 1]), // 进位信号的连接
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate

    // 最后一个进位作为 cout 输出
    assign cout = carry[15];

endmodule

module cseladd32(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum1, sum2;
    wire [15:0] a_high, a_low, b_high, b_low;
    wire [15:0] select_sum;

    // 分割输入
    assign a_high = a[31:16];
    assign a_low = a[15:0];
    assign b_high = b[31:16];
    assign b_low = b[15:0];

    // 两个16位加法器计算前16位的和
    add16 adder1 (
        .a(a_high),
        .b(b_high),
        .cin(1'b0), 
        .sum(sum1),
        .cout()
    );

    add16 adder2 (
        .a(a_low),
        .b(b_low),
        .cin(1'b0), 
        .sum(sum2),
        .cout()
    );

   
    assign select_sum = (sum1 >= sum2) ? sum1 : sum2;

    
    assign sum = {select_sum, sum1 + sum2};

endmodule
