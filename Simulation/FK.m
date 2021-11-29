%Specific to robot arm
function [fx,fy,fz,T] = FK(c,joint)



alpha0 = c(1);
a0 = c(2);
d1 = c(3);
alpha1 = c(4);
a1 = c(5);
d2 = c(6);
alpha2 = c(7);
a2 = c(8);
d3 = c(9);
alpha3 = c(10);
a3 = c(11);
d4 = c(12);
t1 = joint(1);
t2 = joint(2);
t3 = joint(3);
t4 = joint(4);

% DH parameters
DH = [alpha0 a0 d1 t1;alpha1 a1 d2 t2;alpha2 a2 d3 t3;alpha3 a3 d4 t4];
alpha = DH(:,1); 
a = DH(:,2); 
d = DH(:,3); 
theta = DH(:,4);

% initial
To = eye(4);
fx = 0; fy = 0; fz = 0;
T{1} = To;

for j = 1:length(joint) 
    
    Ti = [cos(theta(j))                   -sin(theta(j))                 0                  a(j);
          sin(theta(j))*cos(alpha(j))    cos(theta(j))*cos(alpha(j))   -sin(alpha(j))      -sin(alpha(j))*d(j);
          sin(theta(j))*sin(alpha(j))    cos(theta(j))*sin(alpha(j))    cos(alpha(j))       cos(alpha(j))*d(j);
          0                              0                              0                   1];
    To = To*Ti;
    fx = [fx To(1,4)]; % frame x coordiante
    fy = [fy To(2,4)]; % frame y coordiante
    fz = [fz To(3,4)]; % frame z coordiante
    T{j+1} = To;
    
end

end
