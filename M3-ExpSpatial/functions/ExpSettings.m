% Thb vis function loads all settings for the experiment

function expinfo = ExpSettings(expinfo)
%% Some general info about the experiment
expinfo.TaskName = 'M3_Spatial Task';

%% Get Date an time for this session
expinfo.DateTime = datetime('now');

expinfo.DateTime.Format = 'dd-MMM-yyyy';
expinfo.Date = cellstr(expinfo.DateTime);
expinfo.Date = expinfo.Date{1};

expinfo.DateTime.Format = 'hh:mm:ss';
expinfo.Time = cellstr(expinfo.DateTime);
expinfo.Time = expinfo.Time{1};

%% Specify Stimulus and Text properties (Size Position etc.)
expinfo.stimulussize = 20; % in Pixel bzw. Point
expinfo.BoxSize = [0 0 0.05*expinfo.maxX 0.05*expinfo.maxY]; % Box-size with 5% of screen size
expinfo.RespWindow = 1:16;

%Specify Trial Numbers
expinfo.nPracTrials = 10;
expinfo.nExpTrials = 70;

% Specify after how many trials in the experimental blocks there will be a break
expinfo.Trials2Pause = floor(expinfo.nExpTrials*0.20);

%% Colors

%% Colors for Background and basic screening

expinfo.Colors.white = [255 255 255];
expinfo.Colors.black = [0 0 0];
expinfo.Colors.bgColor = [89 89 89];
expinfo.Colors.green =  [0 178 30];
expinfo.Colors.red = [255 25 32];
expinfo.Colors.MaskColor = [144 144 144];

