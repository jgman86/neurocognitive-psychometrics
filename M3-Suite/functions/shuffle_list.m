function output_struct = shuffle_list(input_struct, field_name)
    % Shuffle the specified field of the input struct such that no element is repeated more than 3 times in a row.
    num_elements = numel(input_struct);
    for i = 1:num_elements
        input_vector = input_struct(i).(field_name);
        shuffled_vector = input_vector;
        num_iterations = 0;
        max_iterations = 10000;
        score = calculate_score(shuffled_vector);
        while score > 0 && num_iterations < max_iterations
            % Shuffle the vector until the score is 0 or the maximum number of iterations is reached.
            idx = randperm(length(input_vector));
            shuffled_vector = shuffled_vector(idx);
            new_score = calculate_score(shuffled_vector);
            if new_score < score
                score = new_score;
                num_iterations = 0;
            else
                num_iterations = num_iterations + 1;
            end
        end
        input_struct(i).(field_name) = shuffled_vector;
    end
    output_struct = input_struct;
end

function score = calculate_score(vector)
    % Calculate the score of the input vector. The score is the number of
    % repeating elements more than 3 times in a row.
    score = 0;
    count = 1;
    prev_elem = vector(1);
    
    for i = 2:length(vector)
        if vector(i) == prev_elem
            count = count + 1;
        else
            count = 1;
            prev_elem = vector(i);
        end
        
        if count > 3
            score = score + 1;
        end
    end
end

