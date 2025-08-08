function result = heart_hv(H, M)
    fg = fundamental_group(H,M);
    identities =collect_identities(H,M);

    for k=1:length(identities)
        if identities{k}
            result = get_beta_class(H,M,H{k});
            break;
        end
    end
end
