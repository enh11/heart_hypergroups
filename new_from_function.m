function result = new_from_function(H, binary_function)

result = {};
    for i = 1:length(H)
        for j  = 1:length(H)
            result{i,j}=binary_function(i,j);
        end
    end
end
