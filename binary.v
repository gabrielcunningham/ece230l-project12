// Implement binary state machine
module binary(
    input w, Clock, Reset,
    output [2:0] states,
    output z
);

    wire [2:0] state, next;
    
    dff X(
        .Default(1'b0),
        .D(next[0]),
        .clk(Clock),
        .reset(Reset),
        .Q(state[0])
    );
    
    dff Y(
        .Default(1'b0),
        .D(next[1]),
        .clk(Clock),
        .reset(Reset),
        .Q(state[1])
    );
    
    dff Z(
        .Default(1'b0),
        .D(next[2]),
        .clk(Clock),
        .reset(Reset),
        .Q(state[2])
    );
    
    assign states = { state[0], state[1], state[2] };
    assign z = ~state[2] & (state[0] ^ state[1]);
    
    assign next[0] = w & (state[0] | state[1] & state[2]);
    assign next[1] = ~state[2] & (state[1] | ~state[0] & w) | ~state[1] & state[2];
    assign next[2] = ~state[1] & (~state[0] & w | ~state[2] & ~w) | ~state[0] & state[1] & (state[2] ^ w);

endmodule