function y = fun_celu(itemsVal, X)
    if ~isvector(X)
        error('X isnt a vector');
    end
    if length(itemsVal) ~= length(X)
        error('length of itemsVal and X doesnt match');
    end
    N = length(itemsVal);
    range = 1 : N;
    
    y = 0;
    for i = range
        y = y - itemsVal(i) * X(i);
    end
end

