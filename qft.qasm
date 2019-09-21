OPENQASM 2.0;
include "qelib1.inc";
qreg q[4];
creg c[4];

// set input states
h q[0];
u1(-pi) q[0];
h q[1];
u1(-pi/2) q[1];
h q[2];
u1(-pi/4) q[2];
h q[3];
u1(-pi/8) q[3];

// perform Quantum Fourier Transform (QFT)
h q[0];
cu1(pi/2) q[1], q[0];
cu1(pi/4) q[2], q[0];
cu1(pi/8) q[3], q[0];
barrier q;
h q[1];
cu1(pi/2) q[2], q[1];
cu1(pi/4) q[3], q[1];
barrier q;
h q[2];
cu1(pi/2) q[3], q[2];
barrier q;
h q[3];

measure q[0] -> c[0];
measure q[1] -> c[1];
measure q[2] -> c[2];
measure q[3] -> c[3];
