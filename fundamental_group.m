function result = fundamental_group(H,M)
    beta = beta_relation(H,M);
    beta_star = transitive_closure(H,beta);
    quotient = quotient_set(H,M,beta_star);
    n = length(quotient);
    result = cell(n, n);
    result  = {};
    for i=1:n
        for j = 1:n
        ab_class = {};
            for a = 1:length(quotient{i})   
                for b = 1:length(quotient{j})
                    ab = hyperoperation(H,M,quotient{i}{a},quotient{j}{b});
                    ab_class = union(ab_class,ab);
                    result{i,j} = ab_class;
                end
            end
        end
        result{i,j} = ab_class;
    end
end