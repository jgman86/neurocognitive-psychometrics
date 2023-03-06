% This function loads all settings for the experiment

function expinfo = ExpSettings(expinfo)
%% Some general info about the experiment
if expinfo.TrialType == 1 && expinfo.StimType == "Words"

    expinfo.TaskName = 'M3_Verbal_PreCue';

elseif expinfo.TrialType == 1 && expinfo.StimType == "Numbers"

    expinfo.TaskName = 'M3_Numerical_PreCue';

elseif expinfo.TrialType == 2 && expinfo.StimType == "Words"

    expinfo.TaskName = 'M3_Verbal_PostCue';

elseif expinfo.TrialType == 2 && expinfo.StimType == "Numbers"
    expinfo.TaskName = 'M3_Numerical_PostCue';


end
%% Get Date an time for this session
expinfo.DateTime = datetime('now');

expinfo.DateTime.Format = 'dd-MMM-yyyy';
expinfo.Date = cellstr(expinfo.DateTime);
expinfo.Date = expinfo.Date{1};

expinfo.DateTime.Format = 'hh:mm:ss';
expinfo.Time = cellstr(expinfo.DateTime);
expinfo.Time = expinfo.Time{1};


%% Specify Folder Paths
% For Instructions
if expinfo.TrialType == 1 && expinfo.StimType == "Words"

    expinfo.InstFolder  = 'Instructions\German\PreCueVerbal\'; % adjust inst folder for different cue and stimtype conditions

elseif expinfo.TrialType == 2 && expinfo.StimType == "Words"

    expinfo.InstFolder      = 'Instructions\German\PostCueVerbal\';

elseif    expinfo.TrialType == 1 && expinfo.StimType == "Numbers"

    expinfo.InstFolder      = 'Instructions\German\PreCueNumerical\'; % adjust inst folder for different cue and stimtype conditions

elseif expinfo.TrialType == 2 && expinfo.StimType == "Numbers"

    expinfo.InstFolder      = 'Instructions\German\PostCueNumerical\';
end

% For Outputfiles

if expinfo.TrialType == 1 && expinfo.StimType == "Words"

    expinfo.DataFolder  = 'DataFiles/PreCueVerbal/'; % adjust inst folder for different cue and stimtype conditions

elseif expinfo.TrialType == 2 && expinfo.StimType == "Words"

    expinfo.DataFolder      = 'DataFiles/PostCueVerbal/';

elseif    expinfo.TrialType == 1 && expinfo.StimType == "Numbers"

    expinfo.DataFolder      = 'DataFiles/PreCueNumerical/'; % adjust inst folder for different cue and stimtype conditions

elseif expinfo.TrialType == 2 && expinfo.StimType == "Numbers"

    expinfo.DataFolder      = 'DataFiles/PostCueNumerical/';
end



% For Stims 
expinfo.StimFolder      = 'Stimuli/';
expinfo.InstExtension   = '.JPG';
%% Initiate Input Output settings for Markers

if expinfo.EEGExp == 1

    expinfo.ioObj = io64;
    expinfo.IOstatus = io64(expinfo.ioObj);
    expinfo.PortAddress = hex2dec('3EFC');
    io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port

end 

%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 80; % in Pixel bzw. Point
expinfo.BoxSize = [0 0 0.05*expinfo.maxX 0.05*expinfo.maxY]; % Box-size with 5% of screen size

%Specify Trial Numbers
expinfo.nPracTrials = 10;
expinfo.nExpTrials = 80;

% Specify after how many trials in the experimental blocks there will be a break
expinfo.Trials2Pause = floor(expinfo.nExpTrials*0.20);

%% Define Stimfile

expinfo.stimfile = [expinfo.StimFolder 'wordlist_1500.xls'];

%% Secify number of general instruction slides
expinfo.InstStop = 14;

%% Timing - fixed in all trials, can be jittetered

% Presentation of Fixation Cross at a beginning of a trial
expinfo.Fixtime = 1; % Dauer des Fixationskreuzes zu Beginn eines Trials

% Cue Word Intervall - fix presented
expinfo.Cue_Word = 0.500;
% Cue presentation time
expinfo.cue_time = 0.200;
% Initial Time to Encode the Word
expinfo.EncTime = 0.600;

expinfo.ISI = 0.250; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
%expinfo.ISI_jitter = 0.100; % ISI Jitter = Intervall in dem das ISI variieren darf

% ISI Between Retrieval Grids
expinfo.ISI_Ret = 0.5; % Minimale Dauer des Inter-Stimulus-Intervalls im Retrieval(ISI)

% MaxRTs for Tasks
expinfo.MaxRTGrid = 10; % Maximal erlaubte Reaktionszeit bei Memory Recall pro Position
expinfo.MaxRTSec = 1.2; % Maximal erlaubte Reaktionszeit bei Größenentscheidung

expinfo.ITI = 1; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
%expinfo.ITI_jitter = 0.2; %ITI Jitter

% Feedback for Practice Trials
expinfo.FeedbackDuration = 0.5;
expinfo.FeedbackFix = 1;

%% Experimental Manipulations

expinfo.GridSize =20;
expinfo.RespWindow = 1:expinfo.GridSize;
%expinfo.SetSize = 6;
expinfo.FT = [0.300;0.600];
expinfo.FT_pre = 0.200;
expinfo.NPLs = expinfo.GridSize-expinfo.SetSize*2;

expinfo.CueCondition = {'pre';'post'};
expinfo.StimClass = {'M','D'};
expinfo.RetroStimClass = [0 1];
expinfo.CueCondFactor = 1:length(expinfo.CueCondition);

% Maximum consecutive occurrences of Mem/ Distractor Items
expinfo.max_consec = 3;

