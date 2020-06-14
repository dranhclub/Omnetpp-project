package torus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Torus2DGenerator extends TorusGenerator {
    private final double SCALE = 200;
    private final double OFFSET = 200;
    final double HOST_OFFSET_X = -30;
    final double HOST_OFFSET_Y = -30;
    private Switch[][] switches;
    private Host[][] hosts;
    private ArrayList<Connection> connections = new ArrayList<>();

    public Torus2DGenerator(int k) {
        super(k);
        createSwitches();
        createHosts();
        createConnections();
    }

    private void createSwitches() {
        switches = new Switch[K][K];
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                    Switch s = new Switch(x, y, 0);
                    s.setPosX(OFFSET + x * SCALE);
                    s.setPosY(OFFSET + y * SCALE);
                    switches[x][y] = s;
            }
        }
    }

    private void createHosts() {
        hosts = new Host[K][K];
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                    var host = new Host(x, y, 0);
                    host.setPosX(switches[x][y].getPosX() + HOST_OFFSET_X);
                    host.setPosY(switches[x][y].getPosY() + HOST_OFFSET_Y);
                    hosts[x][y] = host;
            }
        }
    }

    private void createConnections() {
        var channel = new Channel("Channel", 15);

        // Switch to Switch (Lines)
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K - 1; y++) {
                connections.add(new Connection(switches[x][y], switches[x][y + 1], channel));
            }
        }
        for (int y = 0; y < K; y++) {
            for (int x = 0; x < K - 1; x++) {
                connections.add(new Connection(switches[x][y], switches[x + 1][y], channel));
            }
        }

        // Switch to Switch (Curves)
        for (int x = 0; x < K; x++) {
            connections.add(new Connection(switches[x][0], switches[x][K - 1], channel));
        }
        for (int y = 0; y < K; y++) {
            connections.add(new Connection(switches[0][y], switches[K - 1][y], channel));
        }

        // Switch to Host
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                connections.add(new Connection(switches[x][y], hosts[x][y], channel));
            }
        }
    }

    public String generateNED() {
        StringBuilder str = new StringBuilder();
        str.append("simple Host\n" +
                "{\n" +
                "\tgates:\n" +
                "\t    inout port[];\n" +
                "}\n" +
                "\n" +
                "simple Switch\n" +
                "{\n" +
                "    gates:\n" +
                "        inout port[];\n" +
                "}\n" +
                "\n" +
                "network Torus2D\n" +
                "{\n" +
                "    @display(\"bgb=1000,700\");\n" +
                "    types:\n" +
                "        channel Channel extends ned.DelayChannel\n" +
                "        {\n" +
                "            delay = 15ms;\n" +
                "        }\n" +
                "    submodules:");
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                str.append(switches[x][y].toNED());
            }
        }
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                str.append(hosts[x][y].toNED());
            }
        }
        str.append("\tconnections:\n");
        for (var c : connections) {
            str.append(c.toNED());
        }
        str.append("}");
        return str.toString();
    }

    public String getConnectionsList() {
        StringBuilder stringBuilder = new StringBuilder();
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                for (int z = 0; z < K; z++) {
                    stringBuilder.append(switches[x][y].name);
                    stringBuilder.append(" ");
                    for (var adjNode : switches[x][y].getAdjNodes()) {
                        stringBuilder.append(adjNode.getName());
                        stringBuilder.append(" ");
                    }
                    stringBuilder.deleteCharAt(stringBuilder.lastIndexOf(" "));
                    stringBuilder.append("\n");
                }
            }
        }
        stringBuilder.deleteCharAt(stringBuilder.lastIndexOf("\n"));
        return stringBuilder.toString();
    }

}
