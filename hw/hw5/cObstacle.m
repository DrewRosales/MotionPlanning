function CB_theta = cObstacle(theta, A, B)
    if size(A, 2) < 3 || size(B, 2) < 3
        error('Insufficient Vertices');
    end
    
    R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    
    CB_theta = [];
    for i = 1:size(A, 2)
        for j = 1:size(B, 2)
            CB_theta = [CB_theta, R * A(:, i) - B(:, j)];
        end
    end
end