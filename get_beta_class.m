function result = get_beta_class(H, M, x)
    beta = beta_relation(H, M);
    result = {};  % empty cell array to accumulate matching elements
    
    for i = 1:length(H)
        a = H{i};
        pair = {a, x};
        if any(cellfun(@(p) isequal(p, pair), beta))
            % union of cell arrays of strings:
            result = union(result, {a});
        end
    end
end
