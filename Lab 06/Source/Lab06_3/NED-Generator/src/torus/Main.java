package torus;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main {
    private static void writeToFile(String content, String filePath){
        File f = new File(filePath);
        try {
            FileWriter myWriter = new FileWriter(filePath);
            myWriter.write(content);
            myWriter.close();
            System.out.println(content);
            System.out.println("Successfully wrote to the file: " + f.getCanonicalPath());
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
//        TorusGenerator generator = new Torus3DGenerator(3);
//        writeToFile(generator.generateNED(), "../Torus3D.ned");
//        writeToFile(generator.getConnectionsList(), "../ConnectionsList.txt");

        TorusGenerator generator = new Torus2DGenerator(3);
        writeToFile(generator.generateNED(), "../Torus2D.ned");
        writeToFile(generator.getConnectionsList(), "../ConnectionsList.txt");
    }
}
