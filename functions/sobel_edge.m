function edge = sobel_edge(gray, c)
    edgeX = conv2(gray, sobel_mask(c, 'x'), "same");
    edgeY = conv2(gray, sobel_mask(c, 'y'), "same");
    edge = uint8(sqrt(edgeX .^ 2 + edgeY .^ 2));
end

