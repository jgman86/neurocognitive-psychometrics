%% M3-Spatial Cueing Task

clearvars; % Start the experiment with empty workspace
clc; % Clear command window
    
%% Gather Subject ID and some options for the experiment %%
prompt = {'Enter Subject Number:','Enter Session Number:','Start with Practice Trials?','Short Experiment?:', 'TrialType (0=PreCue, 1=PostTrials)'};
title = 'Spatial Complex Span Task';
dims = [1 50];
answer = inputdlg(prompt,title,dims);
expinfo.subject = str2double(answer{1}); % SubjectID
expinfo.session = str2double(answer{2}); % Session
expinfo.doPractice = str2double(answer{3}); % Practice Trials needed?
expinfo.isShort=str2double(answer{4});% Run a short version of the experiment for debugging and testing
expinfo.Cond=str2double(answer{5}); % Specify Trial Type 


%% Open PTB window and load general settings %%
% Add folders for functions, instructions and Data Files to the Matlab
% workspace
addpath('functions', 'Instructions', 'DataFiles');

% Setting a seed for randomization ensures that you can reproduce
% randomized variables for each subject and session id.
expinfo.mySeed = 100 * expinfo.subject+ expinfo.session;
rng(expinfo.mySeed);


% Unify key names and color range
PsychDefaultSetup(2);
Screen('Preference','TextRenderer', 0);
Screen('Preference','DefaultFontSize', 50);
% Open PTB window, and save some general information in the expinfo Object
expinfo = startPTB(expinfo); 


% Read in Exp Settings. This is only to keep your wrapper code tidy and
% structured. All Settings for the Experiment should be specified in this
% funtion. Rarely you will perform complex programming in this function.
% Rather you will define variables or experimental factors, etc.
expinfo = ExpSettings(expinfo); 

% Clear Screen for Background Color 
clearScreen(expinfo.window,expinfo.Colors.bgColor);

% Set priority for PTB processes to ensure best possible timing
topPriorityLevel = MaxPriority(expinfo.window);
Priority(topPriorityLevel);

%% General Instructions

% This is a loop running through the general instruction slides allowing to
% move back and forth within these slides. As soon as the last slide is
% finished you cannot move back.

InstSlide = 1; % Start with the first slide
while InstSlide <= 7 % Loop until last slide of general instruction
    % Paste the FileName for the Instrcution Slide depending on the current
    % slide to be displayed
    Instruction=[expinfo.InstFolder 'Folie' num2str(InstSlide) expinfo.InstExtension];
    ima=imread(Instruction); % Read in the File
    
    % Put the File on the PTB window
    InstScreen = Screen('MakeTexture',expinfo.window,ima);
    Screen('DrawTexture', expinfo.window, InstScreen); % draw the scene
    Screen('Flip', expinfo.window);
    WaitSecs(0.3);
    
    % Wait for a key press of the right or left key to navigate back an
    % forth within the instructions
    if InstSlide == 1
        [ForwardBackward] = BackOrNext(expinfo,1);
    else
        [ForwardBackward] = BackOrNext(expinfo,0);
    end
    InstSlide = InstSlide + ForwardBackward;
end

% clean up no longer relevant variables after the instrction to keep the
% workspace tidy
clearvars Instruction ima InstSlide
clearScreen(expinfo.window,expinfo.Colors.bgColor);
WaitSecs(0.1);

%% PracticeBlock
if expinfo.doPractice == 1

    isPractice = 1; % Local variable specifying that we are running practice trials

    % Generate a TrialList for the Practice Trials
    [PrePracTrials, PostPracTrials] = MakeTrial(expinfo, isPractice,expinfo.isShort);

    % Usually an additional instruction slide is displayed before the practice
    % trials
    PracStart=[expinfo.InstFolder 'PracStart.jpg'];
    ima=imread(PracStart, 'jpg');
    dImageWait(expinfo,ima);

    % Depending on Specification, show only Pre, only Post, or Mixed Trials
    if expinfo.Cond == 0 % Show Pre

        %Show PreExp Trials
        for expTrial = 1:length(PrePracTrials)% Loop durch alle Experimental-Trials
            PrePracTrials = DisplayTrial(expinfo, PrePracTrials, expTrial, isPractice);

        end

    elseif expinfo.Cond == 1 %ShowPost

        %Show PostExp Trials
        for expTrial = 1:length(PostPracTrials)% Loop durch alle Experimental-Trials
            PostPracTrials = DisplayTrial(expinfo, PostPracTrials, expTrial, isPractice);

        end

    elseif expinfo.Cond == 2

        %Show PostExp Trials
        for expTrial = 1:length(MixedPracTrials)% Loop durch alle Experimental-Trials
            MixedPracTrials = DisplayTrial(expinfo, PostExpTrials, expTrial, isPractice);

        end
    end

