function result = hyperoperation(H, M, x, y)
% HYPEROPERATION  Retrieves the result of a hyperoperation from its definition table.
%
%   result = HYPEROPERATION(H, M, x, y) returns the output of the hyperoperation 
%   defined on the set H with operation table M, applied to elements x and y.
%
%   Inputs:
%       H - A 1×n cell array of strings representing the elements of the set.
%           Example: {'a', 'b', 'c', 'd'}
%
%       M - An n×n cell array where each entry M{i,j} is a cell array representing 
%           the result of applying the hyperoperation to H{i} and H{j}.
%
%       x - A string representing the first element of the operation (must be in H).
%       y - A string representing the second element of the operation (must be in H).
%
%   Output:
%       result - A cell array corresponding to the result of the hyperoperation 
%                between x and y as defined in M.
%
%   Example usage:
%       H = {'a', 'b', 'c'};
%       M = {
%           {'a'}, {'a','b'}, {'c'};
%           {'b'}, {'c'},     {'a'};
%           {'c'}, {'a'},     {'b'}
%       };
%       result = hyperoperation(H, M, 'a', 'b');  % Returns {'a','b'}
%
%   Notes:
%       This function assumes the elements x and y are valid members of H.
%       An error is raised if either is not found.

    % Find indices of x and y in H
    i = find(strcmp(H, x));
    j = find(strcmp(H, y));

    % Verify elements exist in H
    if isempty(i) || isempty(j)
        error('Input elements not found in H');
    end

    % Return result from M
    result = M{i, j};
end
