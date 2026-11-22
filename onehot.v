// Implement one-hot state machine
module onehot(
    input w, Clock, Reset,
    output [4:0] states,
    output z
);

    wire AState, BState, CState, DState, EState;
    wire ANext, BNext, CNext, DNext, ENext;

    dff dA(
        .Default(1'b1),
        .D(ANext),
        .clk(Clock),
        .reset(Reset),
        .Q(AState)
    );
    
    dff dB(
        .Default(1'b0),
        .D(BNext),
        .clk(Clock),
        .reset(Reset),
        .Q(BState)
    );
    
    dff dC(
        .Default(1'b0),
        .D(CNext),
        .clk(Clock),
        .reset(Reset),
        .Q(CState)
    );
    
    dff dD(
        .Default(1'b0),
        .D(DNext),
        .clk(Clock),
        .reset(Reset),
        .Q(DState)
    );
    
    dff dE(
        .Default(1'b0),
        .D(ENext),
        .clk(Clock),
        .reset(Reset),
        .Q(EState)
    );
    
    assign states = { EState, DState, CState, BState, AState };
    assign z = CState | EState;
    
    assign ANext = 0;
    assign BNext = ~w & (AState | DState | EState);
    assign CNext = ~w & (BState | CState);
    assign DNext =  w & (AState | BState | CState);
    assign ENext =  w & (DState | EState);
    

endmodule 