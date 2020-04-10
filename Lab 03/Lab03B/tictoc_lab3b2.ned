simple Txc_l3b2
{
    parameters:
        double pos_x = default(0);
        double pos_y = default(0);
        @display("i=block/routing;p=$pos_x,$pos_y");
    gates:
        inout gate[];

}

network Tictoc_lab3b2
{
    @display("bgb=1076,970");
    submodules:
        s[100]: Txc_l3b2;
    connections:

        // Kết nối dọc, ngang cho 64 nút chẵn
        for i=0..63, for j=0..63 {
            s[i].gate++ <--> s[j].gate++ if (i+1==j && i % 8 != 7);
            s[i].gate++ <--> s[j].gate++ if (i+8==j);
        }

        // Kết nối dọc, ngang cho 36 nút lẻ
        for i=64..99, for j=64..99 {
            s[i].gate++ <--> s[j].gate++ if (i+1==j && (i-64) % 6 != 5);
            s[i].gate++ <--> s[j].gate++ if (i+6==j);
        }

        // Kết nối chéo
        for i=0..5, for j=64..69 {
            s[i].gate++ <--> s[j].gate++ if (i+64==j);
        }
        for i=8..13, for j=70..75 {
            s[i].gate++ <--> s[j].gate++ if (i+62==j);
        }
        for i=16..21, for j=76..81 {
            s[i].gate++ <--> s[j].gate++ if (i+60==j);
        }
        for i=24..29, for j=82..87 {
            s[i].gate++ <--> s[j].gate++ if (i+58==j);
        }
        for i=32..37, for j=88..93 {
            s[i].gate++ <--> s[j].gate++ if (i+56==j);
        }
        for i=40..45, for j=94..99 {
            s[i].gate++ <--> s[j].gate++ if (i+54==j);
        }
}
