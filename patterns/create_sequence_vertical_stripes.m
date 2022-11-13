width = 256;
height = 256;
stripe_width = 8;

A = repmat([zeros(1,stripe_width), ones(1,stripe_width)], height, width/(2*stripe_width));

basename = 'stripe_';

for i = 1:(2*stripe_width-1)
    img = mat2gray(A);
    imwrite(img, [basename, num2str(i), '.bmp']);
    A = circshift(A, [0 1]);
end
    
    
