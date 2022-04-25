function [alphabets, numbers] = read_mask()
    % read alphabets mask
    alphabets = cell(1,26);
    for i=1:26
	    img = imread(strcat(pwd, "\images\chars\", char(65+i-1), ".bmp"));
        img = rgb2gray(img);
	    alphabets{i} = logical(img);
    end
    
    % read numbers mask
    numbers = cell(1,10);
    for i=1:10
	    img = imread(strcat(pwd, "\images\chars\", char(48+i-1), ".bmp"));
	    img = rgb2gray(img);
        numbers{i} = logical(img);
    end
end