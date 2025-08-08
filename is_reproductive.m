function result = is_reproductive(H, M)
% IS_REPRODUCTIVE Checks the reproductivity property of a hyperoperation
%
%   Tests if the hyperoperation 
%   defined by set H and operation table M satisfies the reproductivity condition:
%       For every element a in H, a * H = H * a = H.
%
%   Inputs:
%       H - 1×n cell array of element labels, e.g. {'a','b','c'}
%       M - n×n cell array representing the hyperoperation table
%
%   Output:
%       result - Return true if reproductivity holds for all elements; false otherwise.
%                Prints diagnostic messages on failure.
%
%
%   Example usage:
%       H = {'a', 'b', 'c'};
%       M = {
%           {'a','b','c'}, {'a'}, {'b'};
%           {'a'}, {'b','c'}, {'c'};
%           {'a'}, {'b'}, {'c'}
%       };
%       result = is_reproductive(H, M);
%
for a = H
        aH = set_operation(H, M, a, H);  % aH
        Ha = set_operation(H, M, H, a);  % Ha

        if isequal(aH, Ha,H)
            continue;  % passes test
        else
            fprintf('Reproductivity fails for element: %s\n', a{1});
            fprintf('%sH = {%s}\n', a{1},strjoin(aH, ', '));
            fprintf('H%s = {%s}\n', a{1},strjoin(Ha, ', '));
            fprintf('H     = {%s}\n', strjoin(H, ', '));
            result = false;
            return;
        end
    end
    result = true;
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
%! assert(~is_reproductive(H,M1));
%! H = {'a', 'b', 'c'};
%! M = {                               
%!      {'a'},         {'a', 'b'},    {'a', 'c'};
%!      {'a', 'b'},    {'b'},         {'b', 'c'};
%!      {'a','b','c'}, {'a','b','c'}, {'c'} 
%!      };
%! assert(is_reproductive(H,M));
