% Break here
cidx = kmeans(vec,25,'dist','sqeuclidean');
figure
textscatter(xy,test_reduced,'ColorData',categorical(cidx));
title("Word Embedding t-SNE Plot");
handl = textscatter(xy,test_reduced,'ColorData',categorical(cidx));
hold
plot([xy(:,1), xy(:,1)],[xy(:,2), xy(:,2)],'-b');