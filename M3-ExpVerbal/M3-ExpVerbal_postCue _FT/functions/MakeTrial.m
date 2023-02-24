% This function generates a trial list from the specified Trial
% configurations in the expinfo. Alternatively, we can specify the Trial
% configurations here if there is more complex things to do...

function [Trial, expinfo] = MakeTrial(expinfo, isPractice, isShort)
%% Trial Configurations
% First, we need to obtain the trial configurations crossing all
% experimental conditions

%% Defining trials to be conducted
% Specify how many practice trials should be conducted
if isPractice == 1

    expinfo.nTrials = expinfo.nPracTrials;


else

    expinfo.nTrials = expinfo.nExpTrials;

end

% Specify how many Trials in each block of the experiment will be conducted

if isShort == 1

    expinfo.nTrials = expinfo.nTrials /5;
else

    expinfo.nTrials = expinfo.nTrials;
end


%% Specify Stimuli to be shown, only words with up to 10 letters


Words = table2cell(readtable(expinfo.stimfile));
letter_count = num2cell(cellfun(@length, Words));

Words = [Words, letter_count(:,2)];
Words = Words([Words{:,4}]>5, :);

Words = Words([Words{:,4}]<=10, :);
%% Determine additional Information for each Trial
% Third and final, we need to specify all necessary information from the
% Response Grid Coordinates

expinfo.Coord  = [4/16*expinfo.maxX 5/6*expinfo.maxY;...
    6/16*expinfo.maxX 5/6*expinfo.maxY;...
    8/16*expinfo.maxX 5/6*expinfo.maxY;...
    10/16*expinfo.maxX 5/6*expinfo.maxY;...
    12/16*expinfo.maxX 5/6*expinfo.maxY;...

    4/16*expinfo.maxX 4/6*expinfo.maxY;...
    6/16*expinfo.maxX 4/6*expinfo.maxY;...
    8/16*expinfo.maxX 4/6*expinfo.maxY;...
    10/16*expinfo.maxX 4/6*expinfo.maxY;...
    12/16*expinfo.maxX 4/6*expinfo.maxY;...

    4/16*expinfo.maxX 3/6*expinfo.maxY;...
    6/16*expinfo.maxX 3/6*expinfo.maxY;...
    8/16*expinfo.maxX 3/6*expinfo.maxY;...
    10/16*expinfo.maxX 3/6*expinfo.maxY;...
    12/16*expinfo.maxX 3/6*expinfo.maxY;...


    4/16*expinfo.maxX 2/6*expinfo.maxY;...
    6/16*expinfo.maxX 2/6*expinfo.maxY;...
    8/16*expinfo.maxX 2/6*expinfo.maxY;...
    10/16*expinfo.maxX 2/6*expinfo.maxY;...
    12/16*expinfo.maxX 2/6*expinfo.maxY;...

    4/16*expinfo.maxX 1/6*expinfo.maxY;...
    6/16*expinfo.maxX 1/6*expinfo.maxY;...
    8/16*expinfo.maxX 1/6*expinfo.maxY;...
    10/16*expinfo.maxX 1/6*expinfo.maxY;...
    12/16*expinfo.maxX 1/6*expinfo.maxY];


%% Pre Define Sample Matrices for over all balancing of Factors

lat = ["left";"right"];
matrix_laterality = (repmat(lat, expinfo.nTrials*expinfo.SetSize,1));
sample_lat = matrix_laterality(randperm(size(matrix_laterality, 1)),:);

% Sample Matrixm for Balanced Freetime Conditions
matrix_ft = (repmat(expinfo.FT, expinfo.nTrials/2,1));
sample_ft = matrix_ft(randperm(size(matrix_ft, 1)),:);

