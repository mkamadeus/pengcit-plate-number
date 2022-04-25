function [letters] = plate_detection(plate_img)
    % binarize image
    imggray = rgb2gray(plate_img);
    img = imbinarize(imggray);
    
    % close small areas/pixels
    img = bwareaopen(img, 50);
    waitfor(imshow(img, []));
    
    % get image regions and get their properties
    regions = regionprops(img, 'BoundingBox', 'Area', 'Image');
    
    % instantiate cell array
    letters = {};
    count = 1;
    
    [h, ~] = size(img);
    % for each region got,
    for i=1:numel(regions)
        % get width & height
        object_w = length(regions(i).Image(1,:));
        object_h = length(regions(i).Image(:,1));
           
        % if region dimension is suited to be a number in plate (approx)
        if object_w < (h/2) && object_h >(h/3)
            % get region image, store image
            letter = regions(i).Image;
            letters{count} = letter;
            count = count + 1;
        end
    end
end

