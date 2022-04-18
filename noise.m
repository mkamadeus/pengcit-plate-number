img = truecolorload("./images/boat.bmp");
img = img(:, :, 1);

subplot(3,2,1);
imshow(img, []);title("original");

subplot(3,2,2);
[fimg, shiftedfimg] = spatial2freq(img);
imagesc(100*shiftedfimg);colormap(gray);title("og spectrum");

subplot(3,2,3);
noised = makeperiodicnoise(img, 1/10, 1/10);
imshow(noised, []);title("noised og");

subplot(3,2,4);
[fnoised, shiftedfnoised] = spatial2freq(noised);
s = size(shiftedfnoised);
imagesc(shiftedfnoised);colormap(gray);title("og spectrum");
axis on
xticks([0:8:s(1)])
yticks([0:8:s(2)])

subplot(3,2,5);
noisedfixed = fixperiodicnoise(noised, {0:250 256:272}, {0:250 256:272});
imshow(noisedfixed, []);title("fixed noised");

subplot(3,2,6);
[fnoisedfixed, shiftedfnoisedfixed] = spatial2freq(noisedfixed);
s = size(shiftedfnoisedfixed);
imagesc(shiftedfnoisedfixed);title("fixed noised og spectrum");
axis on
xticks([0:8:s(1)])
yticks([0:8:s(2)])