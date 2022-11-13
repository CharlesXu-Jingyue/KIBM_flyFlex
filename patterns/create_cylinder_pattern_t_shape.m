t_pattern_width = 30;   %40 degrees pattern width 
t_pattern_height = 100;  %40 degrees pattern height

sphere_width = 256;
sphere_height = 256;

line_width = 10;    %14 degrees line width
line_height = 35;   %14 degrees line height

%% white T on black background 
t_box = zeros(t_pattern_height, t_pattern_width);
t_box(1 : line_height, : ) = 1; 
t_box(:, t_pattern_width/2 - line_width/2 + 1: t_pattern_width/2 + line_width/2 ) = 1;

%% inverted T shape
inv_t_box = flipud(t_box);

%% place T in center of sphere image
center_t_sphere_mat = zeros(sphere_height, sphere_width);
center_t_sphere_mat(sphere_height/2 - t_pattern_height/2 + 1: sphere_height/2 + t_pattern_height/2, sphere_width/2 - t_pattern_width/2 + 1 : sphere_width/2 + t_pattern_width/2) = t_box;

%% place inverted T in center of sphere image
center_inv_t_sphere_mat = zeros(sphere_height, sphere_width);
center_inv_t_sphere_mat(sphere_height/2 - t_pattern_height/2 + 1: sphere_height/2 + t_pattern_height/2, sphere_width/2 - t_pattern_width/2 + 1 : sphere_width/2 + t_pattern_width/2) = inv_t_box;

%% place T and inverted T 180 degrees apart
two_t_sphere_mat = zeros(sphere_height, sphere_width);
two_t_sphere_mat(sphere_height/2 - t_pattern_height/2 + 1: sphere_height/2 + t_pattern_height/2, sphere_width/4 - t_pattern_width/2 + 1 : sphere_width/4 + t_pattern_width/2) = t_box;
two_t_sphere_mat(sphere_height/2 - t_pattern_height/2 + 1: sphere_height/2 + t_pattern_height/2, 3*sphere_width/4 - t_pattern_width/2 + 1 : 3*sphere_width/4 + t_pattern_width/2) = inv_t_box;

%% write images
imwrite(center_t_sphere_mat, 'center_t.bmp');
imwrite(center_inv_t_sphere_mat, 'center_inv_t.bmp');
imwrite(two_t_sphere_mat, 'two_t.bmp');

