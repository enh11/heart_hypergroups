function result = beta_relation(H, M)
% BETA_RELATION Computes the β relation for a hypergroupoid
%
%   RESULT = BETA_RELATION(H, M) returns the set of all pairs {x, y} 
%   such that x and y appear together in some finite hyperproduct of 
%   elements in the hypergroupoid.
%
%   Inputs:
%       H - Cell array of elements in the hypergroupoid, e.g., {'a','b','c','d'}
%       M - Cell array representing the Cayley table (hyperoperation table),
%           where M{i,j} contains the set of results of the operation on H{i} and H{j}
%
%   Output:
%       RESULT - Cell array of pairs {x, y} representing the β relation.
%
%   Example:
%       H = {'a', 'b', 'c', 'd'};
%       M = {
%            {'a'}, {'a','b'}, {'a','c'}, {'a','d'};
%            {'a'}, {'a','b'}, {'a','c'}, {'a','d'};
%            {'a'}, {'b'},     {'c'},     {'d'};
%            {'a'}, {'b'},     {'c'},     {'d'}
%           };
%
%       result = beta_relation(H, M);
%       % Expected output:
%       expected = {
%           {'a','a'}, {'b','b'}, {'c','c'}, {'d','d'}, {'a','b'}, ...
%           {'b','a'}, {'a','c'}, {'c','a'}, {'a','d'}, {'d','a'}
%       };
%       assert(isequal(result, expected));
   A = set_of_finite_hyperproducts(H,M);
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
