function mask = roberts_mask(axis)
    arguments
        axis (1, :) char {mustBeMember(axis, {'x', 'y', '+', '-'})}
    end

    if axis == 'x' || axis == '+'
        mask = [
             1  0;
             0 -1;
        ];
    elseif axis == 'y' || axis == '-'
        mask = [
              0  1;
             -1  0;
        ];
    end
end

