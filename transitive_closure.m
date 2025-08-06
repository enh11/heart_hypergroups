function result = transitive_closure(H,Relation)
    z = from_relation_to_zero_one_matrix(H,Relation);
    n = length(H);
    result  = zeros(n);
    for k = 1:n
        for i = 1:n
            for j = 1:n
                if z(i,k) && z(k,j)
                result(i,j) = 1;
                end
            end
        end    
    end
end