package torus3d;

public class Host extends Node{

    public Host(String name) {
        super(name);
    }

    @Override
    public String toNED() {
        return "\t\t" + getName() + ": Host { @display(\"p=" + getPosX() + "," + getPosY() + ";i=abstract/server;is=s\"); }\n";
    }
}
