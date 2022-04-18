function [edge] = laplacian_edge(gray)
	edge = uint8(conv2(gray, laplacian_mask, "same"));
end