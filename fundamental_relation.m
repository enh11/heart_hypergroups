function result = fundamental_relation(H, M)
   beta = beta_relation(H,M);
   result = transitive_closure(H,beta);
   result = from_matrix_to_relation(H,result);
end
