function results = partial_identity_check(H, M)
% PARTIAL_IDENTITY_CHECK - Checks for partial identities in
% a hyperoperation table
%
% Inputs:
% H - Cell array of element names (e.g., {'a','b','c'})
% M - Hyperoperation table (cell array of cell arrays)
%
% Output:
% results - Table showing partial identity status for each element
%% Input Validation
if ~iscell(H) || ~iscell(M)
    error('Both inputs must be cell arrays');
end
if size(M,1) ~= size(M,2) || size(M,1) ~= length(H)
    error('M must be a square matrix matching size of H');
end
%% Initialize Results Table
left_status = cell(length(H), 1);
right_status = cell(length(H), 1);
combined_status = cell(length(H), 1);
%% Check Each Element
for i = 1:length(H)
    % Check left identity condition: exists x, x in e*x
    for j = 1:length(H)
        if ismember(H{j}, M{i,j})
        left_status{i} = true;
        break;
        end
        left_status{i} = false;
    end
    % Check right identity condition: exists x, x in x*e
    is_right = false;
    for j = 1:length(H)
        if ismember(H{j}, M{j,i})
        right_status{i} = true;
        break;
        end
        right_status{i} = false;
    end
    % Store results
    combined_status{i} = left_status{i}|right_status{i};
end
%% Generate Output Table (as cell array)
results = combined_status;
%% Display Results
table_print = [ ...
    {'Element', 'LeftPI', 'RightPI', 'Status'}; ...
    [H(:), left_status, right_status, results] ...
];
disp('Partial Identity Analysis:');
%
% Display the results manually
% Header
fprintf('%-10s | %-7s | %-8s | %-6s\n', 'Element', 'LeftPI', 'RightPI', 'Status');
fprintf('%s\n', repmat('-', 1, 44)); % Divider line
%
% Rows
    for i = 2:size(table_print,1)
        fprintf('%-10s | %-7s | %-8s | %-6s\n', ...
            table_print{i,1}, ...
            mat2str(table_print{i,2}), ...
            mat2str(table_print{i,3}), ...
            mat2str(table_print{i,4}));
    end
end
