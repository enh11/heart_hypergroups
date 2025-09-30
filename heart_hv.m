function result = heart_hv(H, M)
if ~is_hv_group(H,M)
        error('(H,M) is not a Hv-group. Heart is not defined!');
end
beta  = beta_relation(H,M);
beta_star = transitive_closure(H,beta);
    quotient_set = quotient_set(H,M,beta_star);
    fg = fundamental_group(H,M);
    identities =collect_identities(quotient_set,fg);

    for k=1:length(identities)
        if identities{k}
            result = get_beta_class(H,M,H{k});
            break;
        end
    end
end
