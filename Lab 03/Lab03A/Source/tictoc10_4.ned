simple Txc10_4
{
    parameters:
        @display("i=block/routing");
        bool sendOnInit = default(false);
    gates:
        inout gate[];
}

network Tictoc10_4
{
    types:
        channel Channel extends ned.DelayChannel
        {
            delay = 100ms;
        }
    submodules:
        tic[9]: Txc10_4;
    connections:
		tic[1].gate++ <--> Channel <--> tic[3].gate++;
		tic[0].gate++ <--> Channel <--> tic[2].gate++;
		
        tic[1].gate++ <--> Channel <--> tic[2].gate++;
		tic[2].gate++ <--> Channel <--> tic[3].gate++;
        tic[3].gate++ <--> Channel <--> tic[4].gate++;
        tic[4].gate++ <--> Channel <--> tic[5].gate++;
        tic[5].gate++ <--> Channel <--> tic[6].gate++;
        tic[6].gate++ <--> Channel <--> tic[7].gate++;	
        tic[7].gate++ <--> Channel <--> tic[8].gate++;
        tic[8].gate++ <--> Channel <--> tic[1].gate++;
}
