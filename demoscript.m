% Based on https://blogs.mathworks.com/loren/2017/09/21/math-with-words-word-embeddings-with-matlab-and-text-analytics-toolbox/#34dd85a0-738d-40e4-8a83-13d3e4d3c536


clear
filename = "glove.6B/glove.6B.300d";
if exist(filename + '.mat', 'file') ~= 2
    emb = readWordEmbedding(filename + '.txt');
    save(filename + '.mat', 'emb', '-v7.3');
else
    load(filename + '.mat')
end
%v_king = word2vec(emb,'king')';
%whos v_king

%v_paris = word2vec(emb,'paris');
%v_france = word2vec(emb,'france');
%v_poland = word2vec(emb,'poland');
%vec2word(emb, v_paris - v_france +  v_poland)

% Another comparison
%vec2word(emb,(word2vec(emb,'woman')-word2vec(emb,'man')+word2vec(emb,'boy')))

if exist('test3.mat','file') ~= 2
    test = fileread('test3.txt');
    test = split(test);
    save('test3.mat','test');
else
    load('test3.mat')
end

% End of email marker (inserted in previous Python script
end_of_email_marker = 'xyxyxyxyxyzoop';

% Find those markers
ends_ptr = find(ismember(test,end_of_email_marker));

% Words that are not in the vocab
not_in_glove_flag = ~ismember(test,emb.Vocabulary);

% The not_in_glove_flag indicates by a 1 places where we are going to
% remove tokens.  When we remove a token we need to correct the
% end-of-email count

first_token = 1;
Nremovals = 0;
for n = 1:length(ends_ptr)
    end_token = ends_ptr(n);
    % How many removals have we had?
    removals_flag = not_in_glove_flag(first_token:end_token);
    Nremovals = Nremovals + sum(removals_flag);
    ends_ptr2(n) = ends_ptr(n) - Nremovals;
    first_token = ends_ptr(n);
end
ends_ptr2;
test_reduced = test;
test_reduced(not_in_glove_flag) = [];
vec = word2vec(emb,test_reduced);
cidx = kmeans(vec,25,'dist','sqeuclidean');

% Break here
rng('default'); % for reproducibility
xy = tsne(vec);
textscatter(xy,test_reduced)
handl = textscatter(xy,test_reduced);
hold


