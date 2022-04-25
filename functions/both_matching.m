function [letter] = both_matching(bbox)
    [c1, s1] = letter_matching(bbox);
    [c2, s2] = number_matching(bbox);
    if s1 < s2
        letter = c1;
    else
        letter = c2;
    end
end

