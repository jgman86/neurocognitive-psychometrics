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
    
    expinfo.nTrials = expinfo.nExpTrials/5;
else
    
    expinfo.nTrials = expinfo.nExpTrials;
end





%% Create Blocklists
% Block 1

% TrialConfiguration_Block1 = BalanceFactors(expinfo.nExpTrials, 0, expinfo.BlockOrd(1));
% 
% % Block 2
% 
% TrialConfiguration_Block2 = BalanceFactors(expinfo.nExpTrials, 0, expinfo.BlockOrd(2));


%% Specify Stimuli to be shown, only words with up to 10 letters

Words = table2cell(readtable(expinfo.stimfile));
letter_count = num2cell(cellfun(@length, Words));

Words = [Words, letter_count(:,2)];
Words = Words([Words{:,4}]>5, :);

Words = Words([Words{:,4}]<=10, :);

%% Determine additional Information for each Trial

%% Pre Define Sample Matrices for over all balancing of Factors

lat = ["left";"right"];

matrix_laterality = (repmat(lat, expinfo.nExpTrials*expinfo.SetSize,1));

sample_lat = matrix_laterality(randperm(size(matrix_laterality, 1)),:);


trial = 1;
for trial = 1:expinfo.nTrials
    % Speichern der TrialNummer
    Trial(trial).TrialNum = trial;
    Trial(trial).CueCondition = "pre";
    
    %% Sample Words, Scrambles and Correct Size from Stimfile
    
    MemStims = randsample(1:length(Words), expinfo.SetSize);
    Trial(trial).MemStims = Words(MemStims,2);
    
    LureStims = randsample(1:length(Words), expinfo.SetSize);
    Trial(trial).LureStims = Words(LureStims,2);
    
    % Scramble Words for every MemStim
    for i = 1:expinfo.SetSize
        string = Trial(trial).MemStims{i};
        scrambledString = [];
        while length(string) > 0
            % Get a random location in string.
            index = randi(length(string), 1);
            % Append that to scrambledString.
            scrambledString = [scrambledString, string(index)];
            % Remove that letter from string.
            string(index) = [];
        end
        Trial(trial).ScrambledMemStims{i}  = scrambledString;
    end
    
    % Scramble Words for every LureStim
    for i = 1:expinfo.SetSize
        string = Trial(trial).LureStims{i};
        scrambledString = [];
        while length(string) > 0
            % Get a random location in string.
            index = randi(length(string), 1);
            % Append that to scrambledString.
            scrambledString = [scrambledString, string(index)];
            % Remove that letter from string.
            string(index) = [];
        end
        Trial(trial).ScrambledLureStims{i}  = scrambledString;
    end
    
    NPLs = randsample(1:length(Words), expinfo.NPLs);
    Trial(trial).NPLs = Words(NPLs,2);
    
    
    
    
    %% Ensure that there are no double Words within a trial
    
    % For Mem and Lurestims
    while any(ismember(Trial(trial).MemStims, Trial(trial).LureStims)) 
        
        LureStims = randsample(1:length(Words), expinfo.SetSize);
        Trial(trial).LureStims = Words(LureStims,2);
        
    end
    
    % For NPL Stims
    
    while any(ismember(Trial(trial).MemStims, Trial(trial).NPLs)) || any(ismember(Trial(trial).LureStims, Trial(trial).NPLs))
        
        NPLs = randsample(1:length(Words), expinfo.NPLs);
        Trial(trial).NPLs = Words(NPLs,2);
        
    end
    
    %% Sample Laterality for all Stims
    
    % Sample Rows from Sampple Matrix and save Laterality in Trial Object
    
    Lat_Index = randsample(1:length(sample_lat), expinfo.SetSize*2);
    Trial(trial).LateralityStims = sample_lat(Lat_Index,1);
    
    % Remove Sampled Rows from Object for next iteration
    
    sample_lat(Lat_Index,:) = [];
    
    % Include Coordinates for left & right for each Stim

    for i=1:expinfo.SetSize*2

        if Trial(trial).LateralityStims(i) == "left"

            Trial(trial).StimLatCoord(i,:) = expinfo.left;
        else
            Trial(trial).StimLatCoord(i,:) = expinfo.right;

        end


    end



    %% Order of Mem and Distractor Items
    % Pseudo randomized for the pre-cue condition
    
    for i = 1:expinfo.SetSize
        
        Trial(trial).StimOrder(:,i) = randsample(expinfo.StimClass, 2,  false);
        
    end
    
    %% Response Positions in Recall Grid
    
    Trial(trial).ResponsePositions = randsample(expinfo.RespWindow,length(expinfo.RespWindow)); % Positionen auf welchen der Reihe nach die Stimului von Trial(trial).Presentation presentiert werden
    
    
    %% Positions of Response Categories
    
    % For all Stims in a Trial
    j = 1;
    
    for i = 1:expinfo.SetSize
        
        if Trial(trial).StimOrder(1,i) == "M"
            
            Trial(trial).CorrRespPos_helper(j) = 1;
            Trial(trial).CorrRespPos_helper(j+1) = 0;
        else
            
            Trial(trial).CorrRespPos_helper(j) = 0;
            Trial(trial).CorrRespPos_helper(j+1) = 1;
        end
        j = j + 2;
    end
    
    
    % For a Position Pack (Mem and Lurestim)
    
    for i = 1:expinfo.SetSize
        
        if Trial(trial).StimOrder(1,i) == "M"
            
            Trial(trial).CorrRespPos(i) = 1;
        else
            
            Trial(trial).CorrRespPos(i) = 0;
        end
    end
    
    
    %% Correct Size for ordered pairs of Stimuli (Mem and Lurestims
    % Read Correct Answers from Wordlist
    
    j = 2;
    k = 1;
    
    for i = 1:expinfo.SetSize
        
        if Trial(trial).CorrRespPos(i) == 1
            
            Order(k) = MemStims(i);
            Order(j) = LureStims(i);
            
        else
            
            Order(j) = MemStims(i);
            Order(k) = LureStims(i);
            
        end
        
        j=j+2;
        k=k+2;
        
    end
    
    % Read Correct Answer from Wordlist and Write to Triallist
    
    Trial(trial).CorrSize = cell2mat(Words(Order,1));
    
    
    % Assign Correct Keys to answers
    
    for i = 1:length(Trial(trial).CorrSize)
        
        if Trial(trial).CorrSize(i) == 1 % If greater than a football
            
            Trial(trial).CorrRespSize(i) = 'l';
            
        else
            Trial(trial).CorrRespSize(i) = 'd'; % If smaller then football
        end
    end
    
    
    %% Assign Positions for every shown Stimuli and Response Fields and define Positions for all Response Categories
    
    % For IIP
    
    PosIndex_IIP = find(Trial(trial).CorrRespPos_helper);
    Trial(trial).Corr_Pos = Trial(trial).ResponsePositions(PosIndex_IIP);
    
    
    % For IOP of every Position
    
    for j = 1:expinfo.SetSize
        
        Pos_IndexIOP = find(Trial(trial).CorrRespPos_helper);
        
        Pos_IndexIOP(j) = [];
        
        IOP_Pos_Index(j,:) = Pos_IndexIOP;
        
        Trial(trial).IOP_Pos(j,:)= Trial(trial).ResponsePositions(Pos_IndexIOP);
        
    end
    
    
    % DIP for every Postion
    
    Pos_IndexDIP_Pos = find(~Trial(trial).CorrRespPos_helper);
    Trial(trial).DIP_Pos = Trial(trial).ResponsePositions(Pos_IndexDIP_Pos);
    
    
    %% Define DIOP Vectors Indices for every Position
    
    
    for j = 1:expinfo.SetSize
        
        Pos_IndexDIOP_Pos = find(~Trial(trial).CorrRespPos_helper);
        
        Pos_IndexDIOP_Pos(j) = [];
        
        DIOP_Pos_Index(j,:) = Pos_IndexDIOP_Pos;
        
        Trial(trial).DIOP_Pos(j,:)= Trial(trial).ResponsePositions(Pos_IndexDIOP_Pos);
        
    end
    
    
    % NPLs
    UsedPos = [horzcat(Trial(trial).Corr_Pos, Trial(trial).DIP_Pos)];
    Trial(trial).NPL_Pos = setdiff(Trial(trial).ResponsePositions,UsedPos);
    
    for i =  1:expinfo.SetSize
        
        Trial(trial).IIPPosCord(i,:) = expinfo.Coord(Trial(trial).Corr_Pos(i),:);
        Trial(trial).IOPPosCord(i,:) = expinfo.Coord(Trial(trial).IOP_Pos(i),:);
        Trial(trial).DIPPosCord(i,:) = expinfo.Coord(Trial(trial).DIP_Pos(i),:);
        Trial(trial).DIOPPosCord(i,:) = expinfo.Coord(Trial(trial).DIOP_Pos(i),:);
    end
    
    for i = 1:expinfo.NPLs
        
        Trial(trial).NPLPosCord(i,:) = expinfo.Coord(Trial(trial).NPL_Pos(i),:);
        
    end
    
end

clear MemStims LureStims

end


