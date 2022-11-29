% This function loads all settings for the experiment

function expinfo = ExpSettings(expinfo)
%% Get Date an time for this session
expinfo.DateTime = datetime('now');

expinfo.DateTime.Format = 'dd-MMM-yyyy';
expinfo.Date = cellstr(expinfo.DateTime);
expinfo.Date = expinfo.Date{1};

expinfo.DateTime.Format = 'hh:mm:ss';
expinfo.Time = cellstr(expinfo.DateTime);
expinfo.Time = expinfo.Time{1};

%% Stimuli information for Global Local Task
[xCenter, yCenter] = RectCenter(expinfo.rect);
expinfo.yTargetPos = yCenter;
expinfo.xTargetPos = xCenter;
expinfo.Arrow = [1 2]; % 1 = right; 2 = left
expinfo.Flanker = [1:3]; %(1,2,3)   1 right 2 left 3 neutral
expinfo.Congruency = [1:2]; %(1,2,3)   1 congruent 2 incongruent 3 neutral % nweutral wurde rausgenommen
expinfo.CongruencyString ={'congruent', 'incongruent', 'neutral'};
expinfo.ArrowString = {'right', 'left'};
expinfo.FlankerString = {'right', 'left', 'neutral'};
%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 40; % in Pixel bzw. Point


%% Secify number of general instruction slides
expinfo.InstStop = 4;

%% Timing - fixed in all trials
expinfo.Fix_Duration = 0.4; % Dauer des Fixationskreuzes zu Beginn eines Trials
expinfo.Fix_jitter = 0.2;

expinfo.MinISIduration = 0.4; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
expinfo.ISIjitter = 0.2; % ISI Jitter = Intervall in dem das ISI variieren darf

expinfo.MinTarget = 1;
expinfo.MaxRT = 3; % Maximal erlaubte Reaktionszeit bei einer Abfrage


expinfo.MinITIduration =1; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
expinfo.ITIjitter =0.5; %ITI Jitter

expinfo.FeedbackDuration = 1;

%% Initiate Input Output settings for Markers
expinfo.ioObj = io64;
expinfo.IOstatus = io64(expinfo.ioObj);
expinfo.PortAddress = hex2dec('E010');
io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port

%% Specify Stimuli to be shown

expinfo.ColorOnFix = 0; % 0 = no, 1 yes
expinfo.LongRT = 1; % 1 yes 0 no


%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'd'; 
expinfo.RightKey = 'l';
expinfo.AbortKey = 'F12';
expinfo.RespKeys = {'d' 'l'};
expinfo.ResponseMapping = [2 1];

% Example: Balance response mapping across participants
% if mod(expinfo.subject,2) == 0
%     expinfo.ResponseMapping = [1 2];
%     else
%     expinfo.ResponseMapping = [2 1];
% end

%% Defining trials to be conducted
% Specify how many trials should be conducted


expinfo.nPracTrials = 20;
expinfo.nExpTrials = 200;
expinfo.Block = 1;

% Specify how many Trials in each cell of the experimental design should be
% conducted
expinfo.Trial2Cond = 50;



% get Trial Configurations of all experimental conditions  !!!!!!!!!!!!!!
%[StimList, LocationConList, CueConList] = BalanceFactors(expinfo.Trial2Cond, 0,expinfo.StimFactor, expinfo.LocConFactor, expinfo.CueCondFactor);
%expinfo.TrialConfigurations = horzcat(StimList, LocationConList, CueConList);

% Number of total Trials to be conducted
% expinfo.nExpTrials = size(expinfo.TrialConfigurations,1); !!!!!!!!!!!!!!

% Specify after how many trials in the experimental blocks there will be a
% break
% expinfo.Trials2Pause = floor(expinfo.nExpTrials*0.20); !!!!!!!!!!!

% Specify how trial lists should be generated. Options are:  !!!!!!!!!
    % FullRandom = fully randomized without any conditions
    % ConRandom = conditionally randomized, with individually programmend
    % conditions -> see MakeTrial.m
    % AsIs = not randomized, not recommended
    %expinfo.ListGen = 'ConRandom';

%% Colors

expinfo.Colors.green =  [0 178 30];
expinfo.Colors.red = [255 25 32];
expinfo.Colors.gray =  [140 140 140];
expinfo.Colors.bgColor = [0 0 0];


%% Fonts
expinfo.Fonts.textFont  = expinfo.Fonts.sansSerifFont;

%% Specify Instruction folder
expinfo.InstFolder      = 'Instructions/';
expinfo.InstExtension   = '.JPG';
expinfo.DataFolder      = 'DataFiles/';

%% datafiles and messages
pracFile = 'prac.txt'; % extension for the practice trial data
expFile  = 'exp.txt';  % extension fot the expreimental trial data

% Adjusting the file-names to a different name for each subject

expinfo.pracFile = [expinfo.DataFolder,expinfo.taskName,'Flanker_Task_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];
expinfo.expFile  = [expinfo.DataFolder,expinfo.taskName,'Flanker_Task_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile];
end
%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de
