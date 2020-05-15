package torus3d;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

public class Torus3DGenerator {
    private final int K;
    private final double SCALE = 200;
    private final double OFFSET = 200;
    private final double SKEW_X = 80;
    private final double SKEW_Y = -50;
    private Switch[][][] switches;
    private ArrayList<Connection> connections = new ArrayList<>();

    public Torus3DGenerator(int k) {
        K = k;
        createSwitches();
        createConnections();
    }

    private void createSwitches() {
        switches = new Switch[K][K][K];
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                for (int z = 0; z < K; z++) {
                    Switch s = new Switch("sw" + x + "_" + y + "_" + z);
                    s.setPosX(OFFSET + z * SKEW_X + x * SCALE);
                    s.setPosY(OFFSET + z * SKEW_Y + y * SCALE);
                    switches[x][y][z] = s;
                }
            }
        }
    }

    private void createConnections() {
        var channel = new Channel("Channel", 15);
        for (int z = 0; z < K; z++) {
            for (int x = 0; x < K; x++) {
                for (int y = 0; y < K - 1; y++) {
                    connections.add(new Connection(switches[x][y][z], switches[x][y + 1][z], channel));
                }
            }
            for (int y = 0; y < K; y++) {
                for (int x = 0; x < K - 1; x++) {
                    connections.add(new Connection(switches[x][y][z], switches[x + 1][y][z], channel));
                }
            }
        }
        for (int z = 0; z < K - 1; z++) {
            for (int x = 0; x < K; x++) {
                for (int y = 0; y < K; y++) {
                    connections.add(new Connection(switches[x][y][z], switches[x][y][z + 1], channel));
                }
            }
        }

        for (int z = 0; z < K; z++) {
            for (int x = 0; x < K; x++) {
                connections.add(new Connection(switches[x][0][z], switches[x][K - 1][z], channel));
            }
            for (int y = 0; y < K; y++) {
                connections.add(new Connection(switches[0][y][z], switches[K - 1][y][z], channel));
            }
        }
        for (int z = 0; z < K; z++) {
            for (int x = 0; x < K; x++) {
                for (int y = 0; y < K; y++) {
                    connections.add(new Connection(switches[x][y][0], switches[x][y][K - 1], channel));
                }
            }
        }
    }

    private String generateNED() {
        StringBuilder str = new StringBuilder();
        str.append("" +
                "simple Switch\n" +
                "{\n" +
                "    gates:\n" +
                "        inout port[];\n" +
                "}\n" +
                "\n" +
                "network Torus3D\n" +
                "{\n" +
                "    @display(\"bgb=1000,700\");\n" +
                "    types:\n" +
                "        channel Channel extends ned.DelayChannel\n" +
                "        {\n" +
                "            delay = 15ms;\n" +
                "        }\n" +
                "    submodules:\n");
        for (int x = 0; x < K; x++) {
            for (int y = 0; y < K; y++) {
                for (int z = 0; z < K; z++) {
                    str.append(switches[x][y][z].toNED());
                }
            }
        }
        str.append("\tconnections:\n");
        for (var c : connections) {
            str.append(c.toNED());
        }
        str.append("}");
        return str.toString();
    }

    public static void main(String[] args) {
        Torus3DGenerator generator = new Torus3DGenerator(3);
        String torus3d = generator.generateNED();

        String fileName = "../Lab06_3.ned";
        File f = new File(fileName);
        try {
            FileWriter myWriter = new FileWriter(fileName);
            myWriter.write(torus3d);
            myWriter.close();
            System.out.println("Successfully wrote to the file.");
            System.out.println(torus3d);
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
}
