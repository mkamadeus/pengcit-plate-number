function boundaries = find_plate_candidates(g, keep, darkplate)
    % TOPHAT MORPH
    rectKern = strel("rectangle", [5 13]);
    if darkplate
        hat = imtophat(g, rectKern);
    else
        hat = imbothat(g, rectKern);
    end
%     imshow(hat); title TopHat;
    
    % GET MASK
    squareKern = strel("rectangle", [3 3]);
    mask = imclose(g, squareKern);
    mask = imbinarize(mask);
    if darkplate
        mask = ~mask;
    end
%     imshow(mask); title Mask;
    
    % SCHARR GRADIENT
    scharr_kern=[-3 0 3; -10 0 10; -3 0 3];
    gradX = conv2(hat, scharr_kern, "same");
    gradX = abs(gradX);
    minVal = min(gradX, [], 'all');
    maxVal = max(gradX, [], 'all');
    % Doesn't work, dunno why
    % gradX = normalize(gradX, 'range');
    gradX = 1 .* ((gradX - minVal) ./ (maxVal - minVal));
%     imshow(gradX); title Scharr;
    
    % BLURRING
    % Python sigma calculation
    ksize = [9 25];
    sigmaX = 0.3*((ksize(1)-1)*0.5 - 1) + 0.8;
    sigmaY = 0.3*((ksize(2)-1)*0.5 - 1) + 0.8;
    gradX = imgaussfilt(gradX, [sigmaX sigmaY], "FilterSize", ksize);
    gradX = imclose(gradX, rectKern);
%     imshow(gradX); title Blurred;
    
    % THRESHOLDING
    thresh = imbinarize(gradX);
%     imshow(thresh); title GradThresh;
    
    % ERODE/DILATE
    thresh = imerode(thresh, squareKern);
    thresh = imerode(thresh, squareKern);
    thresh = imdilate(thresh, squareKern);
    thresh = imdilate(thresh, squareKern);
%     imshow(thresh); title GradErodeDilate;
    
    % MASK
    thresh = mask & thresh;
    thresh = imdilate(thresh, squareKern);
    thresh = imdilate(thresh, squareKern);
    thresh = imerode(thresh, squareKern);
%     imshow(thresh); title Final;
    
    [B,L] = bwboundaries(thresh,'noholes');
    areas = zeros(length(B), 1);
    % SORT
    for k = 1:length(B)
       boundary = B{k};
       areas(k) = polyarea(boundary(:, 2), boundary(:, 1));
    end
    [~, idx] = sort(areas, 'descend');
    B = B(idx);
    
    B = B(1:keep);
    
    % DRAW
    % imshow(label2rgb(L, @jet, [.5 .5 .5]))
%     imshow(labeloverlay(I, L));
%     hold on
%     for k = 1:length(B)
%        boundary = B{k};
%        plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
%     end
%     hold off

    boundaries = B;
end

