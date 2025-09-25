function result = transitive_closure(H, Relation)
    z = from_relation_to_zero_one_matrix(H, Relation);
    n = length(H);
    result = z;               
    for k = 1:n
        result = result | (result(:,k) & result(k,:));
    end
    
    result = double(result);     
end

%% Test section
%!test
%! H = {'a','b','c','d'};
%! Relation = { {'a','b'}, {'b','c'}, {'c','d'} };
%! expected = [
%!     0 1 1 1;
%!     0 0 1 1;
%!     0 0 0 1;
%!     0 0 0 0
%! ];
%! assert(isequal(transitive_closure(H, Relation), expected));
%! 
%! % Test with a cycle
%! H2 = {'x','y','z'};
%! Relation2 = { {'x','y'}, {'y','z'}, {'z','x'} };
%! T2 = transitive_closure(H2, Relation2);
%! expected2 = [
%!     1 1 1;
%!     1 1 1;
%!     1 1 1
%! ];
%! assert(isequal(T2, expected2));