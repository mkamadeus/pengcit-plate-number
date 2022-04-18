function [mask] = maskgen(mode)
    switch mode
        case "laplacian"
            mask = [0 1 0; 1 -4 1; 0 1 0];
end