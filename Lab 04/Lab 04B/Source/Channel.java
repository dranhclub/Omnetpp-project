package omnet;

public class Channel {
    private String name;
    private int dataRate;

    public Channel(String name, int dataRate){
        this.name = name;
        this.dataRate = dataRate;
    }

    public String getName() {
        return name;
    }

    int getDataRate(){
        return dataRate;
    }
}
