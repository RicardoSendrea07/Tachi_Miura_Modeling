function [RMatrix, T] = findRotationMatrix(OPoints , MPoints)
    %Function solves the problem Y = R*X, where X is original points and Y is the moved points

    %Get three points of these
    P(:,1) = OPoints(:,1);
    P(:,2) = OPoints(:,2);
    P(:,3) = OPoints(:,3);
    
    %Get three of the 'new' points
    Q(:,1) = MPoints(:,1);
    Q(:,2) = MPoints(:,2);
    Q(:,3) = MPoints(:,3);
         
    %Find the centroid of the two Sets
    %cP = [mean(OPoints(1,:)); mean(OPoints(2,:)); mean(OPoints(3,:))]; %Centroid of P
    cP = [mean(P(1,:)); mean(P(2,:)); mean(P(3,:))];
    %cQ = [mean(MPoints(1,:)); mean(MPoints(2,:)); mean(MPoints(3,:))]; %Centroid of Q
    cQ = [mean(Q(1,:)); mean(Q(2,:)); mean(Q(3,:))];
    
    %Subtract these means to the original data sets to move the centroid to the origin
    P = DisplaceMatrix(-cP(1), -cP(2), -cP(3),P);
    Q = DisplaceMatrix(-cQ(1), -cQ(2), -cQ(3),Q);
    
    
    %Now that they are in the same place, find Rotation
    H = P * transpose(Q); % Single Value Decomposition Method
    [U,S,V] = svd(H);
    RMatrix = V * transpose(U);
    
    %%Now we need to solve for T
    %T = Q - (RMatrix * P);
    T = -RMatrix*cP + cQ; 
end