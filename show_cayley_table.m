function show_cayley_table(H, M)
    n = length(H);
    col_width = 10;

    % Print top header
    printf('%-*s|', col_width, '');  % top-left corner
    for j = 1:n
        printf('%-*s', col_width, char(H{j}));
    end
    printf('\n');

    % Print separator line
    printf('%s+', repmat('-', 1, col_width));
    for j = 1:n
        printf('%s', repmat('-', 1, col_width));
    end
    printf('\n');

    % Print each row with row label and subsets
    for i = 1:n
        printf('%-*s|', col_width, char(H{i}));
        for j = 1:n
            subset = M{i,j};
            if isempty(subset)
                subset_str = '{}';
            else
                subset = subset(:)';  % ensure row vector
                for k = 1:length(subset)
                    subset{k} = char(subset{k});
                end
                subset_str = ['{' strjoin(subset, ', ') '}'];
            end
            printf('%-*s', col_width, subset_str);
        end
        printf('\n');
    end
end
