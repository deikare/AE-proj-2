function weight = getItemWeight(item, itemsWeight)
    N = length(itemsWeight);
    
    weight = 0;
    for i = 1 : N
        weight = weight + item(i) * itemsWeight(i);
    end
end

