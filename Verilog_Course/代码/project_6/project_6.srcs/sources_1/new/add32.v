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
        cout = (a & b) | (cin & (a ^ b)); // �޸� cout ���߼�����
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

    // ʵ����16��1λȫ����������
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : adder_loop
            add1 adder_inst (
                .a(a[i]),
                .b(b[i]),
                .cin(i == 0 ? cin : carry[i - 1]), // ��λ�źŵ�����
                .sum(sum[i]),
                .cout(carry[i])
            );
        end
    endgenerate

    // ���һ����λ��Ϊ cout ���
    assign cout = carry[15];

endmodule

module add32(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

    wire [15:0] carry1, carry2;
    wire [15:0] sum1, sum2;

    // ���� 16 λ�ӷ���ʵ��
    add16 adder1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(cin),
        .sum(sum1),
        .cout(carry1)
    );

    add16 adder2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(carry1[15]),
        .sum(sum2),
        .cout(carry2)
    );

    assign sum = {sum2, sum1}; // 32 λ�ӷ��������
    assign cout = carry2[15] | (carry1[15] & carry2[14]); // ������ cout ���

endmodule





