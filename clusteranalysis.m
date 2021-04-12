vec = word2vec(emb,test_reduced);
cidx = kmeans(vec,25,'dist','sqeuclidean');
figure
textscatter(xy,test_reduced,'ColorData',categorical(cidx));
title("Word Embedding t-SNE Plot");