function result = from_relation_to_zero_one_matrix(H, Relation)
% FROM_RELATION_TO_ZERO_ONE_MATRIX  Converts a relation into a 0–1 matrix.
%
%   result = FROM_RELATION_TO_ZERO_ONE_MATRIX(H, Relation) returns an
%   n-by-n binary matrix where n = length(H). An entry (i,j) is 1 if
%   the pair {H{i}, H{j}} is in Relation (or its symmetric pair), otherwise 0.
%
%   Inputs:
%       H - A cell array of strings representing the set of elements.
%           Example: {'a','b','c'}
%       Relation - A cell array of pairs, each pair is a 1x2 cell array
%           representing a relation between elements of H.
%           Example: { {'a','b'}, {'b','c'} }
%
%   Output:
%       result - n-by-n binary matrix (0 or 1) representing the relation.

    n = numel(H);
    result = zeros(n);

    for k = 1:numel(Relation)
        pair = Relation{k};
        x = find(strcmp(H, pair{1}));
        y = find(strcmp(H, pair{2}));

        % Fill the adjacency matrix (symmetric)
        result(x,y) = 1;
    end
end

%!test
%! H = {'a','b','c'};
%! R = { {'a','b'}, {'b','c'} };
%! M = from_relation_to_zero_one_matrix(H, R);
%! assert(isequal(M, [0 1 0; 0 0 1; 0 0 0]));
