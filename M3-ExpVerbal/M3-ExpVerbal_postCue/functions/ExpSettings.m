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

%% Specify Stimulus and Text properties (Size, Position, etc.)
expinfo.stimulussize = 80; % in Pixel bzw. Point
expinfo.BoxSize = [0 0 0.05*expinfo.maxX 0.05*expinfo.maxY]; % Box-size with 5% of screen size
expinfo.RespWindow = 1:25;

%Specify Trial Numbers
expinfo.nPracTrials = 10;
expinfo.nExpTrials = 100;

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

% Minimale Dauer des Inter-Stimulus-Intervalls (ISI)
%expinfo.ISIjitter = 0.2; % ISI Jitter = Intervall in dem das ISI variieren darf


expinfo.MaxRTGrid = 10; % Maximal erlaubte Reaktionszeit bei Memory Recall pro Position
expinfo.MaxRTSec = 1.7; % Maximal erlaubte Reaktionszeit bei Größenentscheidung


expinfo.ITI = 2; % Minimale Dauer des Inter-Trial-Intervalls (ITI)
%expinfo.ITIjitter =0.5; %ITI Jitter
expinfo.FeedbackDuration = 1;

%% Experimental Manipulations
expinfo.SetSize = 5;
expinfo.FT = [0;1.5]; 

expinfo.GridSize =25;

expinfo.NPLs = expinfo.GridSize-expinfo.SetSize*2;

expinfo.CueCondition = {'pre' 'post'};
expinfo.StimClass = {'M','D'};
expinfo.RetroStimClass = [0 1];
expinfo.CueCondFactor = 1:length(expinfo.CueCondition);
expinfo.BlockOrd = randsample(expinfo.CueCondition, length(expinfo.CueCondFactor), 1);


expinfo.Laterality = {'left' 'right'};
expinfo.LateralityCondFactor = 1:length(expinfo.Laterality);





%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'LeftArrow';
expinfo.RightKey = 'RightArrow';
expinfo.RespKeys = {'d' 'l'};
expinfo.AbortKey = 'F12';


%% Define Positions for Response Grids
% x und y Koordinaten der Bilder bei der Abfrage festlegen. 4 x 4 Grid. 1-16 von unten links nach rechts, von unten nach oben 

expinfo.lengthText = 200;
expinfo.widthText = 80;

expinfo.lengthPic = 130;
expinfo.widthPic = 130;

% Define Left and Right Half of the Screen
expinfo.center = [expinfo.maxX *0.5 expinfo.maxY * 0.5];
expinfo.right = [expinfo.maxX *0.25 expinfo.maxY * 0.5];
expinfo.left = [expinfo.maxX *0.75 expinfo.maxY * 0.5];


%maxY = Zeilen
%maxX = Spalten

expinfo.centralResp1 = [4/16*expinfo.maxX 5/6*expinfo.maxY]; 
expinfo.centralResp2 = [6/16*expinfo.maxX 5/6*expinfo.maxY];
expinfo.centralResp3 = [8/16*expinfo.maxX 5/6*expinfo.maxY];   
expinfo.centralResp4 = [10/16*expinfo.maxX 5/6*expinfo.maxY];
expinfo.centralResp5 = [12/16*expinfo.maxX 5/6*expinfo.maxY];

expinfo.centralResp6 = [4/16*expinfo.maxX 4/6*expinfo.maxY];
expinfo.centralResp7 = [6/16*expinfo.maxX 4/6*expinfo.maxY];
expinfo.centralResp8 = [8/16*expinfo.maxX 4/6*expinfo.maxY]; 
expinfo.centralResp9 = [10/16*expinfo.maxX 4/6*expinfo.maxY]; 
expinfo.centralResp10 = [12/16*expinfo.maxX 4/6*expinfo.maxY]; 

expinfo.centralResp11 = [4/16*expinfo.maxX 3/6*expinfo.maxY];
expinfo.centralResp12 = [6/16*expinfo.maxX 3/6*expinfo.maxY]; 
expinfo.centralResp13 = [8/16*expinfo.maxX 3/6*expinfo.maxY];
expinfo.centralResp14 = [10/16*expinfo.maxX 3/6*expinfo.maxY]; 
expinfo.centralResp15 = [12/16*expinfo.maxX 3/6*expinfo.maxY]; 

