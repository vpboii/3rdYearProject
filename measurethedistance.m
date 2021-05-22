% Measure distances between pairs of sentences

for p =1:length(document)
    pth_sentence = document(p);
    wordlist_p = convertpointers(pth_sentence.parsed, ptr_in_glove, iu);
    for q = 1:length(document)
        qth_sentence = document(q);
        wordlist_q = convertpointers(qth_sentence.parsed, ptr_in_glove, iu);
        D(p,q) = sentencedist(vec2d(wordlist_p,:),vec2d(wordlist_q,:));
    end
end