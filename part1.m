%PART 1
matrix1 = reshape(1:144, [12, 12]); %q1
matrix2 = reshape(1:144, [12, 12])'; %q2
matrix3 = matrix1(2:2:end, 1:2:end); %q3
matrix4 = matrix1>30; %q4
matrix5 = [1 1 1; 2 1 0; 0 1 1]\[9; 3; 5]; %q5

