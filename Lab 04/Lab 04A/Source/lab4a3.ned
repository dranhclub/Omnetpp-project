simple SimpleHost3
{
    parameters:
        int limit;
    gates:
        input in;
        output out;
}

network Network3
{
    parameters:
        int numHosts;
    submodules:
        host[numHosts]: SimpleHost3;
    connections:
        host[numHosts - 1].out --> {  delay = 1000ms; } --> host[0].in;
        for i=0..numHosts-2 {
            host[i].out --> {  delay = 1000ms; } --> host[i+1].in;
        }
}
