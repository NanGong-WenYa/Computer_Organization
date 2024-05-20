`timescale 1ns / 1ps

module tb_cseladd32;

    reg [31:0] a, b;
    wire [31:0] sum;

    
    cseladd32 dut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    
    initial begin
        
        a = 32'hABCDEFF1;
        b = 32'h12345678;

        
        $display("Input: a=%h, b=%h", a, b);

        
        #100;
        $finish;
    end

endmodule
