width = 256;
box_size = 8;

A = checkerboard(8, width/(box_size*2));

imwrite((A > 0.5), 'check.bmp');
    
    
