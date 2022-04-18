function edge = roberts_edge(gray)
    edgeX = conv2(gray, roberts_mask('+'), "same");
    edgeY = conv2(gray, roberts_mask('-'), "same");
    edge = uint8(abs(edgeX) + abs(edgeY));
end

