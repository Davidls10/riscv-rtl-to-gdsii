module data_memory #(parameter N = 32, M = 32)
            (input  clk,
             input  write_enable,
             input  [N-1:0] adr,
             input  [M-1:0] din,
             output [M-1:0] dout);

    reg [M-1:0] mem [2**N-1:0];

    always @(posedge clk)
        if (write_enable) mem [adr] <= din;

    assign dout = mem[adr];
endmodule