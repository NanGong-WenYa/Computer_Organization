`timescale 1ns / 1ps

module tb_add32;

    // ���屻����ģ����ź�
    reg [31:0] a, b;
    reg cin;
    wire [31:0] sum;
    wire cout;

    // ʵ���������Ե�ģ��
    add32 dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // ��ʼ���ź�ֵ
    initial begin
        // ���ò�������ֵ
        a = 32'b11001100110011001100110011001100;
        b = 32'b10101010101010101010101010101010;
        cin = 1'b0;

        // �ȴ�һ��ʱ���Ա�۲����
        #10;

        // ������
        $display("a = %b", a);
        $display("b = %b", b);
        $display("cin = %b", cin);
        $display("sum = %b", sum);
        $display("cout = %b", cout);

        // ��������
        $finish;
    end

endmodule
