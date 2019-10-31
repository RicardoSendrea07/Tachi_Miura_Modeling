classdef RotationMatrix %Class to make any rotation matrix needed
    properties
        xRotation
        yRotation
        zRotation
        fRotation
        Points
    end
    
    methods 
        function RotationMatrix = RotationMatrix(aThetaX, aThetaY, aThetaZ) %constructor
            %initialize thetas
                thetaX = aThetaX;
                thetaY = aThetaY;
                thetaZ = aThetaZ;
            %make three seperate rotations using thetas
                RotationMatrix.xRotation = [1 0 0; 0 cosd(thetaX) sind(thetaX); 0 -sind(thetaX) cosd(thetaX)];
                RotationMatrix.yRotation = [cosd(thetaY) 0  -sind(thetaY); 0 1 0; sind(thetaY) 0 cosd(thetaY)];
                RotationMatrix.zRotation= [cosd(thetaZ) sind(thetaZ) 0; -sind(thetaZ) cosd(thetaZ) 0; 0 0 1];
            %Final Rotation Matrix    
                RotationMatrix.fRotation = RotationMatrix.xRotation * RotationMatrix.yRotation * RotationMatrix.zRotation;
        end
        
        function [Transformation] = doATransformation(RotationMatrix, xDis, yDis, zDis, aPoints)
            %add points
                  RotationMatrix.Points = aPoints;
            %Rotate these points    
                  Transformation  = RotationMatrix.fRotation * aPoints;
            %Translate these points
                Transformation(1,:) = Transformation(1,:)+xDis; %Adding to X
                Transformation(2,:) = Transformation(2,:)+yDis; %to Y
                Transformation(3,:) = Transformation(3,:)+zDis; %to Z 
        end
        
        
    end  
end
