function [mask] = laplacian_mask()
	mask = [0 1 0; 1 -4 1; 0 1 0];
end