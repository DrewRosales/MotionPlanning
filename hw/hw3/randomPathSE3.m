function q = plan_SE3_path(q_init, q_goal, n)

    t_init = q_init(1:3);
    rpy_init = q_init(4:6);
    
    t_goal = q_goal(1:3);
    rpy_goal = q_goal(4:6);
    
    t = [0, 1];
    A = [t'.^3, t'.^2, t', ones(2,1)];
    
    px_coeffs = A \ [t_init(1); t_goal(1)];
    py_coeffs = A \ [t_init(2); t_goal(2)];
    pz_coeffs = A \ [t_init(3); t_goal(3)];
    roll_coeffs = A \ [rpy_init(1); rpy_goal(1)];
    pitch_coeffs = A \ [rpy_init(2); rpy_goal(2)];
    yaw_coeffs = A \ [rpy_init(3); rpy_goal(3)];
    
    s_values = linspace(0, 1, n);
    
    q = zeros(n, 6);
    
    for i = 1:n
        s = s_values(i);
        
        p_s = [polyval(px_coeffs, s); polyval(py_coeffs, s); polyval(pz_coeffs, s)];
        rpy_s = [polyval(roll_coeffs, s); polyval(pitch_coeffs, s); polyval(yaw_coeffs, s)];
        
        q(i, :) = [p_s', rpy_s'];
    end
end