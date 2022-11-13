width = 256;
height = 256;

center_mat = zeros(height, width);

%stripe_width = 20;  %28 degrees
stripe_width = 10;  %14 degrees

center_mat(:, width/2 - stripe_width/2 + 1 : width/2 + stripe_width/2 ) = 1;

img = mat2gray(center_mat);

%imwrite(img, 'center_bright_stripe_28.bmp');
imwrite(img, 'center_bright_stripe_14.bmp');