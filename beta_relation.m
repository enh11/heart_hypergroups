function result = beta_relation(H, M)
   A = hyperproducts_set(H,M);
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

%!test
%! H = {'a', 'b', 'c', 'd'};
%! M = {
%!          {'a'}, {'a', 'b'}, {'a', 'c'}, {'a', 'd'};
%!          {'a'}, {'a', 'b'}, {'a', 'c'}, {'a', 'd'};
%!          {'a'}, {'b'},      {'c'},      {'d'};
%!          {'a'}, {'b'},      {'c'},      {'d'}
%!      };
%! expected = {
%!              {'a','a'},{'b','b'},{'c','c'},{'d','d'}, {'a','b'}, ...
%!              {'b','a'}, {'a','c'}, {'c','a'}, {'a','d'}, {'d','a'}
%!             };
%! assert(isequal(beta_relation(H, M), expected));
