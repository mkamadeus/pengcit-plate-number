function [letter, corr] = letter_matching(bbox)
    [alphabet_templates, ~] = read_mask("\images\chars\");
    bbox = imresize(bbox, [42 24]);

    cors1 = zeros(1, 26);
    % alphabet matching
    for n=1:26
        score = immse(uint8(bbox), uint8(alphabet_templates{1, n}));
        cors1(n) = score;

    end

    [alphabet_templates, ~] = read_mask("\images\mask\");
    cors2 = zeros(1, 26);
    % alphabet matching
    for n=1:26
        score = immse(uint8(bbox), uint8(alphabet_templates{1, n}));
        cors2(n) = score;

    end

    % find best match
    cors = cors1 + cors2;
    best_match = find(cors == min(cors));
    corr = min(cors);
    letter = char(65+best_match-1);
end