for trial = 1:expinfo.nTrials
    % Speichern der TrialNummer
    Trial(trial).TrialNum = trial;
    Trial(trial).SetSize = expinfo.SetSize;
    %Trial(trial).FT = expinfo.FT;
    
    % Sample Rows from Sample Matrix and save FT in Trial Object

    FT_Index = randsample(1:length(sample_ft), 1);
    Trial(trial).FT = sample_ft(FT_Index,1);

    % Remove Sampled Rows from Object for next iteration

    sample_ft(FT_Index,:) = [];

    %% Sample Words, Scrambles and Correct Size from Stimfile
    Stims = randsample(1:length(Words), expinfo.SetSize*2);
    Trial(trial).Stims = Words(Stims,2);

    % Scramble Words for every MemStim
    for i = 1:expinfo.SetSize*2
        string = Trial(trial).Stims{i};
        scrambledString = [];
        while length(string) > 0
            % Get a random location in string.
            index = randi(length(string), 1);
            % Append that to scrambledString.
            scrambledString = [scrambledString, string(index)];
            % Remove that letter from string.
            string(index) = [];
        end
        Trial(trial).ScrambledStims{i}  = scrambledString;
    end

    NPLs = randsample(1:length(Words), expinfo.NPLs);
    Trial(trial).NPLs = Words(NPLs,2);




    %% Ensure that there are no double Words within a trial

    while any(ismember(Trial(trial).Stims, Trial(trial).NPLs))

        NPLs = randsample(1:length(Words), 15);
        Trial(trial).NPLs = Words(NPLs,2);

    end

    %% Sample Laterality for all Stims

    % Sample Rows from Sample Matrix and save Laterality in Trial Object

    Lat_Index = randsample(1:length(sample_lat), expinfo.SetSize*2);
    Trial(trial).LateralityStims = sample_lat(Lat_Index,1);

    % Remove Sampled Rows from Object for next iteration

    sample_lat(Lat_Index,:) = [];


    %% Order of Mem and Distractor Items
    % Fully randomized for the post-cue condition

    for i = 1:expinfo.SetSize*2

        Trial(trial).StimOrder(i) = randsample(expinfo.RetroStimClass, 1,  true);

    end


    while sum(Trial(trial).StimOrder) ~= expinfo.SetSize

        for i = 1:expinfo.SetSize*2

            Trial(trial).StimOrder(i) = randsample(expinfo.RetroStimClass, 1,  true);

        end
    end

% Assign Stims to Categories Mems or Lures

for i=1:expinfo.SetSize*2

    if Trial(trial).StimOrder(i) == 1

        Trial(trial).MemStims(i,1) = Trial(trial).Stims(i);

    else

     Trial(trial).LureStims(i,1) = Trial(trial).Stims(i);   
     
    end

end
    %% Response Positions in Recall Grid


    Trial(trial).ResponsePositions = randsample(expinfo.RespWindow,length(expinfo.RespWindow));
    % Positionen auf welchen der Reihe nach die Stimului von Trial(trial).Presentation presentiert werden

    Trial(trial).GridPos = Trial(trial).ResponsePositions(1:expinfo.SetSize*2);
    

    % Coordinates for all Stimuli
    Trial(trial).GridCoordStims = expinfo.Coord(Trial(trial).GridPos,:);
    
    % Assign Coordinates and Grid Positions for every Stim
    
    PosIndex_IIP = find(Trial(trial).StimOrder);
    Trial(trial).Corr_Pos = Trial(trial).ResponsePositions(PosIndex_IIP);
    Dist_Pos = find(~Trial(trial).StimOrder);
    Trial(trial).Dist_Pos = Trial(trial).ResponsePositions(Dist_Pos);



    %% Correct Size for ordered pairs of Stimuli (Mem and Lurestims

    % Read Correct Answer from Wordlist and Write to Triallist

    Trial(trial).CorrSize = cell2mat(Words(Stims,1));


    % Assign Correct Keys to answers

    for i = 1:length(Trial(trial).CorrSize)

        if Trial(trial).CorrSize(i) == 1 % If greater than a football

            Trial(trial).CorrRespSize(i) = 'l';

        else
            Trial(trial).CorrRespSize(i) = 'd'; % If smaller then football
        end
    end


    %% Assign Positions for every shown Stimuli and Response Fields for all Response Categories

    % For IOP of every Position

    for j = 1:expinfo.SetSize


        Pos_IndexIOP = find(Trial(trial).StimOrder);

        Pos_IndexIOP(j) = [];

        IOP_Pos_Index(j,:) = Pos_IndexIOP;

        Trial(trial).IOP_Pos(j,:)= Trial(trial).ResponsePositions(Pos_IndexIOP);

    end


   %% DIP Categories for every Position. Either a DIP for one or two postions.

    Trial(trial).n_DIP_Pos =[0 0 0 0 0 0 0 0 0 0 0 0];


    for i=1:expinfo.SetSize*2

        if i < expinfo.SetSize*2 && i > 1

            if Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i-1) == 1 && Trial(trial).StimOrder(i+1) == 0

                Trial(trial).Pos_IndexDIP(i) = "post";
                Trial(trial).n_DIP_Pos(i-1) = Trial(trial).n_DIP_Pos(i-1) + 1;


            elseif  Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i+1) == 1 && Trial(trial).StimOrder(i-1) == 0

                Trial(trial).Pos_IndexDIP(i) = "pre";
                Trial(trial).n_DIP_Pos(i+1) = Trial(trial).n_DIP_Pos(i-1) + 1;


            elseif  Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i+1) == 1 && Trial(trial).StimOrder(i-1) == 1

                Trial(trial).Pos_IndexDIP(i) = "dual";

                Trial(trial).n_DIP_Pos(i-1) = Trial(trial).n_DIP_Pos(i-1) + 1;
                Trial(trial).n_DIP_Pos(i+1) = Trial(trial).n_DIP_Pos(i+1) + 1;


            elseif  Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i+1) == 0 && Trial(trial).StimOrder(i-1) == 0

                Trial(trial).Pos_IndexDIP(i) = "Lure";
                Trial(trial).n_DIP_Pos(i+1) = Trial(trial).n_DIP_Pos(i+1) + 0;
                Trial(trial).n_DIP_Pos(i-1) = Trial(trial).n_DIP_Pos(i-1) + 0;

            elseif Trial(trial).StimOrder(i) == 1

                Trial(trial).Pos_IndexDIP(i) = "Mem";

            end

        else
            if i == expinfo.SetSize*2

                if Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i-1) == 1

                    Trial(trial).Pos_IndexDIP(i) = "post";
                    Trial(trial).n_DIP_Pos(i-1) = Trial(trial).n_DIP_Pos(i-1) + 1;

                elseif Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i-1) == 0

                    Trial(trial).Pos_IndexDIP(i) = "Lure";

                elseif Trial(trial).StimOrder(i) == 1

                    Trial(trial).Pos_IndexDIP(i) = "Mem";

                end

            elseif i == 1

                if Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i+1) == 1

                    Trial(trial).Pos_IndexDIP(i) = "pre";
                    Trial(trial).n_DIP_Pos(i+1) = Trial(trial).n_DIP_Pos(i+1) + 1;



                elseif Trial(trial).StimOrder(i) == 0 && Trial(trial).StimOrder(i+1) == 0

                    Trial(trial).Pos_IndexDIP(i) = "Lure";


                elseif Trial(trial).StimOrder(i) == 1

                    Trial(trial).Pos_IndexDIP(i) = "Mem";

                end

            end
        end
    end



    % Count Number of Positions with avaible DIPs in current Trial & DIPs pro
    % Positions

    % Number of Possible DIP at Mem Postion 1 to 5
    Trial(trial).n_DIP_MemSetPos = Trial(trial).n_DIP_Pos(PosIndex_IIP);

    % Postions of all Distractors

    Pos_IndexDIP_Pos = find(Trial(trial).Pos_IndexDIP ~= "Mem" & Trial(trial).Pos_IndexDIP ~= "Lure");
    Pos_IndexIIP_Pos = find(Trial(trial).Pos_IndexDIP == "Mem");

    %Total Number of DIPs in a Trial
    
    Trial(trial).n_DIP_total = sum(Trial(trial).n_DIP_MemSetPos);
   
