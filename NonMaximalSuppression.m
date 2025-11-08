%Nancy Bun
%ID 40247647

function newMagnitudeImage = NonMaximalSuppression(magnitude, orientation)
    [rows, cols] = size(magnitude);
    newMagnitudeImage = zeros(rows, cols);
    orientation = orientation*(180.0/pi);
    orientation(orientation<0) = orientation(orientation<0)+180;

    horMag = (orientation>=0 & orientation<22.5)|(orientation>=157.5 & orientation<=180);
    temporaryMatrix = zeros(rows, cols);
    temporaryMatrix(:, 2:cols) = magnitude(:, 1:cols-1);
    comp1 = horMag & (magnitude>temporaryMatrix);
    temporaryMatrix(:, 1:cols-1) = magnitude(:, 2:cols);
    comp2 = horMag & (magnitude > temporaryMatrix);
    newMagnitudeImage = newMagnitudeImage+magnitude .* (comp1 & comp2);

    deg45Mag = (orientation>=22.5 & orientation<67.5);
    temporaryMatrix(2:rows, 2:cols) = magnitude(1:rows-1, 1:cols-1);
    comp1 = deg45Mag & (magnitude>temporaryMatrix); 
    temporaryMatrix(1:rows-1, 1:cols-1) = magnitude(2:rows, 2:cols);
    comp2 = deg45Mag & (magnitude>temporaryMatrix);
    newMagnitudeImage = newMagnitudeImage+magnitude .* (comp1 & comp2);

    deg90Mag = (orientation>=67.5 & orientation<112.5);
    temporaryMatrix(1:rows-1, :) = magnitude(2:rows, :); 
    comp1 = deg90Mag & (magnitude>temporaryMatrix);
    temporaryMatrix(2:rows, :) = magnitude(1:rows-1, :); 
    comp2 = deg90Mag & (magnitude>temporaryMatrix);
    newMagnitudeImage = newMagnitudeImage+magnitude .* (comp1 & comp2);

    deg135Mag = (orientation>=112.5 & orientation<157.5);
    temporaryMatrix(2:rows, 1:cols-1) = magnitude(1:rows-1, 2:cols);
    comp1 = deg135Mag & (magnitude>temporaryMatrix);
    temporaryMatrix(1:rows-1, 2:cols) = magnitude(2:rows, 1:cols-1);
    comp2 = deg135Mag & (magnitude>temporaryMatrix);
    newMagnitudeImage = newMagnitudeImage+magnitude .* (comp1 & comp2);
end