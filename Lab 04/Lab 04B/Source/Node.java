package omnet;

public class Node {
    String type;
    String name;
    double x, y;
    final String coreIcon = "block/switch";
    final String aggIcon = "block/switch,cyan";
    final String edgeIcon = "block/switch,yellow";
    final String pcIcon = "device/pc";

    public Node(String type, String name) {
        setType(type);
        setName(name);
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    String toNED() {
        String iconString;
        switch (type) {
            case "core":
                iconString = coreIcon;
                break;
            case "agg":
                iconString = aggIcon;
                break;
            case "edge":
                iconString = edgeIcon;
                break;
            case "pc":
                iconString = pcIcon;
                break;
            default:
                throw new RuntimeException("Invalid type:" + type);
        }
        return "\t\t" +name + ": Node {@display(\"i=" + iconString + ";p=" + getX() + "," + getY() + "\");}\n";
    }
}
