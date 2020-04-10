simple SimpleHost{
	parameters:
	    int limit;
	gates:
	    input in;
	    output out;
}

network Network{
	submodules:
	    host[2]: SimpleHost;
	connections:
	    host[0].out --> {delay = 1000ms; } --> host[1].in;
	    host[1].out --> {delay = 1000ms; } --> host[0].in;
}