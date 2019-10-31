Points = [0 0 2 2 0 0 2 2; 0 0 0 0 2 2 2 2; 0 2 2 0 0 2 2 0]; %Points of a shape (CUBE)

%Transform this figure by using a Rotation Matrix
%Making rotation matrix using a class
RMatrix1 = RotationMatrix(40,0,40);
Transformation = RMatrix1.doATransformation(1,1,1,Points);

%Now we want to plot it 
axis([-10 10 -10 10 -10 10]); %Set-up axis
grid on
xlabel('X')
ylabel('Y')
zlabel('Z')

%Actual Show
patch(Points(1,:),Points(2,:),Points(3,:),'red'); %Original Points
hold on;
patch(Transformation(1,:),Transformation(2,:),Transformation(3,:),'yellow'); %Plot  Final Transformation
%% Work on method to decompose
OPoints = Points;
MPoints = Transformation;

%Get three points of these
    P(:,1) = OPoints(:,1);
    P(:,2) = OPoints(:,2);
    P(:,3) = OPoints(:,3);
    
    %Get three of the 'new' points
    Q(:,1) = MPoints(:,1);
    Q(:,2) = MPoints(:,2);
    Q(:,3) = MPoints(:,3);
    
    
    %Find the centroid of the two Sets
    cP = [mean(OPoints(1,:)); mean(OPoints(2,:)); mean(OPoints(3,:))]; %Centroid of P
    cQ = [mean(MPoints(1,:)); mean(MPoints(2,:)); mean(MPoints(3,:))]; %Centroid of Q
     
    %Subtract these means to the original data sets to move the centroid to
    %the origin
    P = DisplaceMatrix(-cP(1),-cP(2),-cP(3),P);
    Q = DisplaceMatrix(-cQ(1), -cQ(2), -cQ(3),Q);

    patch(P(1,:),P(2,:),P(3,:),'green'); %Original Points to origin 
    patch(Q(1,:),Q(2,:),Q(3,:),'blue'); %Original Points to origin 
    
    %Now that they are in the same place, find Rotation
    %Solve for the rotation using both methods 
    H = P * transpose(Q); % Single Value Decomposition Method
    [U,S,V] = svd(H);
    RMatrix = V * transpose(U);
    
    RMatrix2 =Q * P^-1; %Inverse of Points method
    
    disp(RMatrix1.fRotation);
    disp(RMatrix);
    disp(RMatrix2);
   
    
    %%Now we need to solve for T
    T = Transformation - (RMatrix2 * Points);
    T2 =  Transformation - (RMatrix * Points);
    
    disp(T);
    
    Check = (RMatrix2 * Points) + T; % Should be equal to Transformation
    
    disp(Check)
    disp(Transformation)
    