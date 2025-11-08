%PART 2
i_pepper = imread('peppers.png');
%q1:
image1 = i_pepper(end:-1:1, :, :);
%q2:
grayscale = mean(i_pepper, 3);
image2 = uint8(grayscale); 
%q3:
image3(:,:,1) = i_pepper(:,:,3);
image3(:,:,3) = i_pepper(:,:,1); 
%q4:
[rows, cols]=size(image2);
image4 = zeros(cols, rows, 'uint8');
for i = 1:rows
    for j = 1:cols
        rotated_rows = cols-j+1;
        rotated_cols = i;
        image4(rotated_rows, rotated_cols) = i_pepper(i,j);
    end
end
%q5) A:
matrix1 = reshape(1:144, [12, 12]); %from q1 part 1
new_matrix = zeros(12,12,3);
new_matrix(1:144) = matrix1;
matrixA = reshape(new_matrix, [144,3]);
%q5) B:
matrixB = reshape(matrixA, [12,12,3]);

