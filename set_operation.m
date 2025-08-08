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
    result = {};  % Initialize empty cell array (0×0)
    for a = 1:length(A)
        for b = 1:length(B)
            result = union(
                result, 
                hyperoperation(H, M, A{a}, B{b}));  % Union accumulates results
        end
    end

    % Ensure result is a row cell array (1×n)
    [r,c] = size(result);
        if ~isequal(r,1)
        result = reshape(result,[c,r]);
        end
end
