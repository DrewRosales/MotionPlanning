function result = isSO(R)
    [m, n] = size(R);
    
    if ~(numel(R) == 4 || numel(R) == 9) || (m ~= n)
        result = 0;
        return;
    end

    I = eye(m);
    RtR = R' * R;
    if ~all(abs(RtR(:) - I(:)) < 1e-6)
        result = 0;
        return; 
    end

    if abs(det(R) - 1) >= 1e-6
        result = 0;
        return;
    end


    % Return 1 since both conditions hold
    result = 1;
end