expinfo.centralResp16 = [4/16*expinfo.maxX 2/6*expinfo.maxY];
expinfo.centralResp17 = [6/16*expinfo.maxX 2/6*expinfo.maxY];
expinfo.centralResp18 = [8/16*expinfo.maxX 2/6*expinfo.maxY];
expinfo.centralResp19 = [10/16*expinfo.maxX 2/6*expinfo.maxY]; 
expinfo.centralResp20 = [12/16*expinfo.maxX 2/6*expinfo.maxY];

expinfo.centralResp21 = [4/16*expinfo.maxX 1/6*expinfo.maxY];
expinfo.centralResp22 = [6/16*expinfo.maxX 1/6*expinfo.maxY];
expinfo.centralResp23 = [8/16*expinfo.maxX 1/6*expinfo.maxY]; 
expinfo.centralResp24 = [10/16*expinfo.maxX 1/6*expinfo.maxY]; 
expinfo.centralResp25 = [12/16*expinfo.maxX 1/6*expinfo.maxY]; 

% expinfo.centralResp26 = [5/16*expinfo.maxX 2/7*expinfo.maxY]; 
% expinfo.centralResp27 = [7/16*expinfo.maxX 2/7*expinfo.maxY]; 
% expinfo.centralResp28 = [9/16*expinfo.maxX 2/7*expinfo.maxY]; 
% expinfo.centralResp29 = [11/16*expinfo.maxX 2/7*expinfo.maxY]; 
% expinfo.centralResp30 = [13/16*expinfo.maxX 2/7*expinfo.maxY]; 
% expinfo.centralResp31 = [3/16*expinfo.maxX 1/7*expinfo.maxY]; 
% expinfo.centralResp32 = [5/16*expinfo.maxX 1/7*expinfo.maxY]; 
% expinfo.centralResp33 = [7/16*expinfo.maxX 1/7*expinfo.maxY]; 
% expinfo.centralResp34 = [9/16*expinfo.maxX 1/7*expinfo.maxY]; 
% expinfo.centralResp35 = [11/16*expinfo.maxX 1/7*expinfo.maxY]; 
% expinfo.centralResp36 = [13/16*expinfo.maxX 1/7*expinfo.maxY]; 


expinfo.centralStim = [1/2*expinfo.maxX 1/2*expinfo.maxY]; 

expinfo.centralStimRange = [expinfo.centralStim(1)-1/2*expinfo.lengthText expinfo.centralStim(2)-1/2*expinfo.widthText ...
    expinfo.centralStim(1)+1/2*expinfo.lengthText expinfo.centralStim(2)+1/2*expinfo.widthText];  % Umriss auf dem Bildschirm der kleinen Bilder

expinfo.centralStimRange_Pic = [expinfo.centralStim(1)-1/2*expinfo.lengthPic expinfo.centralStim(2)-1/2*expinfo.widthPic ...
    expinfo.centralStim(1)+1/2*expinfo.lengthPic expinfo.centralStim(2)+1/2*expinfo.widthPic];  % Umriss auf dem Bildschirm der kleinen Bilder

expinfo.RangeRespGrid1 = [expinfo.centralResp1(1)-1/2*expinfo.lengthText expinfo.centralResp1(2)-1/2*expinfo.widthText ...
    expinfo.centralResp1(1)+1/2*expinfo.lengthText expinfo.centralResp1(2)+1/2*expinfo.widthText];  % Umriss auf dem Bildschirm der kleinen Bilder; Reihe 1 von links nach rechts
