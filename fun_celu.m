function y = fun_celu(itemsVal, itemsWeight, X, W)
    if ~isvector(X)
        error('X isnt a vector');
    end
    if length(itemsVal) ~= length(X)
        error('length of itemsVal and X doesnt match');
    end
    
    N = length(itemsVal);
    range = 1 : N;
    sum = 0;
    w = 0;

    for i = range
        sum = sum + itemsVal(i) * X(i);
        w = w + itemsWeight(i) * X(i);
    end
    
    if w > W
        y = 0;
    else
        y = - sum;
    end
end

