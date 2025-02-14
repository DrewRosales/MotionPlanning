function [H_mat] = H(theta,t)
R = [cos(theta) -sin(theta);
     sin(theta) cos(theta)];
H_mat = [R t;
        0 0 1];
end