% Load Luminance and Distance controlled Stim Colors
% opts = detectImportOptions('Stimuli/stim_colors_v3.csv');
% varNames = opts.VariableNames;
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["R", "G", "B", "brightness", "class"];
opts.VariableTypes = ["double", "double", "double", "double", "categorical"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties

opts = setvaropts(opts, ["R", "G", "B", "brightness"], "DecimalSeparator", ",");
opts = setvaropts(opts, ["R", "G", "B", "brightness"], "ThousandsSeparator", ".");

expinfo.StimColors = readtable('Stimuli/stim_colors_final.csv',opts);

% Convert to RGB
expinfo.StimColors.R = round(expinfo.StimColors{:,1} * 255);
expinfo.StimColors.G = round(expinfo.StimColors{:,2} * 255);
expinfo.StimColors.B = round(expinfo.StimColors{:,3} * 255);



%% Secify number of general instruction slides
if expinfo.Cond == 0 || expinfo.Cond == 1

    expinfo.InstStop = 8;

elseif expinfo.Cond == 2

    expinfo.InstStop = 8;

end

%% Timing - Intervals
expinfo.FreeTime = 0.2; % Inter Stimuli Interval time between Different Memory Items for Pre Cue Conditions
expinfo.CueMemInt = 0;
expinfo.ITI = 1.5;
expinfo.CueInt = 1;

%% Timing - Presentation Time

expinfo.FixTime = 0.500; % Time of Fixation Cross
expinfo.MaskTime = 0.300;
expinfo.ArrayTime = 1.3; %300 std.
expinfo.ArrayTime_fix = 0.100;
expinfo.CueTime = 0.300; % 500 std.
expinfo.FeedbackDuration = 2;
expinfo.MaxRTSec = 1.2;


%% Experimental Manipulations

expinfo.GridSize =20;
expinfo.SetSize = 5;
expinfo.NPLs = expinfo.GridSize-expinfo.SetSize*2;
expinfo.GridPositions = [1:expinfo.GridSize];

expinfo.ColorIndex = 1:height(expinfo.StimColors);
expinfo.StimClass = [0 1];
expinfo.PositionIndex = [1 2 3 4]; % horz-left horz-right vert-left vert-right

expinfo.MemPosition = ["left","right","up","down"];
expinfo.CueOrientation = ["horz","vert"];
expinfo.CueCond = ["pre","post"];

% Free Time for PostCue Block
% short = 0 s;
% long = 1.5s;

expinfo.FT = [0.2, 0.8];



%% Specify Response Keys used in the experiment
expinfo.LeftKey = 'LeftArrow';
expinfo.RightKey = 'RightArrow';
expinfo.RespKeys = {'d' 'l'};
expinfo.AbortKey = 'F12';


%% Define needed Coordinates
%% Basic Coordinates and Sizes
% Length of Circle Rect
expinfo.circleframeX = 50;
expinfo.circleframeY = 50;

% Define Position Center for each Stimulus in the Memory Array
expinfo.center = [expinfo.maxX *0.5 expinfo.maxY * 0.5];

expinfo.center_right = [expinfo.center(1) + 300  expinfo.center(2)];
expinfo.center_left = [expinfo.center(1) - 300  expinfo.center(2)];

expinfo.center_top = [expinfo.center(1)  expinfo.center(2) + 300 ];
expinfo.center_buttom = [expinfo.center(1)  expinfo.center(2) - 300];

% Fixation Cross Start and end Points
% Fix Start and end Points
x_fix = [35 -35; 0 0];
y_fix = [0 0; 35 -35];

expinfo.fix = [x_fix y_fix];

% Rect for Bullseye
expinfo.rect_bull = [expinfo.center(1)-35 expinfo.center(2)-35 ...
    expinfo.center(1)+35 expinfo.center(2)+35];

% Bullseye Dimensions

expinfo.bullseye = [expinfo.center(1)-5 expinfo.center(2)-5 ...
    expinfo.center(1)+5 expinfo.center(2)+5];


%% Cue Start and end Points
% Horizontal Cue
x_horz = [100 -100; 0 0];
y_horz = [0 0; 50 -50];

expinfo.cue_horz = [x_horz y_horz];
% Vertical Cue
x_vert = [50 -50; 0 0];
y_vert = [0 0; 100 -100];

expinfo.cue_vert= [x_vert y_vert];

%% Cirlce Rects for Memory Array
expinfo.rect_right = [expinfo.center_right(1)-expinfo.circleframeX expinfo.center_right(2)-expinfo.circleframeY ...
    expinfo.center_right(1)+expinfo.circleframeX expinfo.center_right(2)+expinfo.circleframeY];

expinfo.rect_left = [expinfo.center_left(1)-expinfo.circleframeX expinfo.center_left(2)-expinfo.circleframeY ...
    expinfo.center_left(1)+expinfo.circleframeX expinfo.center_left(2)+expinfo.circleframeY];

expinfo.rect_top = [expinfo.center_top(1)-expinfo.circleframeX expinfo.center_top(2)-expinfo.circleframeY ...
    expinfo.center_top(1)+expinfo.circleframeX expinfo.center_top(2)+expinfo.circleframeY];

expinfo.rect_buttom = [expinfo.center_buttom(1)-expinfo.circleframeX expinfo.center_buttom(2)-expinfo.circleframeY ...
    expinfo.center_buttom(1)+expinfo.circleframeX expinfo.center_buttom(2)+expinfo.circleframeY];

expinfo.rect_center = [expinfo.center(1)-25 expinfo.center(2)-25 ...
    expinfo.center(1)+25 expinfo.center(2)+25];






%% Positions for response Grids

% Calculate Coordinates

nCircles = expinfo.GridSize;  % how many equally spaced circles?
MemoryRadius = expinfo.centerX/2.5; % radius, in Pixels

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

    expinfo.Coord(i,:)=[Coords(i,1)-expinfo.circleframeX Coords(i,2)-expinfo.circleframeY ...
        Coords(i,1)+expinfo.circleframeX Coords(i,2)+expinfo.circleframeY];
end


%% Specify Instruction folder - conditional on operating system & language settings
switch computer
    case 'MACI64'
        if expinfo.Cond == 0
            expinfo.InstFolder = 'Instructions/PreCue/';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles/PreCue/';

        elseif expinfo.Cond== 1
            expinfo.InstFolder = 'Instructions/PostCue/';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles/PostCue/';

        elseif expinfo.Cond== 2
            expinfo.InstFolder = 'Instructions/Mixed/';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles/Mixed/';
        end
    case 'PCWIN'
        if expinfo.Cond == 0
            expinfo.InstFolder = 'Instructions\PreCue\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\PreCue\';

        elseif expinfo.Cond== 1
            expinfo.InstFolder = 'Instructions\PostCue\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\PostCue\';

        elseif expinfo.Cond== 2
            expinfo.InstFolder = 'Instructions\Mixed\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\Mixed\';
        end
    case 'PCWIN64'
        if expinfo.Cond == 0
            expinfo.InstFolder = 'Instructions\PreCue\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\PreCue\';

        elseif expinfo.Cond== 1
            expinfo.InstFolder = 'Instructions\PostCue\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\PostCue\';

        elseif expinfo.Cond== 2
            expinfo.InstFolder = 'Instructions\Mixed\';
            expinfo.InstExtension = '.jpg';
            expinfo.DataFolder = 'DataFiles\Mixed\';
        end
end



%% datafiles and messages
pracFile_pre = '_pre_prac.txt'; % extension for the practice trial data
pracFile_post = '_post_prac.txt'; % extension for the practice trial data
pracFile_mixed  = '_mixed_prac.txt';  % extension fot the experimental trial data

expFile_pre  = '_pre_exp.txt';  % extension fot the experimental trial data
expFile_post  = '_post_exp.txt';  % extension fot the experimental trial data
expFile_mixed  = '_mixed_exp.txt';  % extension fot the experimental trial data

bFile = '_bio.txt'; % biographical information

%% Adjusting the file-names to a different name for each subject and block condition

expinfo.pracFile_pre = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile_pre];
expinfo.pracFile_post = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile_post];
expinfo.pracFile_mixed = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),pracFile_mixed];

