img = imread("images/plates/sample01.jpg");

regions = plate_detection(img);
result = plate_vision(regions);

disp(result);
