width = 3200;
height = 1280;
side = 80;

A = randi(2, height/side, width/side);
A = A-1;

A = reshape(repmat(reshape(A',1,[]),side,1),[],size(A,1))';
A = A';
A = reshape(repmat(reshape(A',1,[]),side,1),[],size(A,1))';
A = A';

img = mat2gray(A);
imwrite(img, 'random_squares.jpg');    
    