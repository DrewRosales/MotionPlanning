function [TR] = shortestPath(q_init, theta, delta, s)

R_init = expm(wedge(q_init(3)));
T_init = eye(3);
T_init(1:2, 1:2) = R_init;
T_init(1:2, 3) = q_init(1:2);

T = eye(3);
T(1:2, 1:2) = expm(wedge(s*theta));
T(3, 1:2) = s*delta;

TR = T * T_init;
end