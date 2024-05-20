`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/22 19:25:14
// Design Name: 
// Module Name: add16
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

module add1(input a, input b, input cin, output reg sum, output reg cout);

    always @ (a, b, cin)
    begin 
        sum = a ^ b ^ cin;
        cout = (a & b) | (b & cin)|(a&cin);
    end

endmodule

module add16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

    wire [15:0] carry; // ��λ�ź�����

  
    // 16λ�ӷ������߼�
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_loop
            // ʵ����16��1λȫ����������
            add1 adder_inst (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : carry[i - 1]), // ��λ�źŵ�����
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate

    // ���һ����λ��Ϊcout���
    assign cout = carry[15];

endmodule

