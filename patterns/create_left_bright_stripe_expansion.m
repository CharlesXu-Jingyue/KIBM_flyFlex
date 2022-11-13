width = 256;
height = 256;
A=zeros(width);
basename='stripeexp';

for i = 0:(width/4-1)
    A(:, (width*3/4 - i):(width*3/4+1)+i ) = 1;
    img=mat2gray(A);
    imwrite(img, [basename, '_', num2str(i+1), '.bmp']);
end