simple Node{gates:inout gate[];}
network Lab4b2
{
    @display("bgb=800.0, 800.0");
    types:
        channel Channel extends ned.DatarateChannel {
            datarate = 100Mbps;
        }
    submodules:
        core0: Node {@display("i=block/switch;p=100.0,50.0");}
        core1: Node {@display("i=block/switch;p=300.0,50.0");}
        core2: Node {@display("i=block/switch;p=500.0,50.0");}
        core3: Node {@display("i=block/switch;p=700.0,50.0");}
        agg0: Node {@display("i=block/switch,cyan;p=50.0,250.0");}
        agg1: Node {@display("i=block/switch,cyan;p=150.0,250.0");}
        agg2: Node {@display("i=block/switch,cyan;p=250.0,250.0");}
        agg3: Node {@display("i=block/switch,cyan;p=350.0,250.0");}
        agg4: Node {@display("i=block/switch,cyan;p=450.0,250.0");}
        agg5: Node {@display("i=block/switch,cyan;p=550.0,250.0");}
        agg6: Node {@display("i=block/switch,cyan;p=650.0,250.0");}
        agg7: Node {@display("i=block/switch,cyan;p=750.0,250.0");}
        edge0: Node {@display("i=block/switch,yellow;p=50.0,450.0");}
        edge1: Node {@display("i=block/switch,yellow;p=150.0,450.0");}
        edge2: Node {@display("i=block/switch,yellow;p=250.0,450.0");}
        edge3: Node {@display("i=block/switch,yellow;p=350.0,450.0");}
        edge4: Node {@display("i=block/switch,yellow;p=450.0,450.0");}
        edge5: Node {@display("i=block/switch,yellow;p=550.0,450.0");}
        edge6: Node {@display("i=block/switch,yellow;p=650.0,450.0");}
        edge7: Node {@display("i=block/switch,yellow;p=750.0,450.0");}
        pc0: Node {@display("i=device/pc;p=25.0,650.0");}
        pc1: Node {@display("i=device/pc;p=75.0,650.0");}
        pc2: Node {@display("i=device/pc;p=125.0,650.0");}
        pc3: Node {@display("i=device/pc;p=175.0,650.0");}
        pc4: Node {@display("i=device/pc;p=225.0,650.0");}
        pc5: Node {@display("i=device/pc;p=275.0,650.0");}
        pc6: Node {@display("i=device/pc;p=325.0,650.0");}
        pc7: Node {@display("i=device/pc;p=375.0,650.0");}
        pc8: Node {@display("i=device/pc;p=425.0,650.0");}
        pc9: Node {@display("i=device/pc;p=475.0,650.0");}
        pc10: Node {@display("i=device/pc;p=525.0,650.0");}
        pc11: Node {@display("i=device/pc;p=575.0,650.0");}
        pc12: Node {@display("i=device/pc;p=625.0,650.0");}
        pc13: Node {@display("i=device/pc;p=675.0,650.0");}
        pc14: Node {@display("i=device/pc;p=725.0,650.0");}
        pc15: Node {@display("i=device/pc;p=775.0,650.0");}
    connections:
        core0.gate++ <--> Channel <--> agg0.gate++;
        core0.gate++ <--> Channel <--> agg2.gate++;
        core0.gate++ <--> Channel <--> agg4.gate++;
        core0.gate++ <--> Channel <--> agg6.gate++;
        core1.gate++ <--> Channel <--> agg0.gate++;
        core1.gate++ <--> Channel <--> agg2.gate++;
        core1.gate++ <--> Channel <--> agg4.gate++;
        core1.gate++ <--> Channel <--> agg6.gate++;
        core2.gate++ <--> Channel <--> agg1.gate++;
        core2.gate++ <--> Channel <--> agg3.gate++;
        core2.gate++ <--> Channel <--> agg5.gate++;
        core2.gate++ <--> Channel <--> agg7.gate++;
        core3.gate++ <--> Channel <--> agg1.gate++;
        core3.gate++ <--> Channel <--> agg3.gate++;
        core3.gate++ <--> Channel <--> agg5.gate++;
        core3.gate++ <--> Channel <--> agg7.gate++;
        agg0.gate++ <--> Channel <--> edge0.gate++;
        agg0.gate++ <--> Channel <--> edge1.gate++;
        agg1.gate++ <--> Channel <--> edge0.gate++;
        agg1.gate++ <--> Channel <--> edge1.gate++;
        agg2.gate++ <--> Channel <--> edge2.gate++;
        agg2.gate++ <--> Channel <--> edge3.gate++;
        agg3.gate++ <--> Channel <--> edge2.gate++;
        agg3.gate++ <--> Channel <--> edge3.gate++;
        agg4.gate++ <--> Channel <--> edge4.gate++;
        agg4.gate++ <--> Channel <--> edge5.gate++;
        agg5.gate++ <--> Channel <--> edge4.gate++;
        agg5.gate++ <--> Channel <--> edge5.gate++;
        agg6.gate++ <--> Channel <--> edge6.gate++;
        agg6.gate++ <--> Channel <--> edge7.gate++;
        agg7.gate++ <--> Channel <--> edge6.gate++;
        agg7.gate++ <--> Channel <--> edge7.gate++;
        edge0.gate++ <--> Channel <--> pc0.gate++;
        edge0.gate++ <--> Channel <--> pc1.gate++;
        edge1.gate++ <--> Channel <--> pc2.gate++;
        edge1.gate++ <--> Channel <--> pc3.gate++;
        edge2.gate++ <--> Channel <--> pc4.gate++;
        edge2.gate++ <--> Channel <--> pc5.gate++;
        edge3.gate++ <--> Channel <--> pc6.gate++;
        edge3.gate++ <--> Channel <--> pc7.gate++;
        edge4.gate++ <--> Channel <--> pc8.gate++;
        edge4.gate++ <--> Channel <--> pc9.gate++;
        edge5.gate++ <--> Channel <--> pc10.gate++;
        edge5.gate++ <--> Channel <--> pc11.gate++;
        edge6.gate++ <--> Channel <--> pc12.gate++;
        edge6.gate++ <--> Channel <--> pc13.gate++;
        edge7.gate++ <--> Channel <--> pc14.gate++;
        edge7.gate++ <--> Channel <--> pc15.gate++;
}