%% Main file to run with SMILE. 
%
%   SMILE optimizes your use through a machine learning algorithm. Follow the program instructions in
%   the command prompt. There are 4 running modes: �Learn�, �Test�, �Run�, and �Demo� 
% 
%       �Learn� � The program will ask you to indicate your mental state (negative, positive, or 
%                 neutral). This is how it calibrates to a new user. Approximately 50 inputs should
%                 be given to the program before using �Test� mode. 
%       �Test�  � The program will attempt to guess your mental state, and ask for feedback. This 
%                 mode continues to apply machine learning to improve its ability to predict your 
%                 mental state, and will be useful in ensuring that SMILE is working for you before
%                 using �Run� mode. 
%       �Run�   � The program will guess your mental state and provide biofeedback to you via audio.
%                 No machine learning is active here, and as such this mode should be used after 
%                 using �Test� mode to validate SMILE�s efficacy. 
%       �Demo�  � Runs the demonstration script we used for showcasing to the industry panel. The 
%                 program makes and averages six recordings to guess mental state. Implements a 
%                 decision tree from prior machine learning

close all
clear all
clc

% h = EmotivSMILE();
running = true;
while running
    mode = lower(input('What mode would you like to run with? (q = quit): ', 's'));
    while ~strcmp(mode, 'learn') && ~strcmp(mode, 'test') && ~strcmp(mode, 'run') && ~strcmp(mode, 'demo') && mode ~= 'q'
        disp('Please answer learn, test, run, demo, or q');
        mode = lower(input('What mode would you like to run with? (q = quit): ', 's'));
    end
    if mode == 'q'
        running = false;
    else
        h.runSMILE(mode);
    end
end