%% Define DIP Vectors Indices for every Position


DIP = zeros(5,3);

for i = 1:expinfo.SetSize*2
    
    if i > 1 && i < expinfo.SetSize*2
        
        if Trial(trial).StimOrder(i) == 1
            
            if Trial(trial).StimOrder(i-1) == 0 && Trial(trial).StimOrder(i+1) == 0
                
                DIP(i,1) = i;
                DIP(i,2) = Trial(trial).ResponsePositions(i-1);
                DIP(i,3) = Trial(trial).ResponsePositions(i+1);
                
                
            elseif Trial(trial).StimOrder(i-1) == 0 && Trial(trial).StimOrder(i+1) == 1
                
                DIP(i,1) = i;
                DIP(i,2) = Trial(trial).ResponsePositions(i-1);
                
                
            elseif Trial(trial).StimOrder(i-1) == 1 && Trial(trial).StimOrder(i+1) == 0
                
                DIP(i,1) = i;
                DIP(i,2) = Trial(trial).ResponsePositions(i+1);
                
                
            elseif Trial(trial).StimOrder(i-1) == 1 && Trial(trial).StimOrder(i+1) == 1
                
                DIP(i,1) = i;
                DIP(i,2) = 0;
                DIP(i,3) = 0;
                
            end
            
        else
            
            DIP(i,1) = 0;
            DIP(i,2) = 0;
            DIP(i,3) = 0;
            
        end
        
    elseif i == 1
        
        if Trial(trial).StimOrder(i) == 1 && Trial(trial).StimOrder(i+1) == 0
            
            DIP(i,1) = i;
            DIP(i,2) = Trial(trial).ResponsePositions(i+1);

        elseif Trial(trial).StimOrder(i) == 0

            DIP(i,1) = 0;
            DIP(i,2) = 0;
            DIP(i,3) = 0;

        elseif Trial(trial).StimOrder(i+1) == 1

            DIP(i,1) = i;
            DIP(i,2) = 0;
            DIP(i,3) = 0;
            
        end
        
    elseif i == expinfo.SetSize*2
        
        if Trial(trial).StimOrder(i) == 1 && Trial(trial).StimOrder(i-1) == 0
            
            DIP(i,1) = i;
            DIP(i,2) = Trial(trial).ResponsePositions(i-1);
            
        elseif Trial(trial).StimOrder(i) == 0

            DIP(i,1) = 0;
            DIP(i,2) = 0;
            DIP(i,3) = 0;

        elseif Trial(trial).StimOrder(i-1) == 1

            DIP(i,1) = i;
            DIP(i,2) = 0;
            DIP(i,3) = 0;

        end
        
    end
