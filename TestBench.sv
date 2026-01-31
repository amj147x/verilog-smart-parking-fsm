`timescale 1ns/1ps

module tb;

    reg clk;
    reg reset;
    reg car_in;
    reg pass_ok;

    wire green_led;
    wire red_led;

    // Instantiate FSM
    parking_fsm uut (
        .clk(clk),
        .reset(reset),
        .car_in(car_in),
        .pass_ok(pass_ok),
        .green_led(green_led),
        .red_led(red_led)
    );

    // Clock: toggles every 5ns
    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb);

        // Initial values
        clk = 0;
        reset = 1;
        car_in = 0;
        pass_ok = 0;

        #10 reset = 0;


        // Test 1: Wrong password

        #10 car_in = 1; pass_ok = 0;  // car arrives, wrong pass
        #10 car_in = 0;

        #20 pass_ok = 1;              // correct retry

        #20 pass_ok = 0;

      
        // Test 2: Direct correct
        #20 car_in = 1; pass_ok = 1;
        #10 car_in = 0;
        #10 pass_ok = 0;

        #50 $finish;
    end

endmodule
