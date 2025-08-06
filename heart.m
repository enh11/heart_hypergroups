function result = heart(H, M)
    if ~is_hypergroup(H,M)
        error('H is not an hypergroup! The heart is not defined!')
    end
    partial_id = partial_identity_check(H,M);
    for k=1:length(partial_id)
        if partial_id{k}
            result = get_beta_class(H,M,H{k});
            break;
        end
    end
end
