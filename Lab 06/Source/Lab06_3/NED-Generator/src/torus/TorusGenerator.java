package torus;

public abstract class TorusGenerator {
    protected final int K;

    public TorusGenerator(int k) {
        K = k;
    }

    public abstract String generateNED();

    public abstract String getConnectionsList();

}
