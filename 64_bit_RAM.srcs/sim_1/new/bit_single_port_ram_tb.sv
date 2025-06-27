`timescale 1ns/1ps

module bit_single_port_ram_tb;

    // Testbench signals
    reg [7:0] data_ip;
    reg [5:0] address;
    reg enableW;
    reg clk;
    wire [7:0] data_op;

    // Instantiate the RAM module
    bit_single_port_ram uut (
        .data_ip(data_ip),
        .address(address),
        .enableW(enableW),
        .clk(clk),
        .data_op(data_op)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        enableW = 0;
        data_ip = 8'd0;
        address = 6'd0;

        // Wait a bit before starting
        #10;

        // WRITE: Write 0xA5 to address 10
        address = 6'd10;
        data_ip = 8'hA5;
        enableW = 1;
        #10; // 1 clock cycle

        // WRITE: Write 0x3C to address 20
        address = 6'd20;
        data_ip = 8'h3C;
        enableW = 1;
        #10;

        // READ: Read from address 10
        address = 6'd10;
        enableW = 0;
        #10;

        // READ: Read from address 20
        address = 6'd20;
        enableW = 0;
        #10;

        // READ: Read from address 0 (should be 0)
        address = 6'd0;
        enableW = 0;
        #10;

        // END
        $display("Simulation completed.");
        $stop;
    end

endmodule
