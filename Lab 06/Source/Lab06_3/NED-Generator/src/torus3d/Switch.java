package torus3d;

public class Switch extends Node {
    public Switch(String name) {
        super(name);
    }

    @Override
    public String toNED() {
        return "\t\t" + getName() + ": Switch { @display(\"p=" + getPosX() + "," + getPosY() + ";i=abstract/switch\"); }\n";
    }
}
