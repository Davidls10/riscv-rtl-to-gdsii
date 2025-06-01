module register_file #(parameter N = 5,  M = 32, L = 32)
                (input clk,
                 input we,
                 input [N-1:0] a1, a2, a3,
                 input [M-1:0] wd3,
                 output [M-1:0] rd1, rd2);

    reg [M-1:0] rf [L-1:0];

    initial begin
        rf[9] = 32'h04;
        rf[4] = 32'd14;
        rf[5] = 32'd5;
    end

    always @(posedge clk)
            if (we) begin rf[a3] = wd3; $display("Ici"); end

    assign rd1 = (a1 != 0) ? rf[a1] : 0;
    assign rd2 = (a2 != 0) ? rf[a2] : 0;
endmodule