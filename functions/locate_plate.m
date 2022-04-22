function [roi, lpbounds, cropped] = locate_plate(g, candidates, minAR, maxAR)    
    for i = 1:length(candidates)
        c = candidates{i};
    
        minX = min(c(:, 2));
        minY = min(c(:, 1));
        maxX = max(c(:, 2));
        maxY = max(c(:, 1));
        w = maxX - minX;
        h = maxY - minY;
        ar = w / h;
    
        if (ar > minAR && ar < maxAR)
            lpbounds = c;
            cropped = g(minY:maxY, minX:maxX);
            roi = imbinarize(cropped);
%             if DARKPLATE
%                 roi = ~roi;
%             end
    
%             imshow(cropped); title LisencePlate;
%             imshow(roi); title ROI;
            break;
        end
    end
end

