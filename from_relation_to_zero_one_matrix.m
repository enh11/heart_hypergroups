function result = from_relation_to_zero_one_matrix(H,Relation)
    n = length(H);
    result = zeros(n);

% Step 4: Fill the matrix based on the relation
    for i = 1:length(Relation)
        x = find(strcmp(H, Relation{i}{1}));
        y = find(strcmp(H, Relation{i}{2}));
        result(x,y) = 1;
        result(y,x) = 1;
    end
end
