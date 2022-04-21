img = imread("images/plates/sample02.jpg");
imggray = rgb2gray(img);
img = imbinarize(imggray);

img = bwareaopen(img, 5);
[h, w] = size(img);

waitfor(imshow(img, []));

Iprops = regionprops(img,'BoundingBox', 'Area', 'Image');
disp(numel(Iprops));

plate_number=[];
for i=1:numel(Iprops)
    ow = length(Iprops(i).Image(1,:));
    oh = length(Iprops(i).Image(:,1));
    
    if ow<(h/2) && oh>(h/3)
        % waitfor(imshow(Iprops(i).Image));
        letter = letter_matching(Iprops(i).Image);
        plate_number = [plate_number letter];
    end
end

disp(plate_number);