end

DIP( ~any(DIP,2), : ) = [];
DIP(:,1) = [];
Trial(trial).DIP_Pos = DIP;

    %% Define DIOP Vectors Indices for every Position

    Pos_IndexDIOP_Pos = zeros(5,5);
    
    
    for j = 1:expinfo.SetSize*2
        if j < expinfo.SetSize*2 && j > 1
            
            if Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) == "Mem" ...
                    && Trial(trial).Pos_IndexDIP(j+1) == "Mem"
                
                DIOPs = find(Trial(trial).Pos_IndexDIP ~= "Mem");
                DIOPs = Trial(trial).ResponsePositions(DIOPs);
                Pos_IndexDIOP_Pos(j,:) = DIOPs;
                
            elseif  Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) == "Mem" && ...
                    Trial(trial).Pos_IndexDIP(j+1) ~= "Mem"
                
                DIP_Helper = Trial(trial).Pos_IndexDIP;
                DIP_Helper(j+1) = ["Mem"];
                DIOPs = find(DIP_Helper ~= "Mem");
                DIOPs = Trial(trial).ResponsePositions(DIOPs);
                
                
                Pos_IndexDIOP_Pos(j,1:length(DIOPs)) = DIOPs;
                
            elseif  Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) ~= "Mem" && ...
                    Trial(trial).Pos_IndexDIP(j+1) == "Mem"
                
                DIP_Helper = Trial(trial).Pos_IndexDIP;
                DIP_Helper(j-1) = ["Mem"];
                DIOPs = find(DIP_Helper ~= "Mem");
                DIOPs = Trial(trial).ResponsePositions(DIOPs);
                
                
                Pos_IndexDIOP_Pos(j,1:length(DIOPs)) = DIOPs;
                
            elseif  Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) ~= "Mem" && ...
                    Trial(trial).Pos_IndexDIP(j+1) ~= "Mem"
                
                DIP_Helper = Trial(trial).Pos_IndexDIP;
                DIP_Helper(j-1) = ["Mem"];
                DIP_Helper(j+1) = ["Mem"];
                DIOPs = find(DIP_Helper ~= "Mem");
                DIOPs = Trial(trial).ResponsePositions(DIOPs);
                
                Pos_IndexDIOP_Pos(j,1:length(DIOPs)) = DIOPs;
            end
            
        else
            if j == 1
                
                if Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j+1) == "Mem"
                    
                    DIOPs = find(Trial(trial).Pos_IndexDIP ~= "Mem");
                    DIOPs = Trial(trial).ResponsePositions(DIOPs);
                    Pos_IndexDIOP_Pos(j,:) = DIOPs;
                    
                elseif Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j+1) ~= "Mem"
                    
                    DIP_Helper = Trial(trial).Pos_IndexDIP;
                    DIP_Helper(j+1) = ["Mem"];
                    DIOPs = find(DIP_Helper ~= "Mem");
                    DIOPs = Trial(trial).ResponsePositions(DIOPs);
                    
                    
                    Pos_IndexDIOP_Pos(j,1:length(DIOPs)) = DIOPs;
                end
                
            elseif j == expinfo.SetSize*2
                
                if Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) == "Mem"
                    
                    DIOPs = find(Trial(trial).Pos_IndexDIP ~= "Mem");
                    DIOPs = Trial(trial).ResponsePositions(DIOPs);
                    Pos_IndexDIOP_Pos(j,:) = DIOPs;
                    
                    
                elseif Trial(trial).Pos_IndexDIP(j) == "Mem" && Trial(trial).Pos_IndexDIP(j-1) ~= "Mem"
                    
                    DIP_Helper = Trial(trial).Pos_IndexDIP;
                    DIP_Helper(j-1) = ["Mem"];
                    DIOPs = find(DIP_Helper ~= "Mem");
                    DIOPs = Trial(trial).ResponsePositions(DIOPs);
                    
                    Pos_IndexDIOP_Pos(j,1:length(DIOPs)) = DIOPs;
                end
                
            end
        end
    end
    
    Pos_IndexDIOP_Pos( all(~Pos_IndexDIOP_Pos,2), : ) = [];
    Trial(trial).DIOP_Pos = Pos_IndexDIOP_Pos;
    
    % Assign Grid Positions
    
    % NPLs
    
    UsedPos = [Trial(trial).GridPos];
    Trial(trial).NPL_Pos = setdiff(Trial(trial).ResponsePositions,UsedPos);
    Trial(trial).NPLPosCord = expinfo.Coord(Trial(trial).NPL_Pos,:);


end

clear MemStims LureStims

end


