function result = hyperproducts_set(H, M)
    a_prev = {};
    a_curr = {};
    for a=H
        a_curr{end+1} = a;
    end
    while true
        a_prev = a_curr;
        for i = 1:length(a_prev)
            for j = 1:length(a_prev)
                r = a_prev{i};
                s = a_prev{j};
                prod = set_operation(H, M, r, s); 
                    if ~any(cellfun(@(x) isequal(x, prod), a_curr))
                        a_curr{end+1} = prod;
                    end
            end
        end
        if isequal(a_curr, a_prev)
            break;
        end
    end
    result = a_curr;
end