% Marker Identification for EEG
expinfo.StimClassCond = 1:length(expinfo.StimClass);


%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'LeftArrow';
expinfo.RightKey = 'RightArrow';
expinfo.RespKeys = {'d' 'l'};
expinfo.AbortKey = 'F12';

%% Define Positions for Response Grids
% x und y Koordinaten der Bilder bei der Abfrage festlegen. 4 x 4 Grid. 1-16 von unten links nach rechts, von unten nach oben

if expinfo.StimType == "Words"
    expinfo.lengthText = 85;
    expinfo.widthText = 20;
else
    expinfo.lengthText = 20;
    expinfo.widthText = 20;
end


expinfo.lengthPic = 30;
expinfo.widthPic = 30;

% Define Left and Right Half of the Screen
expinfo.center = [expinfo.maxX *0.5 expinfo.maxY * 0.5];
expinfo.right = [expinfo.maxX *0.75 expinfo.maxY * 0.5];
expinfo.left = [expinfo.maxX *0.25 expinfo.maxY * 0.5];

%% Positions for response Grids

% Calculate Coordinates

nCircles = expinfo.GridSize;  % how many equally spaced circles?

if expinfo.StimType == "Words"
    MemoryRadius = expinfo.centerX/1.7; % radius, in Pixels

else

    MemoryRadius = expinfo.centerX/2.5; % radius, in Pixels
end


% use polar coordinates to compute positions
dAngle = 2*pi/nCircles; % change in angle per circle
angles = (0:nCircles-1) * dAngle;
[xPos, yPos] = pol2cart(angles, MemoryRadius); % convert back to Cartesian
% translate to new center
CoordsX = xPos + expinfo.centerX;
CoordsY= yPos + expinfo.centerY;

Coords(:,1) = CoordsX;
Coords(:,2) = CoordsY;


%% Rect Coordinates for Circles (and Response fields)

for i = 1:expinfo.GridSize

    expinfo.Coord(i,:)=[Coords(i,1)  Coords(i,2) ...
        Coords(i,1) Coords(i,2)];
end


%% Colors and Fonts for Text & Stimuli

expinfo.Colors.stimColor = [255 255 255];
expinfo.Colors.bgColor = [89 89 89];
expinfo.Colors.gray = [128 0 0];
expinfo.Colors.green =  [0 178 30];
expinfo.Colors.red = [255 25 32];
expinfo.Colors.CueMem = [0 176 240];
expinfo.Colors.CueDist= [146 208 80];

% Fonts
expinfo.Fonts.textFont  = expinfo.Fonts.sansSerifFont;



%% Specify Instruction folder - conditional on operating system & language settings
% switch computer
%     case 'MACI64'
%         if expinfo.language == 1
%             expinfo.InstFolder = 'Instructions/German/';
%         else
%             expinfo.InstFolder = 'Instructions/English/';
%         end
%         expinfo.InstExtension = '.jpg';
%         expinfo.DataFolder = 'DataFiles/';
%     case 'PCWIN'
%         if expinfo.language == 1
%             expinfo.InstFolder = 'Instructions\German\';
%         else
%             expinfo.InstFolder = 'Instructions\English\';
%         end
%         expinfo.InstExtension = '.jpg';
%         expinfo.DataFolder = 'DataFiles\';
%     case 'PCWIN64'
%         if expinfo.language == 1
%             expinfo.InstFolder = 'Instructions\German\';
%         else
%             expinfo.InstFolder = 'Instructions\English\';
%         end
%         expinfo.InstExtension = '.jpg';
%         expinfo.DataFolder = 'DataFiles\';
% end



%% datafiles and messages
pracFile = '_prac.txt'; % extension for the practice trial data
expFile  = '_exp.txt';  % extension fot the experimental trial data
bFile = '_bio.csv'; % biographical information

% Adjusting the file-names to a different name for each subject
expinfo.pracFile = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];
expinfo.expFile  = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile];
expinfo.bFile = [expinfo.DataFolder expinfo.TaskName, bFile]; %extension for biofile

% Prepare Files for task and biographical informations including variable names for
% easy further analysis with R etc.

% Create File Headers
Grid_ACC = sprintfc('Grid_ACC_Pos%d ', 1:expinfo.SetSize);
Grid_RT = sprintfc('Grid_RT_Pos%d ', 1:expinfo.SetSize);
SecTask_ACC = sprintfc('SecTask_ACC_Pos%d ', 1:expinfo.SetSize*2);
SecTask_RT = sprintfc('SecTask_RT_Pos%d ', 1:expinfo.SetSize*2);
n_DIP_Pos = sprintfc('n_DIP_Pos%d ', 1:expinfo.SetSize);

header=string(['Subject ','TrialNum ','CueCondition ','SetSize ','FT ','n_DIP_total ',n_DIP_Pos,Grid_ACC,Grid_RT,'SumACC_Grid ',SecTask_ACC,SecTask_RT,...
    'SumACC_SecTask ','IIP ','IOP ','DIP ','DIOP ','NPLs ','Misses ']);

% Write Blank Datafiles

fid = fopen(expinfo.expFile,'w');
fprintf(fid, '%s', header);
fclose(fid);

if expinfo.doPractice == 1
    fid = fopen(expinfo.pracFile,'w');
    fprintf(fid, '%s', header);
    fclose(fid);

end

% Write Bio file if non existant
%Create Header
header = {'SubjectNr.','Name','FirstName','Age','Sex','Occupation','Handedness','conscientiousness','Contact'};
textHeader = strjoin(header, ',');

if exist(expinfo.bFile,'file') == 0
    fid = fopen(expinfo.bFile,'w');
    fprintf(fid,'%s\n',textHeader);
    fclose(fid);
end





