function result = from_matrix_to_relation(H,zero_one_matrix)
[m, n] = size(zero_one_matrix);  % Z is your matrix
if ~isequal(m,n,length(H))
     error('Input matrix does not represent a relation on H. Error in sizes!');
end
result = {};
for i = 1:m
    for j = 1:n
        if isequal(zero_one_matrix(i,j),1)
            new_pair = {H{i},H{j}};
            % Avoid duplicates
            if ~any(cellfun(@(x) isequal(x, new_pair), result))
            result{end+1} = new_pair; 
            end
        end
    end
end
end