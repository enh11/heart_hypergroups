function result = quotient_set(H,M, Equivalence)
%% Input Validation
result  = {};
    for i=1:length(H)
        new_class = get_beta_class(H,M,H{i});
        if ~any(cellfun(@(x) isequal(x, new_class), result))
            result{end+1} = new_class; 
        end
    end
end