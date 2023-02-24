% This function loads all settings for the experiment

function expinfo = ExpSettings(expinfo)
%% Some general info about the experiment
expinfo.TaskName = 'M3_Verbal Task';

%% Get Date an time for this session
expinfo.DateTime = datetime('now');

expinfo.DateTime.Format = 'dd-MMM-yyyy';
expinfo.Date = cellstr(expinfo.DateTime);
expinfo.Date = expinfo.Date{1};

expinfo.DateTime.Format = 'hh:mm:ss';
expinfo.Time = cellstr(expinfo.DateTime);
expinfo.Time = expinfo.Time{1};


%% Specify Folder Paths
expinfo.InstFolder      = 'Instructions/';
expinfo.StimFolder      = 'Stimuli/';
expinfo.InstExtension   = '.JPG';
expinfo.DataFolder      = 'DataFiles/';

%% Initiate Input Output settings for Markers
expinfo.ioObj = io64;
expinfo.IOstatus = io64(expinfo.ioObj);
expinfo.PortAddress = hex2dec('E010');
io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port


%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 80; % in Pixel bzw. Point
expinfo.BoxSize = [0 0 0.05*expinfo.maxX 0.05*expinfo.maxY]; % Box-size with 5% of screen size

%Specify Trial Numbers
expinfo.nPracTrials = 10;
expinfo.nExpTrials = 70;

% Specify after how many trials in the experimental blocks there will be a break
expinfo.Trials2Pause = floor(expinfo.nExpTrials*0.20);

%% Define Stimfile

expinfo.stimfile = [expinfo.StimFolder 'wordlist_1500.xls'];

%% Secify number of general instruction slides
expinfo.InstStop = 14;

%% Timing - fixed in all trials

expinfo.Fixtime = 1.5; % Dauer des Fixationskreuzes zu Beginn eines Trials
%expinfo.Fix_Jitter = 0.2; % Jitter des Fixaxtionskreuzes
expinfo.Fix_Cue = 1.5;
expinfo.cue_word = 0;
expinfo.cue_time = 0.250;

expinfo.ISI = 0.2; % Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
%expinfo.ISIjitter = 0.2; % ISI Jitter = Intervall in dem das ISI variieren darf


expinfo.MaxRTGrid = 10; % Maximal erlaubte Reaktionszeit bei Memory Recall pro Position
expinfo.MaxRTSec = 1.7; % Maximal erlaubte Reaktionszeit bei Größenentscheidung
expinfo.MinTarget = 1;


expinfo.ITI = 2; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
%expinfo.ITIjitter =0.5; %ITI Jitter
expinfo.FeedbackDuration = 2;

%% Experimental Manipulations

expinfo.GridSize =20;
expinfo.RespWindow = 1:expinfo.GridSize;
expinfo.SetSize = 5;
expinfo.FT = [0.5; 1];
expinfo.NPLs = expinfo.GridSize-expinfo.SetSize*2;

expinfo.CueCondition = {'pre' 'post'};
expinfo.StimClass = {'M','D'};
expinfo.RetroStimClass = [0 1];
expinfo.CueCondFactor = 1:length(expinfo.CueCondition);
expinfo.BlockOrd = randsample(expinfo.CueCondition, length(expinfo.CueCondFactor), 1);


expinfo.Laterality = {'left' 'right'};

% Marker Identification for EEG 




expinfo.LateralityCondFactor = 1:length(expinfo.Laterality);
expinfo.StimClassCond = 1:length(expinfo.StimClass);




%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'LeftArrow';
expinfo.RightKey = 'RightArrow';
expinfo.RespKeys = {'d' 'l'};
expinfo.AbortKey = 'F12';

%% Define Positions for Response Grids
% x und y Koordinaten der Bilder bei der Abfrage festlegen. 4 x 4 Grid. 1-16 von unten links nach rechts, von unten nach oben 

expinfo.lengthText = 100;
expinfo.widthText = 30;

expinfo.lengthPic = 130;
expinfo.widthPic = 130;

% Define Left and Right Half of the Screen
expinfo.center = [expinfo.maxX *0.5 expinfo.maxY * 0.5];
expinfo.right = [expinfo.maxX *0.75 expinfo.maxY * 0.5];
expinfo.left = [expinfo.maxX *0.25 expinfo.maxY * 0.5];

%% Positions for response Grids

% Calculate Coordinates

nCircles = expinfo.GridSize;  % how many equally spaced circles?
MemoryRadius = expinfo.centerX/2; % radius, in Pixels

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
switch computer
    case 'MACI64'
        if expinfo.language == 1
            expinfo.InstFolder = 'Instructions/German/';
        else
            expinfo.InstFolder = 'Instructions/English/';
        end
        expinfo.InstExtension = '.jpg';
        expinfo.DataFolder = 'DataFiles/';
    case 'PCWIN'
        if expinfo.language == 1
            expinfo.InstFolder = 'Instructions\German\';
        else
            expinfo.InstFolder = 'Instructions\English\';
        end
        expinfo.InstExtension = '.jpg';
        expinfo.DataFolder = 'DataFiles\';
    case 'PCWIN64'
        if expinfo.language == 1
            expinfo.InstFolder = 'Instructions\German\';
        else
            expinfo.InstFolder = 'Instructions\English\';
        end
        expinfo.InstExtension = '.jpg';
        expinfo.DataFolder = 'DataFiles\';
end



%% datafiles and messages
pracFile = '_prac.txt'; % extension for the practice trial data
expFile  = '_exp.txt';  % extension fot the experimental trial data
bFile = '_bio.txt'; % biographical information

% Adjusting the file-names to a different name for each subject
expinfo.pracFile = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile];
expinfo.expFile  = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile];
expinfo.bFile = [expinfo.DataFolder expinfo.TaskName, bFile]; %extension for biofile

% Prepare Files for task and biographical informations including variable names for
% easy further analysis with R etc.

fid = fopen(expinfo.expFile,'w');
  fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s\n',...
    'Subject','TrialNum','SetSize', ...
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
   fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s\n',...
    'Subject','TrialNum','SetSize', ...
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
if exist(expinfo.bFile,'file') == 0
    fid = fopen(expinfo.bFile,'w');
    fprintf(fid, '%1s %2s %3s %4s %5s %6s %7s %8s\n','SubjectNr.','Name','FirstName','Age','Sex','Occupation','Handedness','Contact');
    fclose(fid);
end