expinfo.RangeRespGrid2 = [expinfo.centralResp2(1)-1/2*expinfo.lengthText expinfo.centralResp2(2)-1/2*expinfo.widthText ...
    expinfo.centralResp2(1)+1/2*expinfo.lengthText expinfo.centralResp2(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid3 = [expinfo.centralResp3(1)-1/2*expinfo.lengthText expinfo.centralResp3(2)-1/2*expinfo.widthText ...
    expinfo.centralResp3(1)+1/2*expinfo.lengthText expinfo.centralResp3(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid4 = [expinfo.centralResp4(1)-1/2*expinfo.lengthText expinfo.centralResp4(2)-1/2*expinfo.widthText ...
    expinfo.centralResp4(1)+1/2*expinfo.lengthText expinfo.centralResp4(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid5 = [expinfo.centralResp5(1)-1/2*expinfo.lengthText expinfo.centralResp5(2)-1/2*expinfo.widthText ...
    expinfo.centralResp5(1)+1/2*expinfo.lengthText expinfo.centralResp5(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid6 = [expinfo.centralResp6(1)-1/2*expinfo.lengthText expinfo.centralResp6(2)-1/2*expinfo.widthText ...
    expinfo.centralResp6(1)+1/2*expinfo.lengthText expinfo.centralResp6(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid7 = [expinfo.centralResp7(1)-1/2*expinfo.lengthText expinfo.centralResp7(2)-1/2*expinfo.widthText ...
    expinfo.centralResp7(1)+1/2*expinfo.lengthText expinfo.centralResp7(2)+1/2*expinfo.widthText];
expinfo.RangeRespGrid8 = [expinfo.centralResp8(1)-1/2*expinfo.lengthText expinfo.centralResp8(2)-1/2*expinfo.widthText ...
    expinfo.centralResp8(1)+1/2*expinfo.lengthText expinfo.centralResp8(2)+1/2*expinfo.widthText];
expinfo.RangeRespGrid9 = [expinfo.centralResp9(1)-1/2*expinfo.lengthText expinfo.centralResp9(2)-1/2*expinfo.widthText ...
    expinfo.centralResp9(1)+1/2*expinfo.lengthText expinfo.centralResp9(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid10 = [expinfo.centralResp10(1)-1/2*expinfo.lengthText expinfo.centralResp10(2)-1/2*expinfo.widthText ...
    expinfo.centralResp10(1)+1/2*expinfo.lengthText expinfo.centralResp10(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid11 = [expinfo.centralResp11(1)-1/2*expinfo.lengthText expinfo.centralResp11(2)-1/2*expinfo.widthText ...
    expinfo.centralResp11(1)+1/2*expinfo.lengthText expinfo.centralResp11(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid12 = [expinfo.centralResp12(1)-1/2*expinfo.lengthText expinfo.centralResp12(2)-1/2*expinfo.widthText ...
    expinfo.centralResp12(1)+1/2*expinfo.lengthText expinfo.centralResp12(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid13 = [expinfo.centralResp13(1)-1/2*expinfo.lengthText expinfo.centralResp13(2)-1/2*expinfo.widthText ...
    expinfo.centralResp13(1)+1/2*expinfo.lengthText expinfo.centralResp13(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid14 = [expinfo.centralResp14(1)-1/2*expinfo.lengthText expinfo.centralResp14(2)-1/2*expinfo.widthText ...
    expinfo.centralResp14(1)+1/2*expinfo.lengthText expinfo.centralResp14(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid15 = [expinfo.centralResp15(1)-1/2*expinfo.lengthText expinfo.centralResp15(2)-1/2*expinfo.widthText ...
    expinfo.centralResp15(1)+1/2*expinfo.lengthText expinfo.centralResp15(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid16 = [expinfo.centralResp16(1)-1/2*expinfo.lengthText expinfo.centralResp16(2)-1/2*expinfo.widthText ...
    expinfo.centralResp16(1)+1/2*expinfo.lengthText expinfo.centralResp16(2)+1/2*expinfo.widthText]; 


expinfo.RangeRespGrid17 = [expinfo.centralResp17(1)-1/2*expinfo.lengthText expinfo.centralResp17(2)-1/2*expinfo.widthText ...
    expinfo.centralResp17(1)+1/2*expinfo.lengthText expinfo.centralResp17(2)+1/2*expinfo.widthText];
expinfo.RangeRespGrid18 = [expinfo.centralResp18(1)-1/2*expinfo.lengthText expinfo.centralResp18(2)-1/2*expinfo.widthText ...
    expinfo.centralResp18(1)+1/2*expinfo.lengthText expinfo.centralResp18(2)+1/2*expinfo.widthText];
expinfo.RangeRespGrid19 = [expinfo.centralResp19(1)-1/2*expinfo.lengthText expinfo.centralResp19(2)-1/2*expinfo.widthText ...
    expinfo.centralResp19(1)+1/2*expinfo.lengthText expinfo.centralResp19(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid20 = [expinfo.centralResp20(1)-1/2*expinfo.lengthText expinfo.centralResp20(2)-1/2*expinfo.widthText ...
    expinfo.centralResp20(1)+1/2*expinfo.lengthText expinfo.centralResp20(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid21 = [expinfo.centralResp21(1)-1/2*expinfo.lengthText expinfo.centralResp21(2)-1/2*expinfo.widthText ...
    expinfo.centralResp21(1)+1/2*expinfo.lengthText expinfo.centralResp21(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid22 = [expinfo.centralResp22(1)-1/2*expinfo.lengthText expinfo.centralResp22(2)-1/2*expinfo.widthText ...
    expinfo.centralResp22(1)+1/2*expinfo.lengthText expinfo.centralResp22(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid23 = [expinfo.centralResp23(1)-1/2*expinfo.lengthText expinfo.centralResp23(2)-1/2*expinfo.widthText ...
    expinfo.centralResp23(1)+1/2*expinfo.lengthText expinfo.centralResp23(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid24 = [expinfo.centralResp24(1)-1/2*expinfo.lengthText expinfo.centralResp24(2)-1/2*expinfo.widthText ...
    expinfo.centralResp24(1)+1/2*expinfo.lengthText expinfo.centralResp24(2)+1/2*expinfo.widthText]; 
expinfo.RangeRespGrid25 = [expinfo.centralResp25(1)-1/2*expinfo.lengthText expinfo.centralResp25(2)-1/2*expinfo.widthText ...
    expinfo.centralResp25(1)+1/2*expinfo.lengthText expinfo.centralResp25(2)+1/2*expinfo.widthText]; 

% expinfo.RangeRespGrid26 = [expinfo.centralResp26(1)-1/2*expinfo.lengthText expinfo.centralResp26(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp26(1)+1/2*expinfo.lengthText expinfo.centralResp26(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid27 = [expinfo.centralResp27(1)-1/2*expinfo.lengthText expinfo.centralResp27(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp27(1)+1/2*expinfo.lengthText expinfo.centralResp27(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid28 = [expinfo.centralResp28(1)-1/2*expinfo.lengthText expinfo.centralResp28(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp28(1)+1/2*expinfo.lengthText expinfo.centralResp28(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid29 = [expinfo.centralResp29(1)-1/2*expinfo.lengthText expinfo.centralResp29(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp29(1)+1/2*expinfo.lengthText expinfo.centralResp29(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid30 = [expinfo.centralResp30(1)-1/2*expinfo.lengthText expinfo.centralResp30(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp30(1)+1/2*expinfo.lengthText expinfo.centralResp30(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid31 = [expinfo.centralResp31(1)-1/2*expinfo.lengthText expinfo.centralResp31(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp31(1)+1/2*expinfo.lengthText expinfo.centralResp31(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid32 = [expinfo.centralResp32(1)-1/2*expinfo.lengthText expinfo.centralResp32(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp32(1)+1/2*expinfo.lengthText expinfo.centralResp32(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid33 = [expinfo.centralResp33(1)-1/2*expinfo.lengthText expinfo.centralResp33(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp33(1)+1/2*expinfo.lengthText expinfo.centralResp33(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid34 = [expinfo.centralResp34(1)-1/2*expinfo.lengthText expinfo.centralResp34(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp34(1)+1/2*expinfo.lengthText expinfo.centralResp34(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid35 = [expinfo.centralResp35(1)-1/2*expinfo.lengthText expinfo.centralResp35(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp35(1)+1/2*expinfo.lengthText expinfo.centralResp35(2)+1/2*expinfo.widthText]; 
% expinfo.RangeRespGrid36 = [expinfo.centralResp36(1)-1/2*expinfo.lengthText expinfo.centralResp36(2)-1/2*expinfo.widthText ...
%     expinfo.centralResp36(1)+1/2*expinfo.lengthText expinfo.centralResp36(2)+1/2*expinfo.widthText]; 


%% Colors and Fonts for Text & Stimuli

expinfo.Colors.stimColor = [255 255 255];
expinfo.Colors.bgColor = [0 0 0];
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
  fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
    'Subject','TrialNum','SetSize', 'n_DIP_total',...
    'n_DIP_Pos1', 'n_DIP_Pos2', 'n_DIP_Pos3', 'n_DIP_Pos4', 'n_DIP_Pos5',... 
    'Grid_Pos1_ACC','Grid_Pos2_ACC','Grid_Pos3_ACC', ...
    'Grid_Pos4_ACC','Grid_Pos5_ACC',...
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
  fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
    'Subject','TrialNum','SetSize', 'n_DIP_total',...
    'n_DIP_Pos1', 'n_DIP_Pos2', 'n_DIP_Pos3', 'n_DIP_Pos4', 'n_DIP_Pos5',... 
    'Grid_Pos1_ACC','Grid_Pos2_ACC','Grid_Pos3_ACC', ...
    'Grid_Pos4_ACC','Grid_Pos5_ACC',...
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
    fprintf(fid, '%1s %2s %3s %4s %5s %6s %7s %8s %9s %10s\n','SubjectNr.','Name','FirstName','Age','Sex','Occupation','Handedness',"Motivation","Difficulty",'Contact');
    fclose(fid);
end





