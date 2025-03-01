function contact_matrix = APPL_B(A, B, q)
    x = q(1);
    y = q(2);
    theta = q(3);
    
    R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    
    A_transformed = R * A + [x; y];
    nA = size(A, 2);
    nB = size(B, 2);
    
    contact_matrix = zeros(nA, nB);
    
    B_edges = diff([B, B(:,1)], 1, 2);
    vB = [-B_edges(2,:); B_edges(1,:)];
    
    vB = vB ./ vecnorm(vB);
    
    % Check applicability condition
    for i = 1:nA
        for j = 1:nB

            a_j = A_transformed(:, j);
            
            % Previous Vertex
            a_jm1 = A_transformed(:, mod(i-2, nA) + 1);
            
            % Next Vertex
            a_jp1 = B(:, mod(i, nA) + 1);
            
            vB_i = vB(:, i);
            
            cond1 = dot(vB_i, a_jm1 - a_j) >= 0;
            cond2 = dot(vB_i, a_jp1 - a_j) >= 0;
            
            if cond1 && cond2
                contact_matrix(i, j) = 1;
            end
        end
    end
    
end