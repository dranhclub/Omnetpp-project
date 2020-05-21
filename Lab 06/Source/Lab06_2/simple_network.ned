simple SendingHost
{
    parameters:
        int EXB_SIZE = 2; // Exit buffer size
    gates:
        output out;
}

simple ReceivingHost
{
    parameters:
    gates:
        input in;
}

simple Switch
{
    parameters:
        int EXB_SIZE = 2;
        int ENB_SIZE = 2; // Entrance buffer size
        double OPERATION_TIME_PERIOD = 0.005;
    gates:
		input in[];
		output out;
}

network SimpleNetwork
{
    parameters:
        double TIMEOUT = 1; // Simulation time = 1s
        double MSG_GEN_TIME_PERIOD = 0.005; // Message generation time period = 5ms
        double INTERVAL = 0.005; // Interval = 5ms
        double CREDIT_DELAY = 0.001 // Credit delay = 1ms
        @display("bgb=231.84,132.72");
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 15ms;
        }
    submodules:
        A: SendingHost {
            @display("i=abstract/server;p=38.22,29.82");
        }
        B: SendingHost {
            @display("i=abstract/server;p=38.22,68.46");
        }
        C: SendingHost {
            @display("i=abstract/server;p=38.22,102.48");
        }
        D: Switch {
            @display("p=116.340004,68.46;i=abstract/switch");
        }
        E: ReceivingHost {
            @display("i=abstract/server;p=179.76,68.46");
        }
    connections:
		A.out --> Channel --> D.in++;
		B.out --> Channel --> D.in++;
		C.out --> Channel --> D.in++;
		D.out --> Channel --> E.in;
}
