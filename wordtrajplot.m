function phan = wordtrajplot(w_ptrs,w_ptre, xy, LineType)

 for w = w_ptrs:(w_ptre-1)
        phan(w-w_ptrs+1) = plot([xy(w,1), xy(w+1,1)],[xy(w,2), xy(w+1,2)],LineType);
 end 