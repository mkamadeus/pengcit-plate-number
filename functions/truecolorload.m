function [I, originalMode] = truecolorload(filename)
    %IMG2TRUECOLOR Summary of this function goes here
    %   Detailed explanation goes here

    [I, map] = imread(filename);

    % Convert [0 1] to [0 255] if necessary
%     if ~isinteger(I) && max(I) <= 1
%         I = I * 255;
%     end

    % Is truecolor
    if size(I, 3) == 3
        originalMode = 'color';
        return
    end

    % Is indexed
    if ~isempty(map)
        I = ind2rgb(I, map);
        originalMode = 'color';

         % Convert [0 1] to [0 255] if necessary
        if ~isinteger(I) && max(I(:)) <= 1
            I = cast(I * 255, 'uint8');
        end

        return
    end

    % Is grayscale
    originalMode = 'grayscale';
    I(:,:,2) = I(:,:,1);
    I(:,:,3) = I(:,:,1);
end