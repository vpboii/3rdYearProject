% Little bit of code to plot a desired email trajectory

% Array of strings that contain the order of colours
colours = ['r','b','g','k'];
    textscatter(xy,test_reduced,'ColorData',categorical(cidx));
    title("Word Embedding t-SNE Plot");
    handl = textscatter(xy,test_reduced,'ColorData',categorical(cidx));
    hold
    
for enum = 1:4
    if (enum == 1)
        w_ptrs = 1;
        w_ptre = ends_ptr2(1);  
    else
        w_ptrs = ends_ptr2(enum-1)+1;
        w_ptre = ends_ptr2(enum);
    end
    cidx = kmeans(vec,25,'dist','sqeuclidean');

    colptr = rem(enum,length(colours))+1;
    LineType = ['-',colours(colptr)];
    
    w_ptrs
    w_ptre
     phan = wordtrajplot(w_ptrs,w_ptre,xy,LineType);
end

