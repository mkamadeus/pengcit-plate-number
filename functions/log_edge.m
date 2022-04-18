function edge = log_edge(gray, size, std)
    edge = uint8(conv2(gray, log_mask(size, std), "same"));
end