expinfo.expFile_pre  = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile_pre];
expinfo.expFile_post  = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile_post];
expinfo.expFile_mixed  = [expinfo.DataFolder,expinfo.TaskName,'_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),expFile_mixed];


expinfo.bFile = [expinfo.DataFolder expinfo.TaskName, bFile]; %extension for biofile


%% Prepare Datafiles for different Experimental Blocks

if expinfo.Cond == 0

    fid = fopen(expinfo.expFile_pre,'w');
    fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s\n', ...
        'Subject','TrialNum','SetSize','CueCondition', ...
        'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
        'Pos1_RT','Pos2_RT','Pos3_RT', 'Pos4_RT','Pos5_RT',...
        'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
        'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
        'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
        'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
        'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
        'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

    fclose(fid);

    if expinfo.doPractice == 1

        fid = fopen(expinfo.pracFile_pre,'w');
        fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s\n', ...
            'Subject','TrialNum','SetSize','CueCondition', ...
            'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
            'Pos1_RT','Pos2_RT','Pos3_RT','Pos4_RT','Pos5_RT',...
            'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
            'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
            'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
            'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
            'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
            'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

        fclose(fid);
    end

elseif expinfo.Cond == 1

    fid = fopen(expinfo.expFile_post,'w');
    fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
        'Subject','TrialNum','SetSize','CueCondition','FreeTime', ...
        'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
        'Pos1_RT','Pos2_RT','Pos3_RT', 'Pos4_RT','Pos5_RT',...
        'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
        'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
        'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
        'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
        'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
        'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

    fclose(fid);

    if expinfo.doPractice == 1

        fid = fopen(expinfo.pracFile_post,'w');
        fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
            'Subject','TrialNum','SetSize','CueCondition','FreeTime', ...
            'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
            'Pos1_RT','Pos2_RT','Pos3_RT', 'Pos4_RT','Pos5_RT',...
            'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
            'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
            'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
            'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
            'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
            'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

    end

elseif expinfo.Cond == 2

    fid = fopen(expinfo.expFile_mixed,'w');
    fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
        'Subject','TrialNum','SetSize','CueCondition','FreeTime', ...
        'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
        'Pos1_RT','Pos2_RT','Pos3_RT', 'Pos4_RT','Pos5_RT',...
        'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
        'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
        'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
        'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
        'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
        'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

    fclose(fid);

    if expinfo.doPractice == 1
        fprintf(fid, '%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s %10$s %11$s %12$s %13$s %14$s %15$s %16$s %17$s %18$s %19$s %20$s %21$s %22$s %23$s %24$s %25$s %26$s %27$s %28$s %29$s %30$s %31$s %32$s %33$s %34$s %35$s %36$s %37$s %38$s %39$s %40$s %41$s %42$s %43$s %44$s %45$s %46$s %47$s\n', ...
            'Subject','TrialNum','SetSize','CueCondition','FreeTime', ...
            'Pos1_ACC','Pos2_ACC','Pos3_ACC','Pos4_ACC','Pos5_ACC',...
            'Pos1_RT','Pos2_RT','Pos3_RT', 'Pos4_RT','Pos5_RT',...
            'Chosen_IIP_Pos1','Chosen_IOP_Pos1', 'Chosen_DIP_Pos1', 'Chosen_DIOP_Pos1', 'Chosen_NPL_Pos1',...
            'Chosen_IIP_Pos2','Chosen_IOP_Pos2', 'Chosen_DIP_Pos2', 'Chosen_DIOP_Pos2', 'Chosen_NPL_Pos2',...
            'Chosen_IIP_Pos3','Chosen_IOP_Pos3', 'Chosen_DIP_Pos3', 'Chosen_DIOP_Pos3', 'Chosen_NPL_Pos3',...
            'Chosen_IIP_Pos4','Chosen_IOP_Pos4', 'Chosen_DIP_Pos4', 'Chosen_DIOP_Pos4', 'Chosen_NPL_Pos4',...
            'Chosen_IIP_Pos5','Chosen_IOP_Pos5', 'Chosen_DIP_Pos5', 'Chosen_DIOP_Pos5', 'Chosen_NPL_Pos5',...
            'SumACC','IIP','IOP','DIP','DIOP','NPLs','Misses');

    end
end
%% Write Bio file if non existant
if exist(expinfo.bFile,'file') == 0
    fid = fopen(expinfo.bFile,'w');
    fprintf(fid, '%1s %2s %3s %4s %5s %6s %7s %8s\n','SubjectNr.','Name','FirstName','Age','Sex','Occupation','Handedness','Contact');
    fclose(fid);
end

end




