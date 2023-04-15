function eq_table = generate_equations(num_eq, num_range, complexity)
% Generates a table of random arithmetic equations of a given complexity
% and with operands in a specified range
%
% Inputs:
% - num_eq: the number of equations to generate
% - num_range: a 2-element vector specifying the range of possible operands
% - complexity: the complexity of the equations, one of 'easy', 'normal', or
%   'mixed'
%
% Output:
% - eq_table: a table containing the equations, along with a flag indicating
%   whether each equation is correct and a response key

    % Create table to store equations and results
    eq_table = table('Size', [num_eq, 3], 'VariableTypes', {'string', 'double', 'string'}, ...
                     'VariableNames', {'equation', 'correct', 'response'});

    % Define possible operations
    op_list = {'+', '-', '*', '/'};

    % Generate equations
    for i = 1:num_eq
        % Select random operands
        operands = randi(num_range, 1, 3);

        % Randomly select operation(s) for the equation
        if strcmp(complexity, 'easy')
            ops = '+';
        elseif strcmp(complexity, 'normal')
            ops = op_list(randi(4, 1, 2));
        else
            ops = [op_list(randi(4)), '(', op_list(randi(4, 1, 2)), ...
                   op_list(randi(4)), ')'];
        end

        % Assemble equation string
        eq_str = sprintf('%d %s %d %s %d', operands(1), ops, operands(2), ops(2:end), operands(3));

        % Evaluate equation and determine whether it is correct
        try
            result = eval(eq_str);
            is_correct = (result == eval(sprintf('%d %s %d %s %d', operands(1), ops, operands(2), ops(2:end), operands(3))));
        catch
            is_correct = false;
        end

        % Add equation and result to table
        eq_table.equation{i} = eq_str;
        eq_table.correct(i) = is_correct;
        eq_table.response{i} = 'd';
    end

    % Randomly select half of the equations to be correct
    correct_indices = randperm(num_eq, num_eq / 2);
    eq_table.correct(correct_indices) = true;

    % Update response keys
    eq_table.response(eq_table.correct == true) = 'l';
end
