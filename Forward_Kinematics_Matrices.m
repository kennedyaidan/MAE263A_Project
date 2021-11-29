%% Forward Kinematics Matrices
%All angles in radians

syms a0 d1 t1 a1 d2 t2 a2 d3 t3 a3 d4 t4 ae r11 r12 r13 r21 r22 r23 r31 r32 r33 x y z


T01 = [cos(t1) -sin(t1) 0 0;
       sin(t1)  cos(t1) 0 0;
       0        0       1 0;
       0        0       0 1];
   
T12 = [cos(t2)  -sin(t2)   0 0;
       0         0         1 0;
       -sin(t2)  -cos(t2)  0 0;
        0         0        0 1];
   
T23 = [cos(t3) -sin(t3)  0 a2;
       sin(t3)  cos(t3)  0  0;
       0        0        1 d3;
       0        0        0 1];
   
T34 = [cos(t4) -sin(t4) 0 a3;
       sin(t4)  cos(t4) 0  0;
       0        0       1  d4;
       0        0       0  1];
   
T45 = [1 0 0 ae;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1];
   
T0G = T01*T12*T23*T34*T45

T01_inv = simplify(inv(T01))

T12_inv = simplify(inv(T12))

T23_inv = simplify(inv(T23))

T34_inv = simplify(inv(T34))

TG = [r11 r12 r13 x;
      r21 r22 r23 y;
      r31 r32 r33 z;
      0   0   0   1];

Y = simplify(T01_inv*TG)

%X = simplify(vpa(T12_inv*T01_inv*TG))

Z = simplify(vpa(T23_inv*T12_inv*T01_inv*TG))

%ZZ = simplify(vpa(T34_inv*T23_inv*T12_inv*T01_inv*TG))

M = T12*T23*T34*T45


%N = simplify(vpa(T23*T34))

O = simplify(vpa(T34))

%P = simplify(vpa(T45))
