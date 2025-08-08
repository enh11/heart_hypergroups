function show_partial_identities(H, M)
    %% Display Results
    combined_status = partial_identity_check(H,M);
table_print = [ ...
    {'Element', 'Status'}; ...
    [H(:), combined_status] ...
];
disp('Partial Identity Analysis:');
%
% Display the results manually
% Header
fprintf('%-10s | %-7s |\n', 'Element', 'Partial Identity');
fprintf('%s\n', repmat('-', 1, 32)); % Divider line
%
% Rows
    for i = 2:size(table_print,1)
        fprintf('%-10s | %-6s\n', ...
            table_print{i,1}, ...
            mat2str(table_print{i,2}));
    end

end
