%% Prediction Demo (Greg)
close all
clear all
clc

% Run demo
h = EmotivSMILE();
h.runSMILE('demo');

% Give demo results
if strcmp(mode, 'demo')
    n = 0;
    p = 0;
    iter = h.demoResults.iterator();
    while iter.hasNext()
        if strcmp(iter.next(), 'negative')
            n = n + 1;
        else
            p = p + 1;
        end
    end
    if n > p
        disp('User was feeling more negative')
    elseif p > n
        disp('User was feeling more positive')
    else
        disp('User was feeling neutral')
    end
    fprintf('Times counted negative: %d\nTimes counted positive: %d\n', n, p);
end

% View decision tree that we have previously demonstrated
h.veiwTree();


%% Learning Demo
close all

h.runSMILE('learn');
h.delete();