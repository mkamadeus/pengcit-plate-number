% alphabets
alphabets = cell(1,26);
for i=1:26
	img = imread(strcat("images/mask/", char(65+i-1), ".bmp"));
	alphabets{i} = img;
end

% numbers
numbers = cell(1,10);
for i=1:10
	img = imread(strcat("images/mask/", char(48+i-1), ".bmp"));
	numbers{i} = img;
end

disp(alphabets);
disp(numbers);