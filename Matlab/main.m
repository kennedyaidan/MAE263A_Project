% MAE C163A/C263A Project
% Team X

% Initialize
initialize();
input('Press any key to continue!');


% Main
theta1 = pi/2; % DH joint angle unit rad

Theta1 = theta1/2/pi*4096; % Motor angle 0-4095; You may also need to consider the offset, i.e., when theta1 = 0, Theta1 ~= 0.

% Move MX28_ID(1) to Theta1 angle
write4ByteTxRx(port_num, PROTOCOL_VERSION, MX28_ID(1), MX28_GOAL_POSITION, typecast(int32(Theta1), 'uint32'));


% Terminate
input('Press any key to terminate!');
terminate();