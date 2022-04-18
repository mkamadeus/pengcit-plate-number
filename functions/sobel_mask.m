function [mask] = sobel_mask(c, axis)
    arguments
        c (1, 1) {mustBeNumeric, mustBeReal}
        axis (1, :) char {mustBeMember(axis, {'x', 'y'})}
    end

    if axis == 'x'
        mask = [
            -1  0  1;
            -c  0  c;
            -1  0  1;
        ];
    elseif axis == 'y'
        mask = [
             1  c  1;
             0  0  0;
            -1 -c -1;
        ];
    end
end