simple Node{gates:inout gate[];}
network Lab4b2
{
    @display("bgb=2160.0, 800.0");
    types:
        channel Channel extends ned.DatarateChannel {
            datarate = 100Mbps;
        }
    submodules:
        core0: Node {@display("i=block/switch;p=180.0,50.0");}
        core1: Node {@display("i=block/switch;p=540.0,50.0");}
        core2: Node {@display("i=block/switch;p=900.0,50.0");}
        core3: Node {@display("i=block/switch;p=1260.0,50.0");}
        core4: Node {@display("i=block/switch;p=1620.0,50.0");}
        core5: Node {@display("i=block/switch;p=1980.0,50.0");}
        agg0: Node {@display("i=block/switch,cyan;p=60.0,250.0");}
        agg1: Node {@display("i=block/switch,cyan;p=180.0,250.0");}
        agg2: Node {@display("i=block/switch,cyan;p=300.0,250.0");}
        agg3: Node {@display("i=block/switch,cyan;p=420.0,250.0");}
        agg4: Node {@display("i=block/switch,cyan;p=540.0,250.0");}
        agg5: Node {@display("i=block/switch,cyan;p=660.0,250.0");}
        agg6: Node {@display("i=block/switch,cyan;p=780.0,250.0");}
        agg7: Node {@display("i=block/switch,cyan;p=900.0,250.0");}
        agg8: Node {@display("i=block/switch,cyan;p=1020.0,250.0");}
        agg9: Node {@display("i=block/switch,cyan;p=1140.0,250.0");}
        agg10: Node {@display("i=block/switch,cyan;p=1260.0,250.0");}
        agg11: Node {@display("i=block/switch,cyan;p=1380.0,250.0");}
        agg12: Node {@display("i=block/switch,cyan;p=1500.0,250.0");}
        agg13: Node {@display("i=block/switch,cyan;p=1620.0,250.0");}
        agg14: Node {@display("i=block/switch,cyan;p=1740.0,250.0");}
        agg15: Node {@display("i=block/switch,cyan;p=1860.0,250.0");}
        agg16: Node {@display("i=block/switch,cyan;p=1980.0,250.0");}
        agg17: Node {@display("i=block/switch,cyan;p=2100.0,250.0");}
        edge0: Node {@display("i=block/switch,yellow;p=60.0,450.0");}
        edge1: Node {@display("i=block/switch,yellow;p=180.0,450.0");}
        edge2: Node {@display("i=block/switch,yellow;p=300.0,450.0");}
        edge3: Node {@display("i=block/switch,yellow;p=420.0,450.0");}
        edge4: Node {@display("i=block/switch,yellow;p=540.0,450.0");}
        edge5: Node {@display("i=block/switch,yellow;p=660.0,450.0");}
        edge6: Node {@display("i=block/switch,yellow;p=780.0,450.0");}
        edge7: Node {@display("i=block/switch,yellow;p=900.0,450.0");}
        edge8: Node {@display("i=block/switch,yellow;p=1020.0,450.0");}
        edge9: Node {@display("i=block/switch,yellow;p=1140.0,450.0");}
        edge10: Node {@display("i=block/switch,yellow;p=1260.0,450.0");}
        edge11: Node {@display("i=block/switch,yellow;p=1380.0,450.0");}
        edge12: Node {@display("i=block/switch,yellow;p=1500.0,450.0");}
        edge13: Node {@display("i=block/switch,yellow;p=1620.0,450.0");}
        edge14: Node {@display("i=block/switch,yellow;p=1740.0,450.0");}
        edge15: Node {@display("i=block/switch,yellow;p=1860.0,450.0");}
        edge16: Node {@display("i=block/switch,yellow;p=1980.0,450.0");}
        edge17: Node {@display("i=block/switch,yellow;p=2100.0,450.0");}
        pc0: Node {@display("i=device/pc;p=20.0,650.0");}
        pc1: Node {@display("i=device/pc;p=60.0,650.0");}
        pc2: Node {@display("i=device/pc;p=100.0,650.0");}
        pc3: Node {@display("i=device/pc;p=140.0,650.0");}
        pc4: Node {@display("i=device/pc;p=180.0,650.0");}
        pc5: Node {@display("i=device/pc;p=220.0,650.0");}
        pc6: Node {@display("i=device/pc;p=260.0,650.0");}
        pc7: Node {@display("i=device/pc;p=300.0,650.0");}
        pc8: Node {@display("i=device/pc;p=340.0,650.0");}
        pc9: Node {@display("i=device/pc;p=380.0,650.0");}
        pc10: Node {@display("i=device/pc;p=420.0,650.0");}
        pc11: Node {@display("i=device/pc;p=460.0,650.0");}
        pc12: Node {@display("i=device/pc;p=500.0,650.0");}
        pc13: Node {@display("i=device/pc;p=540.0,650.0");}
        pc14: Node {@display("i=device/pc;p=580.0,650.0");}
        pc15: Node {@display("i=device/pc;p=620.0,650.0");}
        pc16: Node {@display("i=device/pc;p=660.0,650.0");}
        pc17: Node {@display("i=device/pc;p=700.0,650.0");}
        pc18: Node {@display("i=device/pc;p=740.0,650.0");}
        pc19: Node {@display("i=device/pc;p=780.0,650.0");}
        pc20: Node {@display("i=device/pc;p=820.0,650.0");}
        pc21: Node {@display("i=device/pc;p=860.0,650.0");}
        pc22: Node {@display("i=device/pc;p=900.0,650.0");}
        pc23: Node {@display("i=device/pc;p=940.0,650.0");}
        pc24: Node {@display("i=device/pc;p=980.0,650.0");}
        pc25: Node {@display("i=device/pc;p=1020.0,650.0");}
        pc26: Node {@display("i=device/pc;p=1060.0,650.0");}
        pc27: Node {@display("i=device/pc;p=1100.0,650.0");}
        pc28: Node {@display("i=device/pc;p=1140.0,650.0");}
        pc29: Node {@display("i=device/pc;p=1180.0,650.0");}
        pc30: Node {@display("i=device/pc;p=1220.0,650.0");}
        pc31: Node {@display("i=device/pc;p=1260.0,650.0");}
        pc32: Node {@display("i=device/pc;p=1300.0,650.0");}
        pc33: Node {@display("i=device/pc;p=1340.0,650.0");}
        pc34: Node {@display("i=device/pc;p=1380.0,650.0");}
        pc35: Node {@display("i=device/pc;p=1420.0,650.0");}
        pc36: Node {@display("i=device/pc;p=1460.0,650.0");}
        pc37: Node {@display("i=device/pc;p=1500.0,650.0");}
        pc38: Node {@display("i=device/pc;p=1540.0,650.0");}
        pc39: Node {@display("i=device/pc;p=1580.0,650.0");}
        pc40: Node {@display("i=device/pc;p=1620.0,650.0");}
        pc41: Node {@display("i=device/pc;p=1660.0,650.0");}
        pc42: Node {@display("i=device/pc;p=1700.0,650.0");}
        pc43: Node {@display("i=device/pc;p=1740.0,650.0");}
        pc44: Node {@display("i=device/pc;p=1780.0,650.0");}
        pc45: Node {@display("i=device/pc;p=1820.0,650.0");}
        pc46: Node {@display("i=device/pc;p=1860.0,650.0");}
        pc47: Node {@display("i=device/pc;p=1900.0,650.0");}
        pc48: Node {@display("i=device/pc;p=1940.0,650.0");}
        pc49: Node {@display("i=device/pc;p=1980.0,650.0");}
        pc50: Node {@display("i=device/pc;p=2020.0,650.0");}
        pc51: Node {@display("i=device/pc;p=2060.0,650.0");}
        pc52: Node {@display("i=device/pc;p=2100.0,650.0");}
        pc53: Node {@display("i=device/pc;p=2140.0,650.0");}
    connections:
        core0.gate++ <--> Channel <--> agg0.gate++;
        core0.gate++ <--> Channel <--> agg2.gate++;
        core0.gate++ <--> Channel <--> agg4.gate++;
        core0.gate++ <--> Channel <--> agg6.gate++;
        core0.gate++ <--> Channel <--> agg8.gate++;
        core0.gate++ <--> Channel <--> agg10.gate++;
        core0.gate++ <--> Channel <--> agg12.gate++;
        core0.gate++ <--> Channel <--> agg14.gate++;
        core0.gate++ <--> Channel <--> agg16.gate++;
        core1.gate++ <--> Channel <--> agg0.gate++;
        core1.gate++ <--> Channel <--> agg2.gate++;
        core1.gate++ <--> Channel <--> agg4.gate++;
        core1.gate++ <--> Channel <--> agg6.gate++;
        core1.gate++ <--> Channel <--> agg8.gate++;
        core1.gate++ <--> Channel <--> agg10.gate++;
        core1.gate++ <--> Channel <--> agg12.gate++;
        core1.gate++ <--> Channel <--> agg14.gate++;
        core1.gate++ <--> Channel <--> agg16.gate++;
        core2.gate++ <--> Channel <--> agg1.gate++;
        core2.gate++ <--> Channel <--> agg3.gate++;
        core2.gate++ <--> Channel <--> agg5.gate++;
        core2.gate++ <--> Channel <--> agg7.gate++;
        core2.gate++ <--> Channel <--> agg9.gate++;
        core2.gate++ <--> Channel <--> agg11.gate++;
        core2.gate++ <--> Channel <--> agg13.gate++;
        core2.gate++ <--> Channel <--> agg15.gate++;
        core2.gate++ <--> Channel <--> agg17.gate++;
        core3.gate++ <--> Channel <--> agg1.gate++;
        core3.gate++ <--> Channel <--> agg3.gate++;
        core3.gate++ <--> Channel <--> agg5.gate++;
        core3.gate++ <--> Channel <--> agg7.gate++;
        core3.gate++ <--> Channel <--> agg9.gate++;
        core3.gate++ <--> Channel <--> agg11.gate++;
        core3.gate++ <--> Channel <--> agg13.gate++;
        core3.gate++ <--> Channel <--> agg15.gate++;
        core3.gate++ <--> Channel <--> agg17.gate++;
        core4.gate++ <--> Channel <--> agg1.gate++;
        core4.gate++ <--> Channel <--> agg3.gate++;
        core4.gate++ <--> Channel <--> agg5.gate++;
        core4.gate++ <--> Channel <--> agg7.gate++;
        core4.gate++ <--> Channel <--> agg9.gate++;
        core4.gate++ <--> Channel <--> agg11.gate++;
        core4.gate++ <--> Channel <--> agg13.gate++;
        core4.gate++ <--> Channel <--> agg15.gate++;
        core4.gate++ <--> Channel <--> agg17.gate++;
        core5.gate++ <--> Channel <--> agg1.gate++;
        core5.gate++ <--> Channel <--> agg3.gate++;
        core5.gate++ <--> Channel <--> agg5.gate++;
        core5.gate++ <--> Channel <--> agg7.gate++;
        core5.gate++ <--> Channel <--> agg9.gate++;
        core5.gate++ <--> Channel <--> agg11.gate++;
        core5.gate++ <--> Channel <--> agg13.gate++;
        core5.gate++ <--> Channel <--> agg15.gate++;
        core5.gate++ <--> Channel <--> agg17.gate++;
        agg0.gate++ <--> Channel <--> edge0.gate++;
        agg0.gate++ <--> Channel <--> edge1.gate++;
        agg0.gate++ <--> Channel <--> edge2.gate++;
        agg1.gate++ <--> Channel <--> edge0.gate++;
        agg1.gate++ <--> Channel <--> edge1.gate++;
        agg1.gate++ <--> Channel <--> edge2.gate++;
        agg2.gate++ <--> Channel <--> edge0.gate++;
        agg2.gate++ <--> Channel <--> edge1.gate++;
        agg2.gate++ <--> Channel <--> edge2.gate++;
        agg3.gate++ <--> Channel <--> edge3.gate++;
        agg3.gate++ <--> Channel <--> edge4.gate++;
        agg3.gate++ <--> Channel <--> edge5.gate++;
        agg4.gate++ <--> Channel <--> edge3.gate++;
        agg4.gate++ <--> Channel <--> edge4.gate++;
        agg4.gate++ <--> Channel <--> edge5.gate++;
        agg5.gate++ <--> Channel <--> edge3.gate++;
        agg5.gate++ <--> Channel <--> edge4.gate++;
        agg5.gate++ <--> Channel <--> edge5.gate++;
        agg6.gate++ <--> Channel <--> edge6.gate++;
        agg6.gate++ <--> Channel <--> edge7.gate++;
        agg6.gate++ <--> Channel <--> edge8.gate++;
        agg7.gate++ <--> Channel <--> edge6.gate++;
        agg7.gate++ <--> Channel <--> edge7.gate++;
        agg7.gate++ <--> Channel <--> edge8.gate++;
        agg8.gate++ <--> Channel <--> edge6.gate++;
        agg8.gate++ <--> Channel <--> edge7.gate++;
        agg8.gate++ <--> Channel <--> edge8.gate++;
        agg9.gate++ <--> Channel <--> edge9.gate++;
        agg9.gate++ <--> Channel <--> edge10.gate++;
        agg9.gate++ <--> Channel <--> edge11.gate++;
        agg10.gate++ <--> Channel <--> edge9.gate++;
        agg10.gate++ <--> Channel <--> edge10.gate++;
        agg10.gate++ <--> Channel <--> edge11.gate++;
        agg11.gate++ <--> Channel <--> edge9.gate++;
        agg11.gate++ <--> Channel <--> edge10.gate++;
        agg11.gate++ <--> Channel <--> edge11.gate++;
        agg12.gate++ <--> Channel <--> edge12.gate++;
        agg12.gate++ <--> Channel <--> edge13.gate++;
        agg12.gate++ <--> Channel <--> edge14.gate++;
        agg13.gate++ <--> Channel <--> edge12.gate++;
        agg13.gate++ <--> Channel <--> edge13.gate++;
        agg13.gate++ <--> Channel <--> edge14.gate++;
        agg14.gate++ <--> Channel <--> edge12.gate++;
        agg14.gate++ <--> Channel <--> edge13.gate++;
        agg14.gate++ <--> Channel <--> edge14.gate++;
        agg15.gate++ <--> Channel <--> edge15.gate++;
        agg15.gate++ <--> Channel <--> edge16.gate++;
        agg15.gate++ <--> Channel <--> edge17.gate++;
        agg16.gate++ <--> Channel <--> edge15.gate++;
        agg16.gate++ <--> Channel <--> edge16.gate++;
        agg16.gate++ <--> Channel <--> edge17.gate++;
        agg17.gate++ <--> Channel <--> edge15.gate++;
        agg17.gate++ <--> Channel <--> edge16.gate++;
        agg17.gate++ <--> Channel <--> edge17.gate++;
        edge0.gate++ <--> Channel <--> pc0.gate++;
        edge0.gate++ <--> Channel <--> pc1.gate++;
        edge0.gate++ <--> Channel <--> pc2.gate++;
        edge1.gate++ <--> Channel <--> pc3.gate++;
        edge1.gate++ <--> Channel <--> pc4.gate++;
        edge1.gate++ <--> Channel <--> pc5.gate++;
        edge2.gate++ <--> Channel <--> pc6.gate++;
        edge2.gate++ <--> Channel <--> pc7.gate++;
        edge2.gate++ <--> Channel <--> pc8.gate++;
        edge3.gate++ <--> Channel <--> pc9.gate++;
        edge3.gate++ <--> Channel <--> pc10.gate++;
        edge3.gate++ <--> Channel <--> pc11.gate++;
        edge4.gate++ <--> Channel <--> pc12.gate++;
        edge4.gate++ <--> Channel <--> pc13.gate++;
        edge4.gate++ <--> Channel <--> pc14.gate++;
        edge5.gate++ <--> Channel <--> pc15.gate++;
        edge5.gate++ <--> Channel <--> pc16.gate++;
        edge5.gate++ <--> Channel <--> pc17.gate++;
        edge6.gate++ <--> Channel <--> pc18.gate++;
        edge6.gate++ <--> Channel <--> pc19.gate++;
        edge6.gate++ <--> Channel <--> pc20.gate++;
        edge7.gate++ <--> Channel <--> pc21.gate++;
        edge7.gate++ <--> Channel <--> pc22.gate++;
        edge7.gate++ <--> Channel <--> pc23.gate++;
        edge8.gate++ <--> Channel <--> pc24.gate++;
        edge8.gate++ <--> Channel <--> pc25.gate++;
        edge8.gate++ <--> Channel <--> pc26.gate++;
        edge9.gate++ <--> Channel <--> pc27.gate++;
        edge9.gate++ <--> Channel <--> pc28.gate++;
        edge9.gate++ <--> Channel <--> pc29.gate++;
        edge10.gate++ <--> Channel <--> pc30.gate++;
        edge10.gate++ <--> Channel <--> pc31.gate++;
        edge10.gate++ <--> Channel <--> pc32.gate++;
        edge11.gate++ <--> Channel <--> pc33.gate++;
        edge11.gate++ <--> Channel <--> pc34.gate++;
        edge11.gate++ <--> Channel <--> pc35.gate++;
        edge12.gate++ <--> Channel <--> pc36.gate++;
        edge12.gate++ <--> Channel <--> pc37.gate++;
        edge12.gate++ <--> Channel <--> pc38.gate++;
        edge13.gate++ <--> Channel <--> pc39.gate++;
        edge13.gate++ <--> Channel <--> pc40.gate++;
        edge13.gate++ <--> Channel <--> pc41.gate++;
        edge14.gate++ <--> Channel <--> pc42.gate++;
        edge14.gate++ <--> Channel <--> pc43.gate++;
        edge14.gate++ <--> Channel <--> pc44.gate++;
        edge15.gate++ <--> Channel <--> pc45.gate++;
        edge15.gate++ <--> Channel <--> pc46.gate++;
        edge15.gate++ <--> Channel <--> pc47.gate++;
        edge16.gate++ <--> Channel <--> pc48.gate++;
        edge16.gate++ <--> Channel <--> pc49.gate++;
        edge16.gate++ <--> Channel <--> pc50.gate++;
        edge17.gate++ <--> Channel <--> pc51.gate++;
        edge17.gate++ <--> Channel <--> pc52.gate++;
        edge17.gate++ <--> Channel <--> pc53.gate++;
}