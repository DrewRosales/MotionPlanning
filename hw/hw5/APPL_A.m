function contact_matrix = APPL_A(A, B, q)
    x = q(1);
    y = q(2);
    theta = q(3);
    
    R = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    
    A_transformed = R * A + [x; y];
    nA = size(A, 2);
    nB = size(B, 2);
    
    contact_matrix = zeros(nA, nB);
    
    A_edges = diff([A_transformed, A_transformed(:,1)], 1, 2);
    vA = [-A_edges(2,:); A_edges(1,:)];
    
    vA = vA ./ vecnorm(vA);
    
    % Check applicability condition
    for i = 1:nA
        for j = 1:nB

            b_j = B(:, j);
            
            % Previous Vertex
            b_jm1 = B(:, mod(j-2, nB) + 1);
            
            % 
            b_jp1 = B(:, mod(j, nB) + 1);
            
            vA_i = vA(:, i);
            
            cond1 = dot(vA_i, b_jm1 - b_j) >= 0;
            cond2 = dot(vA_i, b_jp1 - b_j) >= 0;
            
            if cond1 && cond2
                contact_matrix(i, j) = 1;
            end
        end
    end
    
end