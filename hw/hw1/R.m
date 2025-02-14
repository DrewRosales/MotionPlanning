function [rotation] = R(theta)
rotation = [cos(theta) -sin(theta);
            sin(theta) cos(theta)];
end