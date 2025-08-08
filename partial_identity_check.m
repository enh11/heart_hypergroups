function result = partial_identity_check(H, M)
% PARTIAL_IDENTITY_CHECK - Checks for partial identities in
% a hyperoperation table
%
% Inputs:
% H - Cell array of element names (e.g., {'a','b','c'})
% M - Hyperoperation table (cell array of cell arrays)
%
% Output:
% results - Table showing partial identity status for each element
%% Input Validation
if ~iscell(H) || ~iscell(M)
    error('Both inputs must be cell arrays');
end
if size(M,1) ~= size(M,2) || size(M,1) ~= length(H)
    error('M must be a square matrix matching size of H');
end
%% Initialize Results Table
result = repmat({false}, length(H), 1);%% Check Each Element
for i = 1:length(H)
    % Check left identity condition: exists x, x in e*x
    for j = 1:length(H)
        if ismember(H{j}, M{i,j}) || ismember(H{j}, M{j,i})
        result{i} = true;
        else 
        result{i} = false;
        end
    end
end
end

%!test
%! % Example: 'a' acts as a partial identity in this table
%! H = {'a', 'b', 'c', 'd'};
%! M1 = {
%!          {'a'}, {'a', 'b'}, {'a', 'c'}, {'a', 'd'};
%!          {'a'}, {'a', 'b'}, {'a', 'c'}, {'a', 'd'};
%!          {'a'}, {'b'},      {'c'},      {'d'};
%!          {'a'}, {'b'},      {'c'},      {'d'}
%!      };
%! assert(is_associative(H,M1));
%! assert(~is_reproductive(H,M1));
%! expected = {true; true; true; true};
%! assert(isequal(partial_identity_check(H, M1), expected));
