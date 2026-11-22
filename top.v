module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
    onehot onehot(
        .Clock(btnC),
        .Reset(btnU),
        .w(sw),
        .states(led[6:2]),
        .z(led[0])
    );
    
    binary binary(
        .Clock(btnC),
        .Reset(btnU),
        .w(sw),
        .states(led[9:7]),
        .z(led[1])
    );

endmodule