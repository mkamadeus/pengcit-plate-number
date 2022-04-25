function [letter, corr] = number_matching(bbox)
    [~, number_templates] = read_mask("\images\chars\");
    bbox = imresize(bbox, [42 24]);
    cors1 = zeros(1,10);

    % alphabet matching
    for n=1:10
        score = immse(uint8(bbox), uint8(number_templates{1, n}));
        cors1(n) = score;
    end

    [~, number_templates] = read_mask("\images\mask\");
    cors2 = zeros(1, 10);
    % alphabet matching
    for n=1:10
        score = immse(uint8(bbox), uint8(number_templates{1, n}));
        cors2(n) = score;

    end

    % find best match
    cors = cors1 + cors2;
    best_match = find(cors == min(cors));
    corr = min(cors);
    letter = char(48+best_match-1);
end