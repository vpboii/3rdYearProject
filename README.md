# Project
Nowadays, emails and meetings are strongly connected to each other and continue to serve as an essential aspect of modern life. As the annual volume of emails increase, the hours for administrative tasks for employees grow. This research paper studies the problem of email overload associated with email meeting requests by introducing natural language processing techniques, such as GloVe and word2vec. Three experiments are presented. The first experiment investigates how the GloVe algorithm can judge similarity based on the custom dataset and maps the sentences using the t-SNE algorithm. The second experiment involves measuring the Euclidean distance between sentences to compute the similarity between emails. It is expected that the shorter distance suggests a high level of similarity. Moreover, a new methodology for measuring the accuracy of t-SNE mappings was proposed. Based on the test data, the method seems to provide reasonable results. In the third experiment, a sample of emails from the real-world dataset “Enron Corpus” was used to measure the similarity to find similar emails. The emails were printed out and compared.

To summarize, there is a reasonable level of similarity measure between the sentences computed by the GloVe algorithm. However, it is seen that word2vec and GloVe cannot capture similarity based on antonyms and synonyms, they output a high similarity score only if two words have similar context. Additionally, t-SNE provides poor results and proves to be unreliable for measuring text similarity.

## Used:
- [Matlab - Text Analytics Toolbox](https://www.mathworks.com/campaigns/products/trials.html?prodcode=TA)
- [GloVe: Global Vectors for Word Representation](https://nlp.stanford.edu/projects/glove/)
  - [Pre-trained data used for the project](http://nlp.stanford.edu/data/glove.6B.zip)
- [Enron email dataset](https://www.cs.cmu.edu/~enron/)
- [Python code for enron email body extraction](https://www.pythonforengineers.com/analysing-the-enron-email-corpus/)
