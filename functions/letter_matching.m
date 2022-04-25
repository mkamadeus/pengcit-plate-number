function [letter, corr] = letter_matching(bbox)
    [alphabet_templates, ~] = read_mask();
    bbox = imresize(bbox, [42 24]);
    cors = zeros(1, 26);
    
    % alphabet matching
    for n=1:26
        disp(size(bbox));
        disp(size(alphabet_templates{1,n}));
        [score, ~, ~] = bfscore(logical(bbox), alphabet_templates{1,n});
        cors(n) = score;

    end

    % find best match
    best_match = find(cors == max(cors));
    
    disp(cors);

    corr = max(cors);
    letter = char(65+best_match-1);
end