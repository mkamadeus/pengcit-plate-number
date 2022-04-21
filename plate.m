img = imread("images/plates/sample01.jpg");
imggray = rgb2gray(img);
img = imbinarize(imggray);

img = bwareaopen(img, 500);
[h, w] = size(img);

waitfor(imshow(img, []));

Iprops = regionprops(img,'BoundingBox', 'Area', 'Image');
disp(numel(Iprops));

noPlate=[];
for i=1:numel(Iprops)
    ow = length(Iprops(i).Image(1,:));
    oh = length(Iprops(i).Image(:,1));
    
    if ow<(h/2) && oh>(h/3)
        lmao = imshow(Iprops(i).Image);
        waitfor(lmao);
        letter = letter_matching(Iprops(i).Image);
        noPlate = [noPlate letter];
    end
end

disp(noPlate);