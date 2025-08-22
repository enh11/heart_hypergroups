function result = is_hv_group(H, M)
    result = is_reproductive(H,M) && is_weak_associative(H,M);
end
