function result = right_division(H,M,x,y)
result = {};
    for a = 1:length(H) 
        ay = hyperoperation(H,M,H{a},y);
            if ismember(x,ay) 
                result{end+1} = H{a};
            end
    end
end
