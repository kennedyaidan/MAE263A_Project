function [fx,fy,fz,T] = FK(c,joint)

a2 = c(1);
d4 = c(2);
de = c(3);
t1 = joint(1);
t2 = joint(2);
t3 = joint(3);
t4 = joint(4);
t5 = joint(5);
t6 = joint(6);

% DH parameters
DH = [0 0 0 t1;-pi/2 0 0 t2;0 a2 0 t3;pi/2 0 d4 t4;-pi/2 0 0 t5;pi/2 0 0 t6;0 0 de 0];
alpha = DH(:,1); a = DH(:,2); d = DH(:,3); theta = DH(:,4);

% initial
To = eye(4);
fx = 0; fy = 0; fz = 0;
T{1} = To;

for j = 1:7
    
    Ti = [cos(theta(j)) -sin(theta(j)) 0 a(j);
        sin(theta(j))*cos(alpha(j)) cos(theta(j))*cos(alpha(j)) ...
        -sin(alpha(j)) -sin(alpha(j))*d(j);
        sin(theta(j))*sin(alpha(j)) cos(theta(j))*sin(alpha(j)) ...
        cos(alpha(j)) cos(alpha(j))*d(j);0 0 0 1];
    To = To*Ti;
    fx = [fx To(1,4)]; % frame x coordiante
    fy = [fy To(2,4)]; % frame y coordiante
    fz = [fz To(3,4)]; % frame z coordiante
    T{j+1} = To;
    
end

end