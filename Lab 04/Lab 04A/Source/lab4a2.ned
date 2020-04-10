network Network2{
    parameters:
        int numHosts;
	submodules:
	    host[numHosts]: SimpleHost;
	connections:
	    host[numHosts - 1].out --> {delay = 1000ms; } --> host[0].in;
	    for i = 0..numHosts-2{
	    	host[i].out --> {delay = 1000ms;} --> host[i+1].in;
	    }
}