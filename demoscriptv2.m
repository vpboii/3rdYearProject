% Explanatory script for Vitaljis

% He has supplied various bits of data in files named test.mat and
% test3.mat 

% This segment of code is taken from demoscript.m
clear
filename = "glove.6B/glove.6B.300d";
if exist(filename + '.mat', 'file') ~= 2
    emb = readWordEmbedding(filename + '.txt');
    save(filename + '.mat', 'emb', '-v7.3');
else
    load(filename + '.mat')
end

if exist('test3.mat','file') ~= 2
    test = fileread('test3.txt');
    test = split(test);
    save('test3.mat','test');
else
    load('test3.mat')
end

% End of email marker (inserted in previous Python script)
end_of_email_marker = 'xyxyxyxyxyzoop';

% Find those markers
ends_ptr = find(ismember(test,end_of_email_marker));


% A whos on test.mat gives:
%  Name                       Size                 Bytes  Class                                   Attributes
% 
%   LineType                   1x2                      4  char                                              
%   Nremovals                  1x1                      8  double                                            
%   ans                        1x1                      8  matlab.pyclient.PythonEnvironment                 
%   cidx                     156x1                   1248  double                                            
%   colours                    1x4                      8  char                                              
%   colptr                     1x1                      8  double                                            
%   emb                        1x1              480000000  wordEmbedding                                     
%   end_of_email_marker        1x14                    28  char                                              
%   end_token                  1x1                      8  double                                            
%   ends_ptr                  20x1                    160  double                                            
%   ends_ptr2                  1x20                   160  double                                            
%   enum                       1x1                      8  double                                            
%   filename                   1x1                    254  string                                            
%   first_token                1x1                      8  double                                            
%   handl                      1x1                      8  textanalytics.chart.TextScatter                   
%   n                          1x1                      8  double                                            
%   not_in_glove_flag        181x1                    181  logical                                           
%   phan                       1x6                     48  matlab.graphics.chart.primitive.Line              
%   removals_flag             10x1                     10  logical                                           
%   test                     659x1                  77252  cell                                              
%   test_reduced             156x1                  18030  cell                                              
%   vec                      156x300               187200  single                                            
%   w_ptre                     1x1                      8  double                                            
%   w_ptrs                     1x1                      8  double                                            
%   xy                       156x2                   1248  single    

% The word embedding is called emn and contains 400,000 words each of
% dimension 300.

% The variable test is a 181 length cell array containing each word in the
% sentences with a marker indicating the break between sentences.

% The sentence breaks are correctly marked:

test{ends_ptr};

% So it's easy to find the start and end of each sentence which we will
% put into apmatix called P.  The first row will be the start of the
% sentence, the second will be the end

for n = 1:length(ends_ptr)
    if (n==1)
        P(1,1) = 1;
    else
        P(n,1) = ends_ptr(n-1)+1;
    end
    P(n,2) = ends_ptr(n)-1;
end

% Now we have an anxiety that some of the words in the sentence might not
% have corresponding points in the vocab.  Given that a sentence is now
% quite a complicted thing. Let's define a structure that holds everythign
% we want to know about it
% sentence.raw = list of words in the original sentence
% sentence.parsed = list of words that are in the vocab
% sentence.parsedxy = co-ordinates of those words.

% Words that are in the Glove vocab
in_glove_flag = ismember(test,emb.Vocabulary);
ptr_in_glove = find(in_glove_flag);


% Now it would be more efficient to put this into the last loop but for
% clarity let's have a new loop
for n = 1:length(ends_ptr)
    sentence.raw = P(n,1):P(n,2);
    sentence.parsed = sentence.raw(find(in_glove_flag(sentence.raw)));
    document(n) = sentence;
end 
 
% At this point we have the doument with all the sentences marked-up with
% their start and ends.  We also know which words in the sentence are in
% the Glove vocabulary.  But, word2vec and tsne are really about
% visualising vocabularies so just asking for a visualisation of the test
% document is no good.  We need to create a vocabularly for the data in the
% document and have pointers into that

% Now we have two indexes such that u(iu) = test and t(it) = u


%t(it) = u;
% Now let's find the embedding
% There are several choices here and we should experiment as to whether to
% use test, or u or u minus words not in the vocab.  Let's use u for now.

% But u still contains words that are not in the Glove vocabulary.  That's
% a nuiscence so let's remove, or censor them,
[u,it,iu] = unique(test(ptr_in_glove));

vec = word2vec(emb,u,'IgnoreCase',true);

% And now let's shrink vec down to only two dimensions using TSNE
% TSNE is an algorithm with randomness in it.  So if we ask it to find a
% mapping with repeat words, the words will all get mapped to roughly the
% same place but it's irritating to habe a cluster of words instead of a
% single point.


rng('default'); % for reproducibility
vec2d = tsne(vec);
figure
%textscatter(vec2d,u)
title("Word trajectory");

