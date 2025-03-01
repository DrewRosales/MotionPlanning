function q = plan_SE2_path(q_init, q_goal, n)

    t_init = q_init(1:2);
    theta_init = q_init(3);
    
    t_goal = q_goal(1:2);
    theta_goal = q_goal(3);
    

    t = [0, 1];
    A = [t'.^3, t'.^2, t', ones(2,1)];
    
    px_coeffs = A \ [t_init(1); t_goal(1)];
    py_coeffs = A \ [t_init(2); t_goal(2)];
    theta_coeffs = A \ [theta_init; theta_goal];
    

    s_values = linspace(0, 1, n);
    
    q = zeros(n, 3);
    
    for i = 1:n
        s = s_values(i);
        
        p_s = [polyval(px_coeffs, s); polyval(py_coeffs, s)];
        theta_s = polyval(theta_coeffs, s);
        
        q(i, :) = [p_s', theta_s];
    end
end