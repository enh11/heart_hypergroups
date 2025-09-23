function result = collect_identities(H, M)
    %% Input Validation
    if ~iscell(H) || ~iscell(M)
        error('Both inputs must be cell arrays');
    end
    if size(M,1) ~= size(M,2) || size(M,1) ~= length(H)
        error('M must be a square matrix matching size of H');
    end

    n = length(H);
    % Precompute a cell array of "targets" for row and column membership
    Hcol = repmat(H(:)', n, 1); % replicate H horizontally
    Hrow = repmat(H(:), 1, n);  % replicate H vertically

    % Membership tests across all cells at once:
    inRow  = cellfun(@(c,x) any(ismember(x,c)), M, Hcol); % H{j} in M{e,j}
    inCol  = cellfun(@(c,x) any(ismember(x,c)), M, Hrow); % H{j} in M{j,e}

    % We need: for each e, all j pass both tests
    both = inRow & inCol.';
    % each row e must be all true across j
    result = num2cell(all(both,2));
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
