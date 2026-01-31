module parking_fsm(
    input clk,
    input reset,
    input car_in,      // 1 = car detected
    input pass_ok,     // 1 = correct password
    output reg green_led,
    output reg red_led
);

    // STATES
    parameter IDLE  = 3'b000;
    parameter WAIT  = 3'b001;
    parameter WRONG = 3'b010;
    parameter OK    = 3'b011;
    parameter NEXT  = 3'b100;

    reg [2:0] state, next_state;

    // STATE REGISTER
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // NEXT STATE LOGIC
    always @(*) begin
        case(state)

            IDLE:
                if (car_in)
                    next_state = WAIT;
                else
                    next_state = IDLE;

            WAIT:
                if (pass_ok)
                    next_state = OK;
                else
                    next_state = WRONG;

            WRONG:
                if (pass_ok)
                    next_state = OK;
                else
                    next_state = WRONG;

            OK:
                next_state = NEXT;

            NEXT:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end


    // OUTPUT LOGIC
    always @(*) begin
        green_led = 0;
        red_led   = 0;

        case(state)
            WRONG: red_led   = 1;
            OK:    green_led = 1;
        endcase
    end

endmodule
