function images(myaxes,file)
    back = imread(file);
    axes(myaxes);
    imshow(back);


end 