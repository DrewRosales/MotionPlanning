function S = wedge(v)

    if isscalar(v)
        S = [0, -v; v, 0];

    elseif isequal(size(v), [3,1]) || isequal(size(v), [1,3])
        S = [  0   -v(3)  v(2);
               v(3)  0   -v(1);
              -v(2) v(1)  0  ];
    end
end