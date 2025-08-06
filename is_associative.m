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
%           false otherwise. If associativity fails, the function displays
%           a counterexample.
%
%   Associativity is tested by checking that:
%       (a • b) • c = a • (b • c)
%   for all a, b, c in H.
%
%   Example usage:
%       H = {'a', 'b', 'c'};
%       M = { {'a'}, {'b'}, {'c'}; ... }; % define the hyperoperation
%       result = is_associative(H, M);
%
%   Dependencies:
%       Requires SET_OPERATION function to handle hyperoperation on sets.
    for a = H % this is {'a'} for a in H
        for b = H
            for c = H
                ab_c = set_operation(H, M, 
                    set_operation(H, M, a, b), c);
                a_bc = set_operation(H, M, 
                    a, set_operation(H, M, b, c) );                                
                if ~isequal(ab_c, a_bc)
                    fprintf('Associativity fails at (%s, %s, %s):\n', a{1}, b{1}, c{1});
                    fprintf('  (%s%s)%s = %s\n', a{1}, b{1}, c{1}, (strjoin(ab_c,', ')));
                    fprintf('  %s(%s%s) = %s\n', a{1}, b{1}, c{1}, (strjoin(a_bc,', ')));
                    result = false;
                    return;
                end
            end
        end
    end
    result = true;
    
    %fprintf('True\n')
end
