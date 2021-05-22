%Plotting sentences
figure
textscatter(vec2d,u)
title("Word trajectory");
hold on
% Plot the sentences
for p = 1:4
  
    pth_sentence = document(p);

    % pth_sentence.parsed contains pointers to the words that are in the
    % sentence and are in the vocab.  But it's a pointer into test.  We need to
    % convert it into a pointer into u.  This is a bit tedious so I wrote a
    % function to convert it
    word_list = convertpointers(pth_sentence.parsed, ptr_in_glove, iu);


    line(vec2d(word_list,1),vec2d(word_list,2))

end