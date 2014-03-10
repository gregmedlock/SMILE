% Import data
[X, Y] = xlsread('classification.xlsx');
freqs = cell(1, 22);
for i = 8:29
    freqs{i - 7} = num2str(i);
end
ctree = ClassificationTree.fit(X, Y, 'PredictorNames', freqs);
view(ctree, 'mode', 'graph')