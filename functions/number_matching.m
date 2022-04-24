function [letter, corr] = number_matching(bbox)
    [~, number_templates] = read_mask();
    bbox = imresize(bbox, [42 24]);
    cors = zeros(10);

    % alphabet matching
    for n=1:10
        [score, ~, ~] = bfscore(logical(bbox), number_templates{1,n});
        cors(n) = score;
    end

    % find best match
    best_match = find(cors == max(cors));
    corr = max(cors);
    letter = char(48+best_match-1);
end