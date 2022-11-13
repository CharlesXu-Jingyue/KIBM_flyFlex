width = 256;
height = 256;
angle=90;
stripe_width = round(width*angle/360);

A=zeros(width,height);

basename = 'stripe_';

for i = 1:stripe_width+1
    img = mat2gray(A);
    imwrite(img, [basename, num2str(i), '.bmp']);
    A = repmat([ones(1,stripe_width-i),zeros(1,i)], height, round(width/stripe_width));
    A=A(:,1:width);
end
