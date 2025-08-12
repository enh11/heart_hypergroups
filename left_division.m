function result = left_division(H,M,x,y)
result = {};
    for a = 1:length(H) 
        ya = hyperoperation(H,M,y,H{a});
            if ismember(x,ya) 
                result{end+1} = H{a};
            end
    end
end
