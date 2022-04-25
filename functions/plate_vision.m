function [result] = plate_vision(plate_numbers)
    result = [];
    for i = 1:numel(plate_numbers)
        plate_number = plate_numbers{1, i};
        waitfor(imshow(plate_number));
        if i >= 3 && i <= 6
            [p, ~] = number_matching(plate_number);
            result = [result p];
        else
            [p, ~] = letter_matching(plate_number);
            disp(result);
            disp(p);
            result = [result p];
        end
        disp(class(result));
        
    end
    disp(result);
end

