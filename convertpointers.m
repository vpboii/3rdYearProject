function word_list = convertpointers(parselist, ptr_in_glove, iu);

for n = 1:length(parselist)
    p(n) = find(ptr_in_glove == parselist(n));
end

word_list = iu(p);

