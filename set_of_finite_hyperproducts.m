function result = set_of_finite_hyperproducts(H, M)
    a_prev = {};
    a_curr = {};
    for a=H
        a_curr{end+1} = a;
    end
    m = 0;
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
        m = m+1;
        if isequal(a_curr, a_prev)
            %disp(m);
            break;
        end
    end
    result = a_curr;
end
