simple Node{gates:inout gate[];}
network Lab4b2
{
    @display("bgb=3200.0, 800.0");
    types:
        channel Channel extends ned.DatarateChannel {
            datarate = 100Mbps;
        }
    submodules:
        core0: Node {@display("i=block/switch;p=200.0,50.0");}
        core1: Node {@display("i=block/switch;p=600.0,50.0");}
        core2: Node {@display("i=block/switch;p=1000.0,50.0");}
        core3: Node {@display("i=block/switch;p=1400.0,50.0");}
        core4: Node {@display("i=block/switch;p=1800.0,50.0");}
        core5: Node {@display("i=block/switch;p=2200.0,50.0");}
        core6: Node {@display("i=block/switch;p=2600.0,50.0");}
        core7: Node {@display("i=block/switch;p=3000.0,50.0");}
        agg0: Node {@display("i=block/switch,cyan;p=50.0,250.0");}
        agg1: Node {@display("i=block/switch,cyan;p=150.0,250.0");}
        agg2: Node {@display("i=block/switch,cyan;p=250.0,250.0");}
        agg3: Node {@display("i=block/switch,cyan;p=350.0,250.0");}
        agg4: Node {@display("i=block/switch,cyan;p=450.0,250.0");}
        agg5: Node {@display("i=block/switch,cyan;p=550.0,250.0");}
        agg6: Node {@display("i=block/switch,cyan;p=650.0,250.0");}
        agg7: Node {@display("i=block/switch,cyan;p=750.0,250.0");}
        agg8: Node {@display("i=block/switch,cyan;p=850.0,250.0");}
        agg9: Node {@display("i=block/switch,cyan;p=950.0,250.0");}
        agg10: Node {@display("i=block/switch,cyan;p=1050.0,250.0");}
        agg11: Node {@display("i=block/switch,cyan;p=1150.0,250.0");}
        agg12: Node {@display("i=block/switch,cyan;p=1250.0,250.0");}
        agg13: Node {@display("i=block/switch,cyan;p=1350.0,250.0");}
        agg14: Node {@display("i=block/switch,cyan;p=1450.0,250.0");}
        agg15: Node {@display("i=block/switch,cyan;p=1550.0,250.0");}
        agg16: Node {@display("i=block/switch,cyan;p=1650.0,250.0");}
        agg17: Node {@display("i=block/switch,cyan;p=1750.0,250.0");}
        agg18: Node {@display("i=block/switch,cyan;p=1850.0,250.0");}
        agg19: Node {@display("i=block/switch,cyan;p=1950.0,250.0");}
        agg20: Node {@display("i=block/switch,cyan;p=2050.0,250.0");}
        agg21: Node {@display("i=block/switch,cyan;p=2150.0,250.0");}
        agg22: Node {@display("i=block/switch,cyan;p=2250.0,250.0");}
        agg23: Node {@display("i=block/switch,cyan;p=2350.0,250.0");}
        agg24: Node {@display("i=block/switch,cyan;p=2450.0,250.0");}
        agg25: Node {@display("i=block/switch,cyan;p=2550.0,250.0");}
        agg26: Node {@display("i=block/switch,cyan;p=2650.0,250.0");}
        agg27: Node {@display("i=block/switch,cyan;p=2750.0,250.0");}
        agg28: Node {@display("i=block/switch,cyan;p=2850.0,250.0");}
        agg29: Node {@display("i=block/switch,cyan;p=2950.0,250.0");}
        agg30: Node {@display("i=block/switch,cyan;p=3050.0,250.0");}
        agg31: Node {@display("i=block/switch,cyan;p=3150.0,250.0");}
        edge0: Node {@display("i=block/switch,yellow;p=50.0,450.0");}
        edge1: Node {@display("i=block/switch,yellow;p=150.0,450.0");}
        edge2: Node {@display("i=block/switch,yellow;p=250.0,450.0");}
        edge3: Node {@display("i=block/switch,yellow;p=350.0,450.0");}
        edge4: Node {@display("i=block/switch,yellow;p=450.0,450.0");}
        edge5: Node {@display("i=block/switch,yellow;p=550.0,450.0");}
        edge6: Node {@display("i=block/switch,yellow;p=650.0,450.0");}
        edge7: Node {@display("i=block/switch,yellow;p=750.0,450.0");}
        edge8: Node {@display("i=block/switch,yellow;p=850.0,450.0");}
        edge9: Node {@display("i=block/switch,yellow;p=950.0,450.0");}
        edge10: Node {@display("i=block/switch,yellow;p=1050.0,450.0");}
        edge11: Node {@display("i=block/switch,yellow;p=1150.0,450.0");}
        edge12: Node {@display("i=block/switch,yellow;p=1250.0,450.0");}
        edge13: Node {@display("i=block/switch,yellow;p=1350.0,450.0");}
        edge14: Node {@display("i=block/switch,yellow;p=1450.0,450.0");}
        edge15: Node {@display("i=block/switch,yellow;p=1550.0,450.0");}
        edge16: Node {@display("i=block/switch,yellow;p=1650.0,450.0");}
        edge17: Node {@display("i=block/switch,yellow;p=1750.0,450.0");}
        edge18: Node {@display("i=block/switch,yellow;p=1850.0,450.0");}
        edge19: Node {@display("i=block/switch,yellow;p=1950.0,450.0");}
        edge20: Node {@display("i=block/switch,yellow;p=2050.0,450.0");}
        edge21: Node {@display("i=block/switch,yellow;p=2150.0,450.0");}
        edge22: Node {@display("i=block/switch,yellow;p=2250.0,450.0");}
        edge23: Node {@display("i=block/switch,yellow;p=2350.0,450.0");}
        edge24: Node {@display("i=block/switch,yellow;p=2450.0,450.0");}
        edge25: Node {@display("i=block/switch,yellow;p=2550.0,450.0");}
        edge26: Node {@display("i=block/switch,yellow;p=2650.0,450.0");}
        edge27: Node {@display("i=block/switch,yellow;p=2750.0,450.0");}
        edge28: Node {@display("i=block/switch,yellow;p=2850.0,450.0");}
        edge29: Node {@display("i=block/switch,yellow;p=2950.0,450.0");}
        edge30: Node {@display("i=block/switch,yellow;p=3050.0,450.0");}
        edge31: Node {@display("i=block/switch,yellow;p=3150.0,450.0");}
        pc0: Node {@display("i=device/pc;p=12.5,650.0");}
        pc1: Node {@display("i=device/pc;p=37.5,650.0");}
        pc2: Node {@display("i=device/pc;p=62.5,650.0");}
        pc3: Node {@display("i=device/pc;p=87.5,650.0");}
        pc4: Node {@display("i=device/pc;p=112.5,650.0");}
        pc5: Node {@display("i=device/pc;p=137.5,650.0");}
        pc6: Node {@display("i=device/pc;p=162.5,650.0");}
        pc7: Node {@display("i=device/pc;p=187.5,650.0");}
        pc8: Node {@display("i=device/pc;p=212.5,650.0");}
        pc9: Node {@display("i=device/pc;p=237.5,650.0");}
        pc10: Node {@display("i=device/pc;p=262.5,650.0");}
        pc11: Node {@display("i=device/pc;p=287.5,650.0");}
        pc12: Node {@display("i=device/pc;p=312.5,650.0");}
        pc13: Node {@display("i=device/pc;p=337.5,650.0");}
        pc14: Node {@display("i=device/pc;p=362.5,650.0");}
        pc15: Node {@display("i=device/pc;p=387.5,650.0");}
        pc16: Node {@display("i=device/pc;p=412.5,650.0");}
        pc17: Node {@display("i=device/pc;p=437.5,650.0");}
        pc18: Node {@display("i=device/pc;p=462.5,650.0");}
        pc19: Node {@display("i=device/pc;p=487.5,650.0");}
        pc20: Node {@display("i=device/pc;p=512.5,650.0");}
        pc21: Node {@display("i=device/pc;p=537.5,650.0");}
        pc22: Node {@display("i=device/pc;p=562.5,650.0");}
        pc23: Node {@display("i=device/pc;p=587.5,650.0");}
        pc24: Node {@display("i=device/pc;p=612.5,650.0");}
        pc25: Node {@display("i=device/pc;p=637.5,650.0");}
        pc26: Node {@display("i=device/pc;p=662.5,650.0");}
        pc27: Node {@display("i=device/pc;p=687.5,650.0");}
        pc28: Node {@display("i=device/pc;p=712.5,650.0");}
        pc29: Node {@display("i=device/pc;p=737.5,650.0");}
        pc30: Node {@display("i=device/pc;p=762.5,650.0");}
        pc31: Node {@display("i=device/pc;p=787.5,650.0");}
        pc32: Node {@display("i=device/pc;p=812.5,650.0");}
        pc33: Node {@display("i=device/pc;p=837.5,650.0");}
        pc34: Node {@display("i=device/pc;p=862.5,650.0");}
        pc35: Node {@display("i=device/pc;p=887.5,650.0");}
        pc36: Node {@display("i=device/pc;p=912.5,650.0");}
        pc37: Node {@display("i=device/pc;p=937.5,650.0");}
        pc38: Node {@display("i=device/pc;p=962.5,650.0");}
        pc39: Node {@display("i=device/pc;p=987.5,650.0");}
        pc40: Node {@display("i=device/pc;p=1012.5,650.0");}
        pc41: Node {@display("i=device/pc;p=1037.5,650.0");}
        pc42: Node {@display("i=device/pc;p=1062.5,650.0");}
        pc43: Node {@display("i=device/pc;p=1087.5,650.0");}
        pc44: Node {@display("i=device/pc;p=1112.5,650.0");}
        pc45: Node {@display("i=device/pc;p=1137.5,650.0");}
        pc46: Node {@display("i=device/pc;p=1162.5,650.0");}
        pc47: Node {@display("i=device/pc;p=1187.5,650.0");}
        pc48: Node {@display("i=device/pc;p=1212.5,650.0");}
        pc49: Node {@display("i=device/pc;p=1237.5,650.0");}
        pc50: Node {@display("i=device/pc;p=1262.5,650.0");}
        pc51: Node {@display("i=device/pc;p=1287.5,650.0");}
        pc52: Node {@display("i=device/pc;p=1312.5,650.0");}
        pc53: Node {@display("i=device/pc;p=1337.5,650.0");}
        pc54: Node {@display("i=device/pc;p=1362.5,650.0");}
        pc55: Node {@display("i=device/pc;p=1387.5,650.0");}
        pc56: Node {@display("i=device/pc;p=1412.5,650.0");}
        pc57: Node {@display("i=device/pc;p=1437.5,650.0");}
        pc58: Node {@display("i=device/pc;p=1462.5,650.0");}
        pc59: Node {@display("i=device/pc;p=1487.5,650.0");}
        pc60: Node {@display("i=device/pc;p=1512.5,650.0");}
        pc61: Node {@display("i=device/pc;p=1537.5,650.0");}
        pc62: Node {@display("i=device/pc;p=1562.5,650.0");}
        pc63: Node {@display("i=device/pc;p=1587.5,650.0");}
        pc64: Node {@display("i=device/pc;p=1612.5,650.0");}
        pc65: Node {@display("i=device/pc;p=1637.5,650.0");}
        pc66: Node {@display("i=device/pc;p=1662.5,650.0");}
        pc67: Node {@display("i=device/pc;p=1687.5,650.0");}
        pc68: Node {@display("i=device/pc;p=1712.5,650.0");}
        pc69: Node {@display("i=device/pc;p=1737.5,650.0");}
        pc70: Node {@display("i=device/pc;p=1762.5,650.0");}
        pc71: Node {@display("i=device/pc;p=1787.5,650.0");}
        pc72: Node {@display("i=device/pc;p=1812.5,650.0");}
        pc73: Node {@display("i=device/pc;p=1837.5,650.0");}
        pc74: Node {@display("i=device/pc;p=1862.5,650.0");}
        pc75: Node {@display("i=device/pc;p=1887.5,650.0");}
        pc76: Node {@display("i=device/pc;p=1912.5,650.0");}
        pc77: Node {@display("i=device/pc;p=1937.5,650.0");}
        pc78: Node {@display("i=device/pc;p=1962.5,650.0");}
        pc79: Node {@display("i=device/pc;p=1987.5,650.0");}
        pc80: Node {@display("i=device/pc;p=2012.5,650.0");}
        pc81: Node {@display("i=device/pc;p=2037.5,650.0");}
        pc82: Node {@display("i=device/pc;p=2062.5,650.0");}
        pc83: Node {@display("i=device/pc;p=2087.5,650.0");}
        pc84: Node {@display("i=device/pc;p=2112.5,650.0");}
        pc85: Node {@display("i=device/pc;p=2137.5,650.0");}
        pc86: Node {@display("i=device/pc;p=2162.5,650.0");}
        pc87: Node {@display("i=device/pc;p=2187.5,650.0");}
        pc88: Node {@display("i=device/pc;p=2212.5,650.0");}
        pc89: Node {@display("i=device/pc;p=2237.5,650.0");}
        pc90: Node {@display("i=device/pc;p=2262.5,650.0");}
        pc91: Node {@display("i=device/pc;p=2287.5,650.0");}
        pc92: Node {@display("i=device/pc;p=2312.5,650.0");}
        pc93: Node {@display("i=device/pc;p=2337.5,650.0");}
        pc94: Node {@display("i=device/pc;p=2362.5,650.0");}
        pc95: Node {@display("i=device/pc;p=2387.5,650.0");}
        pc96: Node {@display("i=device/pc;p=2412.5,650.0");}
        pc97: Node {@display("i=device/pc;p=2437.5,650.0");}
        pc98: Node {@display("i=device/pc;p=2462.5,650.0");}
        pc99: Node {@display("i=device/pc;p=2487.5,650.0");}
        pc100: Node {@display("i=device/pc;p=2512.5,650.0");}
        pc101: Node {@display("i=device/pc;p=2537.5,650.0");}
        pc102: Node {@display("i=device/pc;p=2562.5,650.0");}
        pc103: Node {@display("i=device/pc;p=2587.5,650.0");}
        pc104: Node {@display("i=device/pc;p=2612.5,650.0");}
        pc105: Node {@display("i=device/pc;p=2637.5,650.0");}
        pc106: Node {@display("i=device/pc;p=2662.5,650.0");}
        pc107: Node {@display("i=device/pc;p=2687.5,650.0");}
        pc108: Node {@display("i=device/pc;p=2712.5,650.0");}
        pc109: Node {@display("i=device/pc;p=2737.5,650.0");}
        pc110: Node {@display("i=device/pc;p=2762.5,650.0");}
        pc111: Node {@display("i=device/pc;p=2787.5,650.0");}
        pc112: Node {@display("i=device/pc;p=2812.5,650.0");}
        pc113: Node {@display("i=device/pc;p=2837.5,650.0");}
        pc114: Node {@display("i=device/pc;p=2862.5,650.0");}
        pc115: Node {@display("i=device/pc;p=2887.5,650.0");}
        pc116: Node {@display("i=device/pc;p=2912.5,650.0");}
        pc117: Node {@display("i=device/pc;p=2937.5,650.0");}
        pc118: Node {@display("i=device/pc;p=2962.5,650.0");}
        pc119: Node {@display("i=device/pc;p=2987.5,650.0");}
        pc120: Node {@display("i=device/pc;p=3012.5,650.0");}
        pc121: Node {@display("i=device/pc;p=3037.5,650.0");}
        pc122: Node {@display("i=device/pc;p=3062.5,650.0");}
        pc123: Node {@display("i=device/pc;p=3087.5,650.0");}
        pc124: Node {@display("i=device/pc;p=3112.5,650.0");}
        pc125: Node {@display("i=device/pc;p=3137.5,650.0");}
        pc126: Node {@display("i=device/pc;p=3162.5,650.0");}
        pc127: Node {@display("i=device/pc;p=3187.5,650.0");}
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
        core0.gate++ <--> Channel <--> agg18.gate++;
        core0.gate++ <--> Channel <--> agg20.gate++;
        core0.gate++ <--> Channel <--> agg22.gate++;
        core0.gate++ <--> Channel <--> agg24.gate++;
        core0.gate++ <--> Channel <--> agg26.gate++;
        core0.gate++ <--> Channel <--> agg28.gate++;
        core0.gate++ <--> Channel <--> agg30.gate++;
        core1.gate++ <--> Channel <--> agg0.gate++;
        core1.gate++ <--> Channel <--> agg2.gate++;
        core1.gate++ <--> Channel <--> agg4.gate++;
        core1.gate++ <--> Channel <--> agg6.gate++;
        core1.gate++ <--> Channel <--> agg8.gate++;
        core1.gate++ <--> Channel <--> agg10.gate++;
        core1.gate++ <--> Channel <--> agg12.gate++;
        core1.gate++ <--> Channel <--> agg14.gate++;
        core1.gate++ <--> Channel <--> agg16.gate++;
        core1.gate++ <--> Channel <--> agg18.gate++;
        core1.gate++ <--> Channel <--> agg20.gate++;
        core1.gate++ <--> Channel <--> agg22.gate++;
        core1.gate++ <--> Channel <--> agg24.gate++;
        core1.gate++ <--> Channel <--> agg26.gate++;
        core1.gate++ <--> Channel <--> agg28.gate++;
        core1.gate++ <--> Channel <--> agg30.gate++;
        core2.gate++ <--> Channel <--> agg1.gate++;
        core2.gate++ <--> Channel <--> agg3.gate++;
        core2.gate++ <--> Channel <--> agg5.gate++;
        core2.gate++ <--> Channel <--> agg7.gate++;
        core2.gate++ <--> Channel <--> agg9.gate++;
        core2.gate++ <--> Channel <--> agg11.gate++;
        core2.gate++ <--> Channel <--> agg13.gate++;
        core2.gate++ <--> Channel <--> agg15.gate++;
        core2.gate++ <--> Channel <--> agg17.gate++;
        core2.gate++ <--> Channel <--> agg19.gate++;
        core2.gate++ <--> Channel <--> agg21.gate++;
        core2.gate++ <--> Channel <--> agg23.gate++;
        core2.gate++ <--> Channel <--> agg25.gate++;
        core2.gate++ <--> Channel <--> agg27.gate++;
        core2.gate++ <--> Channel <--> agg29.gate++;
        core2.gate++ <--> Channel <--> agg31.gate++;
        core3.gate++ <--> Channel <--> agg1.gate++;
        core3.gate++ <--> Channel <--> agg3.gate++;
        core3.gate++ <--> Channel <--> agg5.gate++;
        core3.gate++ <--> Channel <--> agg7.gate++;
        core3.gate++ <--> Channel <--> agg9.gate++;
        core3.gate++ <--> Channel <--> agg11.gate++;
        core3.gate++ <--> Channel <--> agg13.gate++;
        core3.gate++ <--> Channel <--> agg15.gate++;
        core3.gate++ <--> Channel <--> agg17.gate++;
        core3.gate++ <--> Channel <--> agg19.gate++;
        core3.gate++ <--> Channel <--> agg21.gate++;
        core3.gate++ <--> Channel <--> agg23.gate++;
        core3.gate++ <--> Channel <--> agg25.gate++;
        core3.gate++ <--> Channel <--> agg27.gate++;
        core3.gate++ <--> Channel <--> agg29.gate++;
        core3.gate++ <--> Channel <--> agg31.gate++;
        core4.gate++ <--> Channel <--> agg1.gate++;
        core4.gate++ <--> Channel <--> agg3.gate++;
        core4.gate++ <--> Channel <--> agg5.gate++;
        core4.gate++ <--> Channel <--> agg7.gate++;
        core4.gate++ <--> Channel <--> agg9.gate++;
        core4.gate++ <--> Channel <--> agg11.gate++;
        core4.gate++ <--> Channel <--> agg13.gate++;
        core4.gate++ <--> Channel <--> agg15.gate++;
        core4.gate++ <--> Channel <--> agg17.gate++;
        core4.gate++ <--> Channel <--> agg19.gate++;
        core4.gate++ <--> Channel <--> agg21.gate++;
        core4.gate++ <--> Channel <--> agg23.gate++;
        core4.gate++ <--> Channel <--> agg25.gate++;
        core4.gate++ <--> Channel <--> agg27.gate++;
        core4.gate++ <--> Channel <--> agg29.gate++;
        core4.gate++ <--> Channel <--> agg31.gate++;
        core5.gate++ <--> Channel <--> agg1.gate++;
        core5.gate++ <--> Channel <--> agg3.gate++;
        core5.gate++ <--> Channel <--> agg5.gate++;
        core5.gate++ <--> Channel <--> agg7.gate++;
        core5.gate++ <--> Channel <--> agg9.gate++;
        core5.gate++ <--> Channel <--> agg11.gate++;
        core5.gate++ <--> Channel <--> agg13.gate++;
        core5.gate++ <--> Channel <--> agg15.gate++;
        core5.gate++ <--> Channel <--> agg17.gate++;
        core5.gate++ <--> Channel <--> agg19.gate++;
        core5.gate++ <--> Channel <--> agg21.gate++;
        core5.gate++ <--> Channel <--> agg23.gate++;
        core5.gate++ <--> Channel <--> agg25.gate++;
        core5.gate++ <--> Channel <--> agg27.gate++;
        core5.gate++ <--> Channel <--> agg29.gate++;
        core5.gate++ <--> Channel <--> agg31.gate++;
        core6.gate++ <--> Channel <--> agg1.gate++;
        core6.gate++ <--> Channel <--> agg3.gate++;
        core6.gate++ <--> Channel <--> agg5.gate++;
        core6.gate++ <--> Channel <--> agg7.gate++;
        core6.gate++ <--> Channel <--> agg9.gate++;
        core6.gate++ <--> Channel <--> agg11.gate++;
        core6.gate++ <--> Channel <--> agg13.gate++;
        core6.gate++ <--> Channel <--> agg15.gate++;
        core6.gate++ <--> Channel <--> agg17.gate++;
        core6.gate++ <--> Channel <--> agg19.gate++;
        core6.gate++ <--> Channel <--> agg21.gate++;
        core6.gate++ <--> Channel <--> agg23.gate++;
        core6.gate++ <--> Channel <--> agg25.gate++;
        core6.gate++ <--> Channel <--> agg27.gate++;
        core6.gate++ <--> Channel <--> agg29.gate++;
        core6.gate++ <--> Channel <--> agg31.gate++;
        core7.gate++ <--> Channel <--> agg1.gate++;
        core7.gate++ <--> Channel <--> agg3.gate++;
        core7.gate++ <--> Channel <--> agg5.gate++;
        core7.gate++ <--> Channel <--> agg7.gate++;
        core7.gate++ <--> Channel <--> agg9.gate++;
        core7.gate++ <--> Channel <--> agg11.gate++;
        core7.gate++ <--> Channel <--> agg13.gate++;
        core7.gate++ <--> Channel <--> agg15.gate++;
        core7.gate++ <--> Channel <--> agg17.gate++;
        core7.gate++ <--> Channel <--> agg19.gate++;
        core7.gate++ <--> Channel <--> agg21.gate++;
        core7.gate++ <--> Channel <--> agg23.gate++;
        core7.gate++ <--> Channel <--> agg25.gate++;
        core7.gate++ <--> Channel <--> agg27.gate++;
        core7.gate++ <--> Channel <--> agg29.gate++;
        core7.gate++ <--> Channel <--> agg31.gate++;
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
        agg8.gate++ <--> Channel <--> edge8.gate++;
        agg8.gate++ <--> Channel <--> edge9.gate++;
        agg9.gate++ <--> Channel <--> edge8.gate++;
        agg9.gate++ <--> Channel <--> edge9.gate++;
        agg10.gate++ <--> Channel <--> edge10.gate++;
        agg10.gate++ <--> Channel <--> edge11.gate++;
        agg11.gate++ <--> Channel <--> edge10.gate++;
        agg11.gate++ <--> Channel <--> edge11.gate++;
        agg12.gate++ <--> Channel <--> edge12.gate++;
        agg12.gate++ <--> Channel <--> edge13.gate++;
        agg13.gate++ <--> Channel <--> edge12.gate++;
        agg13.gate++ <--> Channel <--> edge13.gate++;
        agg14.gate++ <--> Channel <--> edge14.gate++;
        agg14.gate++ <--> Channel <--> edge15.gate++;
        agg15.gate++ <--> Channel <--> edge14.gate++;
        agg15.gate++ <--> Channel <--> edge15.gate++;
        agg16.gate++ <--> Channel <--> edge16.gate++;
        agg16.gate++ <--> Channel <--> edge17.gate++;
        agg17.gate++ <--> Channel <--> edge16.gate++;
        agg17.gate++ <--> Channel <--> edge17.gate++;
        agg18.gate++ <--> Channel <--> edge18.gate++;
        agg18.gate++ <--> Channel <--> edge19.gate++;
        agg19.gate++ <--> Channel <--> edge18.gate++;
        agg19.gate++ <--> Channel <--> edge19.gate++;
        agg20.gate++ <--> Channel <--> edge20.gate++;
        agg20.gate++ <--> Channel <--> edge21.gate++;
        agg21.gate++ <--> Channel <--> edge20.gate++;
        agg21.gate++ <--> Channel <--> edge21.gate++;
        agg22.gate++ <--> Channel <--> edge22.gate++;
        agg22.gate++ <--> Channel <--> edge23.gate++;
        agg23.gate++ <--> Channel <--> edge22.gate++;
        agg23.gate++ <--> Channel <--> edge23.gate++;
        agg24.gate++ <--> Channel <--> edge24.gate++;
        agg24.gate++ <--> Channel <--> edge25.gate++;
        agg25.gate++ <--> Channel <--> edge24.gate++;
        agg25.gate++ <--> Channel <--> edge25.gate++;
        agg26.gate++ <--> Channel <--> edge26.gate++;
        agg26.gate++ <--> Channel <--> edge27.gate++;
        agg27.gate++ <--> Channel <--> edge26.gate++;
        agg27.gate++ <--> Channel <--> edge27.gate++;
        agg28.gate++ <--> Channel <--> edge28.gate++;
        agg28.gate++ <--> Channel <--> edge29.gate++;
        agg29.gate++ <--> Channel <--> edge28.gate++;
        agg29.gate++ <--> Channel <--> edge29.gate++;
        agg30.gate++ <--> Channel <--> edge30.gate++;
        agg30.gate++ <--> Channel <--> edge31.gate++;
        agg31.gate++ <--> Channel <--> edge30.gate++;
        agg31.gate++ <--> Channel <--> edge31.gate++;
        edge0.gate++ <--> Channel <--> pc0.gate++;
        edge0.gate++ <--> Channel <--> pc1.gate++;
        edge0.gate++ <--> Channel <--> pc2.gate++;
        edge0.gate++ <--> Channel <--> pc3.gate++;
        edge1.gate++ <--> Channel <--> pc4.gate++;
        edge1.gate++ <--> Channel <--> pc5.gate++;
        edge1.gate++ <--> Channel <--> pc6.gate++;
        edge1.gate++ <--> Channel <--> pc7.gate++;
        edge2.gate++ <--> Channel <--> pc8.gate++;
        edge2.gate++ <--> Channel <--> pc9.gate++;
        edge2.gate++ <--> Channel <--> pc10.gate++;
        edge2.gate++ <--> Channel <--> pc11.gate++;
        edge3.gate++ <--> Channel <--> pc12.gate++;
        edge3.gate++ <--> Channel <--> pc13.gate++;
        edge3.gate++ <--> Channel <--> pc14.gate++;
        edge3.gate++ <--> Channel <--> pc15.gate++;
        edge4.gate++ <--> Channel <--> pc16.gate++;
        edge4.gate++ <--> Channel <--> pc17.gate++;
        edge4.gate++ <--> Channel <--> pc18.gate++;
        edge4.gate++ <--> Channel <--> pc19.gate++;
        edge5.gate++ <--> Channel <--> pc20.gate++;
        edge5.gate++ <--> Channel <--> pc21.gate++;
        edge5.gate++ <--> Channel <--> pc22.gate++;
        edge5.gate++ <--> Channel <--> pc23.gate++;
        edge6.gate++ <--> Channel <--> pc24.gate++;
        edge6.gate++ <--> Channel <--> pc25.gate++;
        edge6.gate++ <--> Channel <--> pc26.gate++;
        edge6.gate++ <--> Channel <--> pc27.gate++;
        edge7.gate++ <--> Channel <--> pc28.gate++;
        edge7.gate++ <--> Channel <--> pc29.gate++;
        edge7.gate++ <--> Channel <--> pc30.gate++;
        edge7.gate++ <--> Channel <--> pc31.gate++;
        edge8.gate++ <--> Channel <--> pc32.gate++;
        edge8.gate++ <--> Channel <--> pc33.gate++;
        edge8.gate++ <--> Channel <--> pc34.gate++;
        edge8.gate++ <--> Channel <--> pc35.gate++;
        edge9.gate++ <--> Channel <--> pc36.gate++;
        edge9.gate++ <--> Channel <--> pc37.gate++;
        edge9.gate++ <--> Channel <--> pc38.gate++;
        edge9.gate++ <--> Channel <--> pc39.gate++;
        edge10.gate++ <--> Channel <--> pc40.gate++;
        edge10.gate++ <--> Channel <--> pc41.gate++;
        edge10.gate++ <--> Channel <--> pc42.gate++;
        edge10.gate++ <--> Channel <--> pc43.gate++;
        edge11.gate++ <--> Channel <--> pc44.gate++;
        edge11.gate++ <--> Channel <--> pc45.gate++;
        edge11.gate++ <--> Channel <--> pc46.gate++;
        edge11.gate++ <--> Channel <--> pc47.gate++;
        edge12.gate++ <--> Channel <--> pc48.gate++;
        edge12.gate++ <--> Channel <--> pc49.gate++;
        edge12.gate++ <--> Channel <--> pc50.gate++;
        edge12.gate++ <--> Channel <--> pc51.gate++;
        edge13.gate++ <--> Channel <--> pc52.gate++;
        edge13.gate++ <--> Channel <--> pc53.gate++;
        edge13.gate++ <--> Channel <--> pc54.gate++;
        edge13.gate++ <--> Channel <--> pc55.gate++;
        edge14.gate++ <--> Channel <--> pc56.gate++;
        edge14.gate++ <--> Channel <--> pc57.gate++;
        edge14.gate++ <--> Channel <--> pc58.gate++;
        edge14.gate++ <--> Channel <--> pc59.gate++;
        edge15.gate++ <--> Channel <--> pc60.gate++;
        edge15.gate++ <--> Channel <--> pc61.gate++;
        edge15.gate++ <--> Channel <--> pc62.gate++;
        edge15.gate++ <--> Channel <--> pc63.gate++;
        edge16.gate++ <--> Channel <--> pc64.gate++;
        edge16.gate++ <--> Channel <--> pc65.gate++;
        edge16.gate++ <--> Channel <--> pc66.gate++;
        edge16.gate++ <--> Channel <--> pc67.gate++;
        edge17.gate++ <--> Channel <--> pc68.gate++;
        edge17.gate++ <--> Channel <--> pc69.gate++;
        edge17.gate++ <--> Channel <--> pc70.gate++;
        edge17.gate++ <--> Channel <--> pc71.gate++;
        edge18.gate++ <--> Channel <--> pc72.gate++;
        edge18.gate++ <--> Channel <--> pc73.gate++;
        edge18.gate++ <--> Channel <--> pc74.gate++;
        edge18.gate++ <--> Channel <--> pc75.gate++;
        edge19.gate++ <--> Channel <--> pc76.gate++;
        edge19.gate++ <--> Channel <--> pc77.gate++;
        edge19.gate++ <--> Channel <--> pc78.gate++;
        edge19.gate++ <--> Channel <--> pc79.gate++;
        edge20.gate++ <--> Channel <--> pc80.gate++;
        edge20.gate++ <--> Channel <--> pc81.gate++;
        edge20.gate++ <--> Channel <--> pc82.gate++;
        edge20.gate++ <--> Channel <--> pc83.gate++;
        edge21.gate++ <--> Channel <--> pc84.gate++;
        edge21.gate++ <--> Channel <--> pc85.gate++;
        edge21.gate++ <--> Channel <--> pc86.gate++;
        edge21.gate++ <--> Channel <--> pc87.gate++;
        edge22.gate++ <--> Channel <--> pc88.gate++;
        edge22.gate++ <--> Channel <--> pc89.gate++;
        edge22.gate++ <--> Channel <--> pc90.gate++;
        edge22.gate++ <--> Channel <--> pc91.gate++;
        edge23.gate++ <--> Channel <--> pc92.gate++;
        edge23.gate++ <--> Channel <--> pc93.gate++;
        edge23.gate++ <--> Channel <--> pc94.gate++;
        edge23.gate++ <--> Channel <--> pc95.gate++;
        edge24.gate++ <--> Channel <--> pc96.gate++;
        edge24.gate++ <--> Channel <--> pc97.gate++;
        edge24.gate++ <--> Channel <--> pc98.gate++;
        edge24.gate++ <--> Channel <--> pc99.gate++;
        edge25.gate++ <--> Channel <--> pc100.gate++;
        edge25.gate++ <--> Channel <--> pc101.gate++;
        edge25.gate++ <--> Channel <--> pc102.gate++;
        edge25.gate++ <--> Channel <--> pc103.gate++;
        edge26.gate++ <--> Channel <--> pc104.gate++;
        edge26.gate++ <--> Channel <--> pc105.gate++;
        edge26.gate++ <--> Channel <--> pc106.gate++;
        edge26.gate++ <--> Channel <--> pc107.gate++;
        edge27.gate++ <--> Channel <--> pc108.gate++;
        edge27.gate++ <--> Channel <--> pc109.gate++;
        edge27.gate++ <--> Channel <--> pc110.gate++;
        edge27.gate++ <--> Channel <--> pc111.gate++;
        edge28.gate++ <--> Channel <--> pc112.gate++;
        edge28.gate++ <--> Channel <--> pc113.gate++;
        edge28.gate++ <--> Channel <--> pc114.gate++;
        edge28.gate++ <--> Channel <--> pc115.gate++;
        edge29.gate++ <--> Channel <--> pc116.gate++;
        edge29.gate++ <--> Channel <--> pc117.gate++;
        edge29.gate++ <--> Channel <--> pc118.gate++;
        edge29.gate++ <--> Channel <--> pc119.gate++;
        edge30.gate++ <--> Channel <--> pc120.gate++;
        edge30.gate++ <--> Channel <--> pc121.gate++;
        edge30.gate++ <--> Channel <--> pc122.gate++;
        edge30.gate++ <--> Channel <--> pc123.gate++;
        edge31.gate++ <--> Channel <--> pc124.gate++;
        edge31.gate++ <--> Channel <--> pc125.gate++;
        edge31.gate++ <--> Channel <--> pc126.gate++;
        edge31.gate++ <--> Channel <--> pc127.gate++;
}