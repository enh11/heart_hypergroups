function result = is_weak_associative(H, M)
result = true;
    for a  = H
        for b  = H 
            for c  = H 
                ab_c = set_operation(H,M,
                    hyperoperation(H,M,a,b),c);
                a_bc = set_operation(H,M,a,hyperoperation(H,M,b,c));
                if isempty(intersect(a_bc,ab_c))
                    result = false;
                    return;
                end
            end
        end
    end 
end
