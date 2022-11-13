width = 256;
height = 256;
angle=[7 14 28 35];
stripe_width = round(angle*256/360);
A=[];
dim=[];
counter=1;
increment=1;
basename='stripe';
dim2=[]
for i=1:length(stripe_width)
    for j=1:round(width/stripe_width(i))+1
        if increment==round(256/stripe_width(i))+1
            if dim(2)<256
                A=[A zeros(height,width-dim(2))];
            elseif dim(2)>256
                A=A(:,(1:width));
            end
            disp('creating img')
            for k = 1:(2*stripe_width(i))
                %%%% Alternate uncommenting lines of code separated as
                %%%% follows with the %% to switch between LB2F image
                %%%% generation and RF2B image generation.
                
                %
                %temp=A(:,1:width/2); %LB2F
                %A(:,1:width/2)=1;
                %
                
                %
                temp=A(:,width/2+1:end); %RF2B
                A(:,width/2+1:end)=1;
                %
 
                img = mat2gray(A);
                imwrite(img, [basename, num2str(angle(i)), '_', num2str(2*stripe_width(i)-k+1), '.bmp']);
                
                %
                %A(:,1:width/2)=temp; %LB2F
                %
                
                %
                A(:,width/2+1:end)=temp; %RF2B
                %
                
                %
                %A = circshift(A, [0 1]); %LB2F
                %
                
                %
                A(:,1:200)=circshift(A(:,1:200), [0,1]); %RF2B
                %
            end
            counter=1;
            increment=1;
            A=[];
            break
        end
        if counter>0
            A=[A zeros(height,stripe_width(i))];
            dim=size(A);
        elseif counter<0
            A=[A ones(height,stripe_width(i))];
            dim=size(A);
        end
        if i==1
            disp(dim)
        end
        disp(increment)
        counter=counter*(-1);
        increment=increment+1;
    end
end
