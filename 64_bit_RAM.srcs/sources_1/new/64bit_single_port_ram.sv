module bit_single_port_ram(
    input [7:0] data_ip,   // Data input
    input [5:0] address,   // Address input
    input enableW,         // Write enable
    input clk,             // Clock
    output [7:0] data_op   // Data output
);

    reg [7:0] ram [63:0];  // 8-bit wide, 64-location memory
    reg [5:0] add_reg;    // Registered address for reading

    always @(posedge clk) begin
        if (enableW)
            ram[address] <= data_ip;// Write to memory
        add_reg <= address;// Always latch address for reading
    end

    assign data_op = ram[add_reg];   // Read from latched address

endmodule


