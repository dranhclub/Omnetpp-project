package omnet;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.LinkedList;
import java.util.Scanner;

public class FatTreeGenerator {
    final String defineNode = "simple Node{gates:inout gate[];}\n";
    final String networkName = "Lab4b2";
    final double OFFSETX = 0;
    final double OFFSETY = 50;
    final double WIDTH;
    final double HEIGHT = 800;
    final double PADDING;

    final int k;
    final Channel channel;
    Node[] coreNodes;
    Node[] aggNodes;
    Node[] edgeNodes;
    Node[] pcNodes;
    LinkedList<Connection> connections;

    public FatTreeGenerator(int k, int dataRate) {
        this.k = k;
        channel = new Channel("Channel", dataRate);
        if (k % 2 == 1) {
            throw new IllegalArgumentException("k must be even");
        }
        if (k < 4) {
            throw new IllegalArgumentException("k must be >= 4");
        }
        PADDING = k == 4 ? 50 : k == 6 ? 40 : 25;
        WIDTH = k * k * k * PADDING / 4;
        initNodes();
        setNodePositions();
        setConnections();
    }

    private void initNodes() {
        coreNodes = new Node[k];
        for (int i = 0; i < coreNodes.length; i++) {
            coreNodes[i] = new Node("core", "core" + i);
        }

        aggNodes = new Node[k * k / 2];
        for (int i = 0; i < aggNodes.length; i++) {
            aggNodes[i] = new Node("agg", "agg" + i);
        }

        edgeNodes = new Node[k * k / 2];
        for (int i = 0; i < edgeNodes.length; i++) {
            edgeNodes[i] = new Node("edge", "edge" + i);
        }

        pcNodes = new Node[k * k * k / 4];
        for (int i = 0; i < pcNodes.length; i++) {
            pcNodes[i] = new Node("pc", "pc" + i);
        }
    }

    private void setNodePositions() {
        for (int i = 0; i < coreNodes.length; i++) {
            coreNodes[i].setX(OFFSETX + i * PADDING * k * k / 4 + WIDTH / 2 - (coreNodes.length - 1) / 2.0 * PADDING * k * k / 4);
            coreNodes[i].setY(OFFSETY);
        }
        for (int i = 0; i < aggNodes.length; i++) {
            aggNodes[i].setX(OFFSETX + i * PADDING * k / 2 + WIDTH / 2 - (aggNodes.length - 1) / 2.0 * PADDING * k / 2);
            aggNodes[i].setY(OFFSETY + 200);
        }
        for (int i = 0; i < edgeNodes.length; i++) {
            edgeNodes[i].setX(OFFSETX + i * PADDING * k / 2 + WIDTH / 2 - (edgeNodes.length - 1) / 2.0 * PADDING * k / 2);
            edgeNodes[i].setY(OFFSETY + 400);
        }
        for (int i = 0; i < pcNodes.length; i++) {
            pcNodes[i].setX(OFFSETX + i * PADDING + WIDTH / 2 - (pcNodes.length - 1) / 2.0 * PADDING);
            pcNodes[i].setY(OFFSETY + 600);
        }
    }

    private void setConnections() {
        connections = new LinkedList<Connection>();
        // Core layer <--> Aggregation Layer
        for (int i = 0; i < coreNodes.length; i++) {
            for (int j = 0; j < aggNodes.length; j++) {
                if (i < 2 && j % 2 == 0 || i >= 2 && j % 2 == 1) {
                    connections.add(new Connection(coreNodes[i], aggNodes[j], channel));
                }
            }
        }

        // Aggregation layer <--> Edge layer
        for (int i = 0; i < aggNodes.length; i++) {
            for (int j = 0; j < edgeNodes.length; j++) {
                if (i / (k / 2) == j / (k / 2)) {
                    connections.add(new Connection(aggNodes[i], edgeNodes[j], channel));
                }
            }
        }

        // Edge layer
        for (int i = 0; i < edgeNodes.length; i++) {
            for (int j = 0; j < pcNodes.length; j++) {
                if (j/(k/2) == i) {
                    connections.add(new Connection(edgeNodes[i], pcNodes[j], channel));
                }
            }
        }
    }

    public String generateNED() {
        StringBuilder ret = new StringBuilder();
        ret.append(defineNode);
        ret.append("network " + networkName + "\n" +
                "{\n" +
                "    @display(\"bgb=" + WIDTH + ", " + HEIGHT + "\");\n" +
                "    types:\n" +
                "        channel " + channel.getName() +" extends ned.DatarateChannel {\n" +
                "            datarate = "+ channel.getDataRate() +"Mbps;\n" +
                "        }\n" +
                "    submodules:\n");
        for (var m : coreNodes) {
            ret.append(m.toNED());
        }
        for (var m : aggNodes) {
            ret.append(m.toNED());
        }
        for (var m : edgeNodes) {
            ret.append(m.toNED());
        }
        for (var m : pcNodes) {
            ret.append(m.toNED());
        }
        ret.append("\tconnections:\n");
        for (var c : connections){
            ret.append(c.toNED());
        }
        ret.append("}");
        return ret.toString();
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("k = ");
        int k = scanner.nextInt();
        System.out.print("dataRate = ");
        int dataRate = scanner.nextInt();
        String fatTree = new FatTreeGenerator(k, dataRate).generateNED();

        String fileName = "lab4b2.ned";
        File f = new File(fileName);
        try {
            FileWriter myWriter = new FileWriter(fileName);
            myWriter.write(fatTree);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
