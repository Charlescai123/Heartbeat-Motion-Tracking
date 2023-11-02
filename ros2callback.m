function ros2callback(msg, robot)

    % Receive ROS message
    fprintf("ROS Subscriber node received: %s\n", msg.data);
    distance = str2double(msg.data);

    % Robot current pose
    q0 = [0 0 0 0 0 0];
    T0 = robot.fkine(q0);

    % Movement aloing x-axis
    T0.t(1) = T0.t(1) + distance;

    % Use IK to compute q
    q = robot.ikine(T0);

    % Execute Robot
    robot.plot(q);

end