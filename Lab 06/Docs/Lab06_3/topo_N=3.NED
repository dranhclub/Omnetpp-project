simple Switch
{
    gates:
        inout port[];
}

network Torus3D
{
    @display("bgb=1000,700");
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 15ms;
        }
    submodules:
		sw0_0_0: Switch { @display("p=200.0,200.0;i=abstract/switch"); }
		sw0_0_1: Switch { @display("p=280.0,150.0;i=abstract/switch"); }
		sw0_0_2: Switch { @display("p=360.0,100.0;i=abstract/switch"); }
		sw0_1_0: Switch { @display("p=200.0,400.0;i=abstract/switch"); }
		sw0_1_1: Switch { @display("p=280.0,350.0;i=abstract/switch"); }
		sw0_1_2: Switch { @display("p=360.0,300.0;i=abstract/switch"); }
		sw0_2_0: Switch { @display("p=200.0,600.0;i=abstract/switch"); }
		sw0_2_1: Switch { @display("p=280.0,550.0;i=abstract/switch"); }
		sw0_2_2: Switch { @display("p=360.0,500.0;i=abstract/switch"); }
		sw1_0_0: Switch { @display("p=400.0,200.0;i=abstract/switch"); }
		sw1_0_1: Switch { @display("p=480.0,150.0;i=abstract/switch"); }
		sw1_0_2: Switch { @display("p=560.0,100.0;i=abstract/switch"); }
		sw1_1_0: Switch { @display("p=400.0,400.0;i=abstract/switch"); }
		sw1_1_1: Switch { @display("p=480.0,350.0;i=abstract/switch"); }
		sw1_1_2: Switch { @display("p=560.0,300.0;i=abstract/switch"); }
		sw1_2_0: Switch { @display("p=400.0,600.0;i=abstract/switch"); }
		sw1_2_1: Switch { @display("p=480.0,550.0;i=abstract/switch"); }
		sw1_2_2: Switch { @display("p=560.0,500.0;i=abstract/switch"); }
		sw2_0_0: Switch { @display("p=600.0,200.0;i=abstract/switch"); }
		sw2_0_1: Switch { @display("p=680.0,150.0;i=abstract/switch"); }
		sw2_0_2: Switch { @display("p=760.0,100.0;i=abstract/switch"); }
		sw2_1_0: Switch { @display("p=600.0,400.0;i=abstract/switch"); }
		sw2_1_1: Switch { @display("p=680.0,350.0;i=abstract/switch"); }
		sw2_1_2: Switch { @display("p=760.0,300.0;i=abstract/switch"); }
		sw2_2_0: Switch { @display("p=600.0,600.0;i=abstract/switch"); }
		sw2_2_1: Switch { @display("p=680.0,550.0;i=abstract/switch"); }
		sw2_2_2: Switch { @display("p=760.0,500.0;i=abstract/switch"); }
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
		sw0_0_1.port++ <--> Channel <--> sw0_1_1.port++;
		sw0_1_1.port++ <--> Channel <--> sw0_2_1.port++;
		sw1_0_1.port++ <--> Channel <--> sw1_1_1.port++;
		sw1_1_1.port++ <--> Channel <--> sw1_2_1.port++;
		sw2_0_1.port++ <--> Channel <--> sw2_1_1.port++;
		sw2_1_1.port++ <--> Channel <--> sw2_2_1.port++;
		sw0_0_1.port++ <--> Channel <--> sw1_0_1.port++;
		sw1_0_1.port++ <--> Channel <--> sw2_0_1.port++;
		sw0_1_1.port++ <--> Channel <--> sw1_1_1.port++;
		sw1_1_1.port++ <--> Channel <--> sw2_1_1.port++;
		sw0_2_1.port++ <--> Channel <--> sw1_2_1.port++;
		sw1_2_1.port++ <--> Channel <--> sw2_2_1.port++;
		sw0_0_2.port++ <--> Channel <--> sw0_1_2.port++;
		sw0_1_2.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_2.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_1_2.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_2.port++ <--> Channel <--> sw2_1_2.port++;
		sw2_1_2.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_2.port++ <--> Channel <--> sw1_0_2.port++;
		sw1_0_2.port++ <--> Channel <--> sw2_0_2.port++;
		sw0_1_2.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_1_2.port++ <--> Channel <--> sw2_1_2.port++;
		sw0_2_2.port++ <--> Channel <--> sw1_2_2.port++;
		sw1_2_2.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_0_1.port++;
		sw0_1_0.port++ <--> Channel <--> sw0_1_1.port++;
		sw0_2_0.port++ <--> Channel <--> sw0_2_1.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_0_1.port++;
		sw1_1_0.port++ <--> Channel <--> sw1_1_1.port++;
		sw1_2_0.port++ <--> Channel <--> sw1_2_1.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_0_1.port++;
		sw2_1_0.port++ <--> Channel <--> sw2_1_1.port++;
		sw2_2_0.port++ <--> Channel <--> sw2_2_1.port++;
		sw0_0_1.port++ <--> Channel <--> sw0_0_2.port++;
		sw0_1_1.port++ <--> Channel <--> sw0_1_2.port++;
		sw0_2_1.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_1.port++ <--> Channel <--> sw1_0_2.port++;
		sw1_1_1.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_2_1.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_1.port++ <--> Channel <--> sw2_0_2.port++;
		sw2_1_1.port++ <--> Channel <--> sw2_1_2.port++;
		sw2_2_1.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_2_0.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_2_0.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_0.port++ <--> Channel <--> sw2_0_0.port++;
		sw0_1_0.port++ <--> Channel <--> sw2_1_0.port++;
		sw0_2_0.port++ <--> Channel <--> sw2_2_0.port++;
		sw0_0_1.port++ <--> Channel <--> sw0_2_1.port++;
		sw1_0_1.port++ <--> Channel <--> sw1_2_1.port++;
		sw2_0_1.port++ <--> Channel <--> sw2_2_1.port++;
		sw0_0_1.port++ <--> Channel <--> sw2_0_1.port++;
		sw0_1_1.port++ <--> Channel <--> sw2_1_1.port++;
		sw0_2_1.port++ <--> Channel <--> sw2_2_1.port++;
		sw0_0_2.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_2.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_2.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_2.port++ <--> Channel <--> sw2_0_2.port++;
		sw0_1_2.port++ <--> Channel <--> sw2_1_2.port++;
		sw0_2_2.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_0_2.port++;
		sw0_1_0.port++ <--> Channel <--> sw0_1_2.port++;
		sw0_2_0.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_0_2.port++;
		sw1_1_0.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_2_0.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_0_2.port++;
		sw2_1_0.port++ <--> Channel <--> sw2_1_2.port++;
		sw2_2_0.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_0_2.port++;
		sw0_1_0.port++ <--> Channel <--> sw0_1_2.port++;
		sw0_2_0.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_0_2.port++;
		sw1_1_0.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_2_0.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_0_2.port++;
		sw2_1_0.port++ <--> Channel <--> sw2_1_2.port++;
		sw2_2_0.port++ <--> Channel <--> sw2_2_2.port++;
		sw0_0_0.port++ <--> Channel <--> sw0_0_2.port++;
		sw0_1_0.port++ <--> Channel <--> sw0_1_2.port++;
		sw0_2_0.port++ <--> Channel <--> sw0_2_2.port++;
		sw1_0_0.port++ <--> Channel <--> sw1_0_2.port++;
		sw1_1_0.port++ <--> Channel <--> sw1_1_2.port++;
		sw1_2_0.port++ <--> Channel <--> sw1_2_2.port++;
		sw2_0_0.port++ <--> Channel <--> sw2_0_2.port++;
		sw2_1_0.port++ <--> Channel <--> sw2_1_2.port++;
		sw2_2_0.port++ <--> Channel <--> sw2_2_2.port++;
}