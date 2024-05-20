`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/19 11:42:08
// Design Name: 
// Module Name: ds
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

`timescale 1ns / 1ps // ����ʱ�䵥λ

module SimpleCalculator_tb;

    reg [7:0] ina;  // �����ź�
    reg [7:0] inb;  // �����ź�

    wire [7:0] sumab;      // ����ź�
    wire sumflag;
    wire [7:0] leftshiftA;
    wire lessflag;
    wire equalflag;
    wire [7:0] bitXorflag;

    // ʵ��������ģ��
    SimpleCalculator dut (
        .ina(ina),
        .inb(inb),
        .sumab(sumab),
        .sumflag(sumflag),
        .leftshiftA(leftshiftA),
        .lessflag(lessflag),
        .equalflag(equalflag),
        .bitXorflag(bitXorflag)
    );

    // ʱ�ӷ�����
    reg clk = 0;

    always #5 clk = ~clk; // ʱ������Ϊ10��ʱ�䵥λ

    initial begin
        // ��ʼ�������ź�
        ina = 8'b10101010;  // 170
        inb = 8'b00110011;  // 51

        // ģ�����
        #20; // �ȴ�һ��ʱ��

        // ��ӡ���
        $display("ina: %b, inb: %b", ina, inb);
        $display("sumab: %b, sumflag: %b", sumab, sumflag);
        $display("leftshiftA: %b", leftshiftA);
        $display("lessflag: %b, equalflag: %b", lessflag, equalflag);
        $display("bitXorflag: %b", bitXorflag);

        // ��������
        $finish;
    end

endmodule

