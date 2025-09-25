function result = set_operation(H, M, A, B)
% SET_OPERATION  Computes the union of hyperoperations over all pairs (x, y) with x in A and y in B.
%
%   result = SET_OPERATION(H, M, A, B) returns the union of all elements resulting from 
%   applying the hyperoperation defined by M to every combination of elements x in A and y in B.
%
%   Inputs:
%       H - A 1×n cell array representing the elements of the set.
%           Example: {'a', 'b', 'c', 'd'}
%
%       M - An n×n cell array where M{i,j} is a cell array representing the 
%           hyperoperation result of H{i} and H{j}.
%
%       A - Subset of H (as a string or cell array of strings).
%       B - Subset of H (as a string or cell array of strings).
%
%   Output:
%       result - A row cell array containing the union of all elements in 
%                hyperoperation(H, M, x, y) for each x in A and y in B.
%
%   Example usage:
%       H = {'a', 'b', 'c'};
%       M = {
%           {'a'}, {'a','b'}, {'b'};
%           {'b'}, {'b'},     {'c'};
%           {'c'}, {'a'},     {'b'}
%       };
%       result = set_operation(H, M, {'a','b'}, 'c');  % Returns union of all a•c and b•c
%
%   Notes:
%       - If A or B is passed as a single string, it is automatically wrapped in a cell array.
%       - Output is reshaped into a 1×n cell array for consistency.

    % Convert char input to single-element cell arrays
    if ischar(A)
        A = {A};
    end
    if ischar(B)
        B = {B};
    end

    % Step 1: Compute hyperoperation for all pairs (x,y) using nested cellfun
    % This produces a nested cell array
    pairsUnion = cellfun(@(x) ...
                    cellfun(@(y) hyperoperation(H, M, x, y), B, 'UniformOutput', false), ...
                    A, 'UniformOutput', false);

    % Step 2: Flatten the nested cell array into a single-level cell array
    flatUnion = [pairsUnion{:}];  % 1 × (numel(A)*numel(B)) cell array

    % Step 3: Compute the union over all elements using a functional fold
    result = flatUnion{1};  % start with the first element
    result = fold_union(flatUnion(2:end), result);

    % Step 4: Ensure result is a row cell array
    result = reshape(result, 1, []);
end

% Helper function: recursively fold union over a cell array
function acc = fold_union(cells, acc)
    if isempty(cells)
        return;
    end
    acc = union(acc, cells{1});
    acc = fold_union(cells(2:end), acc);
end
