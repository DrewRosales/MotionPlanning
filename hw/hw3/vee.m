function v = vee(S)
    if isequal(size(S), [2,2])
        v = S(2,1);
        
    else %3x3
        v = [S(3,2); S(1,3); S(2,1)];
    end
end