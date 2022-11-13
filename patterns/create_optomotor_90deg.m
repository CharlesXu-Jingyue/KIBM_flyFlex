width = 256;
height = 256;

startangle=180; %change to 270 for regressive optomotor
startpixel=round(startangle*256/360);

stripe_width=90;
stripe_angle=round(stripe_width*256/360);

A=zeros(width,height);

basename = 'stripe_';

for i = 1:stripe_angle+1
    img = mat2gray(A);
    imwrite(img, [basename, num2str(i), '.bmp']);
    A(:,startpixel+i)=1; %change to startpixel-i for regressive optomotor
end

