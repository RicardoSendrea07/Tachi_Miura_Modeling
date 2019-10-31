%%This method applies a transformation on a set of points, given a specific
%%rotation and translation matrix.

function [Transform] = applyTransformation(aRotation, aTranslation, aPoints)
    [Transform] = (aRotation * aPoints);
    [Transform] = DisplaceMatrix(aTranslation(1),aTranslation(2),aTranslation(3), Transform);
end
