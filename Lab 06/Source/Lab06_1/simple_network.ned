simple Host
{
    parameters:
        int EXB_SIZE = 2; // Exit buffer size
    gates:
        output out;
}

simple Switch
{
    gates:
        input in;
}

network SimpleNetwork
{
    parameters:
        double TIMEOUT = 1; // Simulation time = 1s
        double MSG_GEN_INTERVAL = 0.005; // Message generation interval time = 5ms
        @display("bgb=232,80");
    submodules:
        host: Host {
            @display("i=abstract/server;p=38.22,29.82");
        }
        switch: Switch {
            @display("p=157.92,29.82;i=abstract/switch");
        }
    connections:
        host.out --> {  delay = 15ms; } --> switch.in;
}
