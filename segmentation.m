I = truecolorload('images\plates\IMG-20180108-WA0043.jpg');
% I = truecolorload('images\plates\IMG-20180108-WA0095.jpg');
g = rgb2gray(I);
MIN_AR = 3;
MAX_AR = 4.25;
DARKPLATE = true;
KEEP = 10;

candidates = find_plate_candidates(g, KEEP, DARKPLATE);

figure; imshow(I);
hold on
for k = 1:length(candidates)
    boundary = candidates{k};
    plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 3)
end
hold off

F = getframe;
annotated = frame2im(F);
figure; imshow(annotated);

[roi, bounds, lisencePlate] = locate_plate(g, candidates, MIN_AR, MAX_AR);

figure; imshow(lisencePlate);