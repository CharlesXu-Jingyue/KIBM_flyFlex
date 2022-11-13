width = 256;
height = 256;
angle=[5 11.25 22.5 45];
stripe_width = round(angle*256/360);
disp(stripe_width(1))
A=[];
counter=1;
increment=1;
for i=1:length(stripe_width)
    for j=1:round(256/stripe_width(i))+1
        if increment==round(256/stripe_width(i))+1
            disp('creating img')
            img=mat2gray(A);
            imwrite(img, ['stripe',num2str(i),'.bmp'])
            counter=1;
            increment=1;
            A=[];
            break
        end
        if counter>0
            A=[A zeros(height,stripe_width(i))];
        elseif counter<0
            A=[A ones(height,stripe_width(i))];
        end
        disp(increment)
        counter=counter*(-1);
        increment=increment+1;
    end
end

disp(counter)
disp(increment)
