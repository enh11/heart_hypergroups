function result = is_associative(H, M)
% IS_ASSOCIATIVE  Checks whether the hyperoperation defined by M over H is associative.
%
%   result = IS_ASSOCIATIVE(H, M) verifies the associativity of a hyperoperation
%   defined over a set H by the hyperoperation table M. The operation is assumed
%   to be performed using a separate function SET_OPERATION(H, M, A, B) that returns
%   the result of the hyperoperation between elements or subsets A and B.
%
%   Inputs:
%       H - A cell array of strings representing the elements of the set.
%           Example: {'a', 'b', 'c', 'd'}
%       M - A cell matrix (NxN) where each entry M{i,j} is a cell array representing
%           the result of the hyperoperation between H{i} and H{j}.
%
%   Output:
%       result - Boolean value: 
%           true if the hyperoperation is associative,
%           false otherwise. Short-circuits on the first violation.
%
%   Associativity is tested by checking that:
%       (a • b) • c = a • (b • c)
%   for all a, b, c in H.
%
%   Example usage:
%       H = {'a', 'b', 'c'};
%       M = { {'a'}, {'b'}, {'c'}; ... }; % define the Cayley table of your hyperoperation
%       result = is_associative(H, M);

    n = numel(H);

    % Generate all triples of indices
    [A,B,C] = ndgrid(1:n, 1:n, 1:n);
    triples = [A(:), B(:), C(:)];

    % Iterate over triples and short-circuit on failure
    for t = 1:size(triples,1)
        i = triples(t,1);
        j = triples(t,2);
        k = triples(t,3);

        a = H{i};
        b = H{j};
        c = H{k};

        if ~isequal( set_operation(H, M, set_operation(H,M,a,b), c), ...
                     set_operation(H, M, a, set_operation(H,M,b,c)) )
            result = false;
            return; % short-circuit immediately
        end
    end

    result = true; % all triples passed
end

%!test
%! H3 = {'a','b','c'};
%! M3 = {  
%!      {'a'}, {'a', 'b'}, {'a', 'c'};
%!      {'a','b'}, {'b'}, {'b', 'c'};
%!      {'a','b','c'}, {'a', 'b','c'}, {'c'};
%!      };
%! assert(is_associative(H3, M3));
