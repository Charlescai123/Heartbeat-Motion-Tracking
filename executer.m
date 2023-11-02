
% Initialize RVCToolBox
RTBPath = 'D:\MATLAB\R2022b\rvctools\startup_rvc.m'; 
run(RTBPath);
mdl_puma560;
q = [0 0 0 0 0 0];
p560.plot(q);

% Build a node and a subscriber
port = serialportlist;
rosshutdown;
nodeSub = ros2node('subscriber');
msgSub = ros2subscriber(nodeSub, '/chatter', 'std_msgs/String', @ros2callback);
msgSub.NewMessageFcn = {@ros2callback, p560};