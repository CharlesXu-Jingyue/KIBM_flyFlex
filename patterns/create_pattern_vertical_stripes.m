width = 256;
height = 256;
stripe_width = 8;   %11.25 degrees

A = repmat([zeros(1,stripe_width), ones(1,stripe_width)], height, width/stripe_width);

img = mat2gray(A);
imwrite(img, 'vert_stripe_11.bmp');
    
    
