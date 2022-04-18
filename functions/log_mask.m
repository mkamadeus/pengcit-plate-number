function [mask] = log_mask(size, std)
    if(mod(size, 2) == 0)
        error("mask size should be an odd number")
    end

    if(size < 5)
        error("mask size should be at least 5")
    end

    halfsize = int32(floor(size/2));
    [X, Y] = meshgrid(-halfsize:halfsize, -halfsize:halfsize);
    X = double(X); Y = double(Y);
    mask = ((X.^2 + Y.^2 - 2*std^2)./(std^4)) .* exp(-(X.^2 + Y.^2)./(2*std^2));
end