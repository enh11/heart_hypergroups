function result = collect_identities(H, M)
%% Input Validation
if ~iscell(H) || ~iscell(M)
    error('Both inputs must be cell arrays');
end
if size(M,1) ~= size(M,2) || size(M,1) ~= length(H)
    error('M must be a square matrix matching size of H');
end
%% Initialize Results Table
result = repmat({true}, length(H), 1);%% Check Each Element
for e = 1:length(H)
    % Check left identity condition: exists x, x in e*x
    for j = 1:length(H)
        if ~(ismember(H{j}, M{e,j}) && ismember(H{j}, M{j,e}))
        result{e} = false;
        break;
    end
end
end

%!test
%! % Example: 'a' acts as a partial identity in this table
%! H= {'a','b','c','d'};
%! M = {
%!        {'a','b','c','d'},{'b','c'},{'a','d'},{'a','b','c'};
%!        {'b','c'},{'a','d'},{'a','b','c'},{'a','b','c','d'};
%!        {'a','d'},{'a','b','c'},{'a','b','c','d'},{'b','c'};
%!        {'a','b','c'},{'a','b','c','d'},{'b','c'},{'a','d'}
%!    };
%! expected = {false; false; false; true};
%! assert(isequal(collect_identities(H, M), expected));
