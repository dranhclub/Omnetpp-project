simple Host
{
    parameters:
        int EXB_SIZE = 5;
        int ENB_SIZE = 5;
	gates:
	    inout port[];
}

simple Switch
{
    parameters:
        int EXB_SIZE = 5;
        int ENB_SIZE = 5;
        double OPERATION_TIME_PERIOD = 3334e-9; // 3334ns
    gates:
        inout port[];
}

network Torus
{
    parameters:
        // Simulation time 1s 
        double TIMEOUT = 1; 
        // Message generation time period = 0.1ms
        double MSG_GEN_TIME_PERIOD = 0.1e-3;
        // Interval = 10ms / old: 10us
        double INTERVAL = 10e-3; 
        // Credit delay = 1ns
        double CREDIT_DELAY = 1e-9; 
    @display("bgb=1000,700");
    types:
        channel Channel extends ned.DatarateChannel
        {
            datarate = 1Gbps;
        }
    submodules:
        sw0_0_0: Switch { @display("p=200.0,200.0;i=abstract/switch"); }
		sw0_1_0: Switch { @display("p=200.0,400.0;i=abstract/switch"); }
		sw0_2_0: Switch { @display("p=200.0,600.0;i=abstract/switch"); }
		sw1_0_0: Switch { @display("p=400.0,200.0;i=abstract/switch"); }
		sw1_1_0: Switch { @display("p=400.0,400.0;i=abstract/switch"); }
		sw1_2_0: Switch { @display("p=400.0,600.0;i=abstract/switch"); }
		sw2_0_0: Switch { @display("p=600.0,200.0;i=abstract/switch"); }
		sw2_1_0: Switch { @display("p=600.0,400.0;i=abstract/switch"); }
		sw2_2_0: Switch { @display("p=600.0,600.0;i=abstract/switch"); }
		h0_0_0: Host { @display("p=170.0,170.0;i=abstract/server;is=s"); }
		h0_1_0: Host { @display("p=170.0,370.0;i=abstract/server;is=s"); }
		h0_2_0: Host { @display("p=170.0,570.0;i=abstract/server;is=s"); }
		h1_0_0: Host { @display("p=370.0,170.0;i=abstract/server;is=s"); }
		h1_1_0: Host { @display("p=370.0,370.0;i=abstract/server;is=s"); }
		h1_2_0: Host { @display("p=370.0,570.0;i=abstract/server;is=s"); }
		h2_0_0: Host { @display("p=570.0,170.0;i=abstract/server;is=s"); }
		h2_1_0: Host { @display("p=570.0,370.0;i=abstract/server;is=s"); }
		h2_2_0: Host { @display("p=570.0,570.0;i=abstract/server;is=s"); }
	connections:
		sw0_0_0.port++ <--> Channel <--> sw0_1_0.port++;
		sw0_1_0.port++ <--> Channel <--> sw0_2_0.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_1_0.port++;
		sw1_1_0.port++ <--> Channel <--> sw1_2_0.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_1_0.port++;
		sw2_1_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_0.port++ <--> Channel <--> sw1_0_0.port++;
		sw1_0_0.port++ <--> Channel <--> sw2_0_0.port++;
		sw0_1_0.port++ <--> Channel <--> sw1_1_0.port++;
		sw1_1_0.port++ <--> Channel <--> sw2_1_0.port++;
		sw0_2_0.port++ <--> Channel <--> sw1_2_0.port++;
		sw1_2_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_2_0.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_2_0.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_0.port++ <--> Channel <--> sw2_0_0.port++;
		sw0_1_0.port++ <--> Channel <--> sw2_1_0.port++;
		sw0_2_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_0.port++ <--> Channel <--> h0_0_0.port++;
		sw0_1_0.port++ <--> Channel <--> h0_1_0.port++;
		sw0_2_0.port++ <--> Channel <--> h0_2_0.port++;
		sw1_0_0.port++ <--> Channel <--> h1_0_0.port++;
		sw1_1_0.port++ <--> Channel <--> h1_1_0.port++;
		sw1_2_0.port++ <--> Channel <--> h1_2_0.port++;
		sw2_0_0.port++ <--> Channel <--> h2_0_0.port++;
		sw2_1_0.port++ <--> Channel <--> h2_1_0.port++;
		sw2_2_0.port++ <--> Channel <--> h2_2_0.port++;
}