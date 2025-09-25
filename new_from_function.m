function result = new_from_function(H, binary_function)
    % Create index matrices for all combinations of i and j
    [I, J] = ndgrid(1:length(H), 1:length(H));
    
    % Apply the binary function to each pair of indices
    result = arrayfun(@(i,j) binary_function(H(i), H(j)), I, J, 'UniformOutput', false);
end

