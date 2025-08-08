function result = is_hypergroup(H, M)
    result = is_reproductive(H,M) && is_associative(H,M);
end
