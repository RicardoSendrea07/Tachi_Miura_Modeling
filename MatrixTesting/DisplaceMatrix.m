function [DisplaceMatrix] = DisplaceMatrix(xDis, yDis, zDis, aPoints)   
        %Return Displacement matrix, by addding correspoding values
        
        DisplaceMatrix(1,:) = aPoints(1,:)+xDis; %Adding to X
        DisplaceMatrix(2,:) = aPoints(2,:)+yDis; %to Y
        DisplaceMatrix(3,:) = aPoints(3,:)+zDis; %to Z    
   
end