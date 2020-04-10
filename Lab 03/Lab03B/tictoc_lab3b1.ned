simple Txc_l3b1
{
    parameters:
        @display("i=block/routing");
    gates:
        inout gate[];
}

network Tictoc_lab3b1
{
    @display("bgb=344,335");
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 100ms;
        }
    submodules:
        txc_l3b1: Txc_l3b1 {
            @display("p=43,43");
        }
        txc_l3b2: Txc_l3b1 {
            @display("p=43,118");
        }
        txc_l3b3: Txc_l3b1 {
            @display("p=43,195");
        }
        txc_l3b4: Txc_l3b1 {
            @display("p=43,270");
        }
        txc_l3b5: Txc_l3b1 {
            @display("p=130,157");
        }
        txc_l3b6: Txc_l3b1 {
            @display("p=212,157");
        }
        txc_l3b7: Txc_l3b1 {
            @display("p=287,43");
        }
        txc_l3b8: Txc_l3b1 {
            @display("p=287,118");
        }
        txc_l3b9: Txc_l3b1 {
            @display("p=287,195");
        }
        txc_l3b10: Txc_l3b1 {
            @display("p=287,270");
        }
    connections:
        txc_l3b1.gate++ <--> txc_l3b2.gate++;
        txc_l3b2.gate++ <--> txc_l3b3.gate++;
        txc_l3b3.gate++ <--> txc_l3b4.gate++;
        txc_l3b3.gate++ <--> txc_l3b5.gate++;
        txc_l3b2.gate++ <--> txc_l3b5.gate++;
        txc_l3b5.gate++ <--> txc_l3b6.gate++;
        txc_l3b7.gate++ <--> txc_l3b8.gate++;
        txc_l3b8.gate++ <--> txc_l3b9.gate++;
        txc_l3b9.gate++ <--> txc_l3b10.gate++;
        txc_l3b6.gate++ <--> txc_l3b8.gate++;
        txc_l3b6.gate++ <--> txc_l3b9.gate++;
}
