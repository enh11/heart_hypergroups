function result = beta_relation(H, M)
   A = finite_hyperproducts_set(H,M);
    result = {};
    for i = 1:length(A)
        q = A{i};  % q is a cell array like {'a','b'}
        for m = 1:length(q)
            for n = 1:length(q)
                pair = {q{m}, q{n}};  % Create the pair (x, y)
                % Avoid duplicates
                if ~any(cellfun(@(x) isequal(x, pair), result))
                    result{end+1} = pair;
                    
                end
            end
        end
    
    end 
end
