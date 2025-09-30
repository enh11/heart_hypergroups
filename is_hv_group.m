function result = is_hv_group(H, M)
    result = is_reproductive(H,M) && is_weak_associative(H,M);
end
%!test
%! H3 = {'a','b','c'};
%! M3 = {  
%!      {'a'}, {'a', 'b'}, {'a', 'c'};
%!      {'a','b'}, {'b'}, {'b', 'c'};
%!      {'a','b','c'}, {'a', 'b','c'}, {'c'};
%!      };
%! assert(is_hv_group(H3, M3));