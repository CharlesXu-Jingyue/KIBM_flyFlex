cylinder_width = 256;
cylinder_height = 256;

stripe_width = 8; % ~11 degrees

stripe = zeros(cylinder_height, stripe_width);

B = ones(cylinder_height, cylinder_width);

B(1 : cylinder_height, cylinder_width/4 - stripe_width/2 + 1 : cylinder_width/4 + stripe_width/2) = stripe;
B(1 : cylinder_height, 3*cylinder_width/4 - stripe_width/2 + 1 : 3*cylinder_width/4 + stripe_width/2) = stripe;

imwrite(B, 'two_stripe.bmp');


