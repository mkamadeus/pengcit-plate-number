function [result] = plate_vision(plate_numbers)
    result = [];
    short_area_code = false;
    letter_only = false;
    for i = 1:numel(plate_numbers)
        plate_number = plate_numbers{1, i};
        
        p = '';
        if i == 1
            [p, ~] = letter_matching(plate_number);
        elseif i == 2
            p = both_matching(plate_number);
            if contains("0123456789", p)
                short_area_code = true;
            end
        elseif i == 3
            if short_area_code
                p = both_matching(plate_number);
                if contains("0123456789", p)
                else
                    letter_only = true;
                end
            else 
                [p, ~] = number_matching(plate_number);
            end
        elseif i == 4 || i == 5
            if letter_only
                [p, ~] = letter_matching(plate_number);
            else
                p = both_matching(plate_number);
                if contains("0123456789", p)
                else
                    letter_only = true;
                end 
            end
        elseif i == 6
            if letter_only || short_area_code
                [p, ~] = letter_matching(plate_number);
                letter_only = true;
            else
                p = both_matching(plate_number);
                if contains("0123456789", p)
                else
                    letter_only = true;
                end 
            end
        else
            [p, ~] = letter_matching(plate_number);
        end
        result = [result p];
        
    end
%     disp(result);
end