end

%% Start of Experimetal Block
isPractice = 0; % Local variable specifying that we are running practice trials

% Generate a TrialList for the experimental trials
[PreExpTrials , PostExpTrials] = MakeTrial(expinfo,isPractice,expinfo.isShort); % function that sets up the trial

% Similarly like before the practice trials, there usually is one
% instruction slide before the experimental trials start.

ExpStart=[expinfo.InstFolder 'ExpStart.jpg'];
ima=imread(ExpStart, 'jpg');
dImageWait(expinfo,ima);
    

%% Depending on Specification, show only Pre, only Post, or Mixed Trials
if expinfo.Cond == 0 % Show Pre

    %Show PreExp Trials
    for expTrial = 1:length(PreExpTrials)% Loop durch alle Experimental-Trials
        PreExpTrials = DisplayTrial(expinfo, PreExpTrials, expTrial, isPractice);

        % Show pause screen after the pre-defined number of trials
        if mod(expTrial,expinfo.Trials2Pause) == 0 && expTrial ~= expinfo.nExpTrials
            Pause=[expinfo.InstFolder 'Break.jpg'];
            ima=imread(Pause, 'jpg');
            dImageWait(expinfo,ima);
        end
    end

elseif expinfo.Cond == 1

    %Show PostExp Trials
    for expTrial = 1:length(PostExpTrials)% Loop durch alle Experimental-Trials
        PostExpTrials = DisplayTrial(expinfo, PostExpTrials, expTrial, isPractice);

        % Show pause screen after the pre-defined number of trials
        if mod(expTrial,expinfo.Trials2Pause) == 0 && expTrial ~= expinfo.nExpTrials
            Pause=[expinfo.InstFolder 'Break.jpg'];
            ima=imread(Pause, 'jpg');
            dImageWait(expinfo,ima);
        end
    end

elseif expinfo.Cond == 2

    %Show PostExp Trials
    for expTrial = 1:length(MixedExpTrials)% Loop durch alle Experimental-Trials
        MixedExpTrials = DisplayTrial(expinfo, PostExpTrials, expTrial, isPractice);

        % Show pause screen after the pre-defined number of trials
        if mod(expTrial,expinfo.Trials2Pause) == 0 && expTrial ~= expinfo.nExpTrials
            Pause=[expinfo.InstFolder 'Break.jpg'];
            ima=imread(Pause, 'jpg');
            dImageWait(expinfo,ima);
        end
    end
end

%% Save all information: i.e. tcvhe trial objects, and the expinfo structure.
% This ensures that all information used within the experiment can be
% accsessed later

if expinfo.Cond == 0
    if expinfo.doPractice == 1
        
        BackUp_PrePracTrials = [expinfo.DataFolder,expinfo.TaskName,'_PrePracTrials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        save(BackUp_PrePracTrials,'PrePracTrials');
        
    else
        
        BackUp_PreExpTrials = [expinfo.DataFolder,expinfo.TaskName,'PreExp_Trials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        BackUp_ExpInfo   = [expinfo.DataFolder,expinfo.TaskName,'_ExpInfo_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        
        save(BackUp_ExpInfo,'expinfo');
        save(BackUp_PreExpTrials,'PreExpTrials');
        
    end
    
elseif expinfo.Cond == 1
    
    if expinfo.doPractice == 0
        
        BackUp_PostPracTrials = [expinfo.DataFolder,expinfo.TaskName,'_PostPracTrials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        save(BackUp_PostPracTrials,'PostPracTrials');
        
    else
        
        BackUp_PostExpTrials = [expinfo.DataFolder,expinfo.TaskName,'PostExp_Trials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        BackUp_ExpInfo   = [expinfo.DataFolder,expinfo.TaskName,'_ExpInfo_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session)];
        
        save(BackUp_ExpInfo,'expinfo');
        save(BackUp_PostExpTrials,'PostExpTrials');
        
    end
   % Another Condition for mixed Trials to be added. 
end
%% End Experiment
% Display one final slide telling the participant that the experiment is
% finished.

EndExp=[expinfo.InstFolder 'ExpEnd.jpg'];
ima=imread(EndExp, 'jpg');
dImageWait(expinfo,ima);

Priority(0); % Reset priority to low level
expinfo = closeexp(expinfo); % Close the experiment

% Gather biographical information about participant 
getBio(expinfo); % No paper work from now on anymore ! ;-)


