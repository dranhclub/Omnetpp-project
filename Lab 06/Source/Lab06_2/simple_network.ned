simple Host
{
    parameters:
        int EXB_SIZE = 2; // Exit buffer size
        bool isSender;
    gates:
        inout port;
}

simple Switch
{
    parameters:
        int EXB_SIZE = 2;
        int ENB_SIZE = 2; // Entrance buffer size
        double OPERATION_TIME_PERIOD = 0.005;
    gates:
		inout port[];
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
        A: Host {
            @display("i=abstract/server;p=38.22,29.82");
            isSender = true;
        }
        B: Host {
            @display("i=abstract/server;p=38.22,68.46");
            isSender = true;
        }
        C: Host {
            @display("i=abstract/server;p=38.22,102.48");
            isSender = true;
        }
        D: Switch {
            @display("p=116.340004,68.46;i=abstract/switch");
        }
        E: Host {
            @display("i=abstract/server;p=179.76,68.46");
            isSender = false;
        }
    connections:
		A.port <--> Channel <--> D.port++;
		B.port <--> Channel <--> D.port++;
		C.port <--> Channel <--> D.port++;
		E.port <--> Channel <--> D.port++;
}
