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
expinfo.ioObj = io64;
expinfo.IOstatus = io64(expinfo.ioObj);
expinfo.PortAddress = hex2dec('3EFC');
io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port


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
expinfo.EncTime = 0.500;

expinfo.ISI = 0.250; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
%expinfo.ISI_jitter = 0.100; % ISI Jitter = Intervall in dem das ISI variieren darf

% ISI Between Retrieval Grids
expinfo.ISI_Ret = 0.5; % Minimale Dauer des Inter-Stimulus-Intervalls im Retrieval(ISI)

% MaxRTs for Tasks
expinfo.MaxRTGrid = 10; % Maximal erlaubte Reaktionszeit bei Memory Recall pro Position
expinfo.MaxRTSec = 1; % Maximal erlaubte Reaktionszeit bei Größenentscheidung

expinfo.ITI = 1; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
%expinfo.ITI_jitter = 0.2; %ITI Jitter

% Feedback for Practice Trials
expinfo.FeedbackDuration = 0.5;
expinfo.FeedbackFix = 1;

%% Experimental Manipulations

expinfo.GridSize =20;
expinfo.RespWindow = 1:expinfo.GridSize;
expinfo.SetSize = 5;
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
    expinfo.lengthText = 95;
    expinfo.widthText = 25;
else
    expinfo.lengthText = 25;
    expinfo.widthText = 25;
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
    MemoryRadius = expinfo.centerX/1.8; % radius, in Pixels

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

fid = fopen(expinfo.expFile,'w');
fprintf(fid, ' %1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s %48$s %49$s\n', ...
    'Subject','TrialNum','CueCondition','SetSize','FT', ...
    'n_DIP_total','n_DIP_Pos1','n_DIP_Pos2', ...
    'n_DIP_Pos3','n_DIP_Pos4','n_DIP_Pos5', ...
    'Grid_Pos1_ACC','Grid_Pos2_ACC','Grid_Pos3_ACC', ...
    'Grid_Pos4_ACC','Grid_Pos5_ACC', ...
    'Grid_Pos1_RT','Grid_Pos2_RT','Grid_Pos3_RT', ...
    'Grid_Pos4_RT','Grid_Pos5_RT','SumACC_Grid',...
    'Pos1_ACC_SecTask','Pos2_ACC_SecTask','Pos3_ACC_SecTask',...
    'Pos4_ACC_SecTask','Pos5_ACC_SecTask','Pos6_ACC_SecTask',...
    'Pos7_ACC_SecTask','Pos8_ACC_SecTask','Pos9_ACC_SecTask',...
    'Pos10_ACC_SecTask',...
    'Pos1_RT_SecTask','Pos2_RT_SecTask','Pos3_RT_SecTask',...
    'Pos4_RT_SecTask','Pos5_RT_SecTask','Pos6_RT_SecTask', ...
    'Pos7_RT_SecTask','Pos8_RT_SecTask','Pos9_RT_SecTask',...
    'Pos10_RT_SecTask','SumACC_SecTask',...
    'IIP','IOP','DIP','DIOP','NPLs','Misses');
fclose(fid);

if expinfo.doPractice == 1
    fid = fopen(expinfo.pracFile,'w');
    fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s %48$s %49$s\n', ...
        'Subject','TrialNum','CueCondition','SetSize','FT', ...
        'n_DIP_total','n_DIP_Pos1','n_DIP_Pos2', ...
        'n_DIP_Pos3','n_DIP_Pos4','n_DIP_Pos5', ...
        'Grid_Pos1_ACC','Grid_Pos2_ACC','Grid_Pos3_ACC', ...
        'Grid_Pos4_ACC','Grid_Pos5_ACC', ...
        'Grid_Pos1_RT','Grid_Pos2_RT','Grid_Pos3_RT', ...
        'Grid_Pos4_RT','Grid_Pos5_RT','SumACC_Grid',...
        'Pos1_ACC_SecTask','Pos2_ACC_SecTask','Pos3_ACC_SecTask',...
        'Pos4_ACC_SecTask','Pos5_ACC_SecTask','Pos6_ACC_SecTask',...
        'Pos7_ACC_SecTask','Pos8_ACC_SecTask','Pos9_ACC_SecTask',...
        'Pos10_ACC_SecTask',...
        'Pos1_RT_SecTask','Pos2_RT_SecTask','Pos3_RT_SecTask',...
        'Pos4_RT_SecTask','Pos5_RT_SecTask','Pos6_RT_SecTask', ...
        'Pos7_RT_SecTask','Pos8_RT_SecTask','Pos9_RT_SecTask',...
        'Pos10_RT_SecTask','SumACC_SecTask',...
        'IIP','IOP','DIP','DIOP','NPLs','Misses');
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





