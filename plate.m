img = imread("images\plates\sample01.jpg");

[regions, bboxes] = plate_detection(img);
result = plate_vision(regions);

disp(result);
