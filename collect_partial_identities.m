function result = collect_partial_identities(H, M)
% COLLECT_PARTIAL_IDENTITIES - Checks for partial identities
% in a hyperoperation table

%% Input Validation
if ~iscell(H) || ~iscell(M)
    error('Both inputs must be cell arrays');
end
n = length(H);
if size(M,1) ~= n || size(M,2) ~= n
    error('M must be a square matrix matching size of H');
end

%% Build target cell arrays
% For each (i,j), we need H{j} for row membership test
Hcol = repmat(H(:)', n, 1);  % rows repeated, columns vary

% For each (i,j), we need H{i} for column membership test
Hrow = repmat(H(:), 1, n);   % columns repeated, rows vary

%% Membership checks (vectorized)
inRow = cellfun(@(c,x) ismember(x,c), M, Hcol); % H{j} in M{i,j}
inCol = cellfun(@(c,x) ismember(x,c), M, Hrow); % H{i} in M{j,i}

%% Combine conditions: partial identity = true if ANY j passes
anyMatch = any(inRow | inCol.', 2); % logical column vector

%% Convert to cell array of logicals (to match your format)
result = num2cell(anyMatch);
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
%! assert(isequal(collect_partial_identities(H, M1), expected));
