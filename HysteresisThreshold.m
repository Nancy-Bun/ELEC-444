%Nancy Bun
%ID 40247647

function BinaryEdgeImage = HysteresisThreshold(magnitudeImage,minThresh,maxThresh)
    strongEdges = magnitudeImage >= maxThresh;
    weakEdges = (magnitudeImage >= minThresh) & (magnitudeImage < maxThresh);
    [strongRow, strongCol] = find(strongEdges);
    connectedEdges = bwselect(weakEdges, strongCol, strongRow, 8); 
    BinaryEdgeImage = strongEdges | connectedEdges;
end
