package omnet;

public class Connection {
    private Node a;
    private Node b;
    private Channel channel;

    public Connection(Node a, Node b, Channel c){
        this.a = a;
        this.b = b;
        this.channel = c;
    }

    String toNED(){
        return "\t\t" + a.getName() + ".gate++ <--> " + channel.getName() + " <--> " + b.getName() + ".gate++;\n";
    }
}
