function letter = letter_matching(bbox)
    [alphabet_templates, number_templates] = read_mask();
    bbox = imresize(bbox, [42 24]);
    cors = [];

    % alphabet matching
    for n=1:26
        cor = corr2(alphabet_templates{1,n}, bbox);
        cors = [cors cor];
    end

    % numbers matching
    for n=1:10
        cor = corr2(number_templates{1,n}, bbox);
        cors = [cors cor];
    end

    % find best match
    best_match = find(cors == max(cors));

    if best_match <= 26
        letter = char(65+best_match-1);
    else
        letter = char(48+best_match-1);
    end
end