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

    expinfo.nTrials = expinfo.nTrials / 5;

end

%% Sample Matrixes for Cue Condition and Freetime

% Sample Matrixm for Balanced Freetime Conditions
matrix_ft = (repmat(expinfo.FT, expinfo.nTrials/2,1));
sample_ft = matrix_ft(randperm(size(matrix_ft, 1)),:);

% Sample Matrix for Balanced Freetime Conditions
matrix_cue = (repmat(expinfo.CueCondition, expinfo.nTrials/2,1));
sample_cue = matrix_cue(randperm(size(matrix_cue, 1)),:);



%% Specify Stimuli to be shown, only words with up to 10 letters

Words = table2cell(readtable(expinfo.stimfile));
letter_count = num2cell(cellfun(@length, Words));

Words = [Words, letter_count(:,2)];
Words = Words([Words{:,4}]>8, :);

Words = Words([Words{:,4}]<=12, :);

% Number Space without 50
Numbers = (10:99);
Numbers = setdiff(Numbers,50);


%% Determine additional Information for each Trial
%% insert balancing for FT conditions
setsize = expinfo.SetSize;
npls = expinfo.NPLs;

nfiller_trials = ceil(expinfo.nTrials*0.20);
filler_trials = randsample(1:expinfo.nTrials,nfiller_trials);

for trial = 1:expinfo.nTrials+nfiller_trials % ensure 

 % Include Filler Trials for discouraging subjects to anticipate remaining
 % number of items

if any(ismember(trial,filler_trials))

    mat_setsize = setdiff([3:8],expinfo.SetSize)

    setsize = randsample(mat_setsize,1);
    npls = expinfo.GridSize-setsize*2;

else 

    setsize = expinfo.SetSize;
    npls = expinfo.GridSize-setsize*2;
end 

    % Speichern der TrialNummer
    Trial(trial).TrialNum = trial;

    if expinfo.TrialType == 1

        Trial(trial).CueCondition = "pre";
        Trial(trial).FT = expinfo.FT_pre;


    elseif expinfo.TrialType == 2

        Trial(trial).CueCondition = "post";

        % Sample Rows from Sample Matrix and save FT in Trial Object

        FT_Index = randsample(1:length(sample_ft), 1);
        Trial(trial).FT = sample_ft(FT_Index,1);

        % Remove Sampled Rows from Object for next iteration

        sample_ft(FT_Index,:) = [];

    elseif expinfo.TrialType == 3

        % Sample Cue Conditions
        % Sample Rows from Sample Matrix and save FT in Trial Object

        Cue_Index = randsample(1:length(sample_cue), 1);
        Trial(trial).CueCondition = sample_cue(Cue_Index,1);

        % Remove Sampled Rows from Object for next iteration

        sample_cue(Cue_Index,:) = [];

        % Sample Freetime
        % Sample Rows from Sample Matrix and save FT in Trial Object

        FT_Index = randsample(1:length(sample_ft), 1);
        Trial(trial).FT = sample_ft(FT_Index,1);

        % Remove Sampled Rows from Object for next iteration

        sample_ft(FT_Index,:) = [];

    end

    % Save SetSize to Object

    Trial(trial).SetSize = setsize;
    
    % Filler Trials yes or no 

    if any(ismember(trial,filler_trials))

        Trial(trial).FillerTrial = 1;
    else

         Trial(trial).FillerTrial = 0;

    end 


    %% Sample Words Correct Size from Stimfile

    if expinfo.StimType == "Words"

        Stims = randsample(1:length(Words), setsize*2);
        Trial(trial).Stims = Words(Stims,2);

        NPLs = randsample(1:length(Words), npls);
        Trial(trial).NPLs = Words(NPLs,2);

        % Ensure that there are no double Words within a trial TRIAL BEFORE TOO - IMPLEMENT

        while any(ismember(Trial(trial).Stims, Trial(trial).NPLs))

            NPLs = randsample(1:length(Words), npls);
            Trial(trial).NPLs = Words(NPLs,2);

        end


    elseif expinfo.StimType == "Numbers"

        Trial(trial).Stims = randsample(Numbers,setsize*2);
        Trial(trial).NPLs = randsample(Numbers,npls);


        while any(ismember(Trial(trial).Stims, Trial(trial).NPLs))

            NPLs = randsample(Numbers, npls);
            Trial(trial).NPLs = NPLs;

        end

    end


    %% Order of Mem and Distractor Items

    % Ensure there are always n/2 Mem and Distractors
    numMem = setsize;
    numDist = setsize;


    StimOrder = [ones(1, numMem), zeros(1, numDist)]; % Start with n/2 1's and n/2 0's

    % Shuffle the sequence using randperm and check for consecutive occurrences
    while true
        StimOrder = StimOrder(randperm(length(StimOrder)));

        % Check for consecutive occurrences
        consec = diff(find([1, diff(StimOrder) ~= 0, 1])-1);
        if all(consec <= expinfo.max_consec)
            break;
        end
    end



    Trial(trial).StimOrder = StimOrder;

    %% Assign sampled Stims to Categories Mems or Lures

    for i=1:setsize*2

        if Trial(trial).StimOrder(i) == 1

            Trial(trial).MemStims(i,1) = string(Trial(trial).Stims(i));

        else

            Trial(trial).LureStims(i,1) = string(Trial(trial).Stims(i));


        end

    end


    %% Correct Size for ordered pairs of Stimuli (Mem and Lurestims, Words or Numbers)


    if expinfo.StimType == "Words"

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

    elseif expinfo.StimType == "Numbers"

        for i = 1:length(Trial(trial).Stims)

            if  Trial(trial).Stims(i) > 50 % If greater than 50

                Trial(trial).CorrRespSize(i) = 'l';

            else
                Trial(trial).CorrRespSize(i) = 'd'; % If smaller then 50

            end
        end

        Trial(trial).Stims = arrayfun(@num2str,Trial(trial).Stims , 'UniformOutput', 0);

        Trial(trial).NPLs = arrayfun(@num2str,Trial(trial).NPLs , 'UniformOutput', 0);

    end


    %% Assign Positions for every shown Stimuli and Response Fields and define Positions for all Response Categories

    % Sample Response Postion Space

    Trial(trial).ResponsePositions = randsample(expinfo.RespWindow,length(expinfo.RespWindow));
    % Positionen auf welchen der Reihe nach die Stimului von Trial(trial).Presentation presentiert werden

    % For IIP

    PosIndex_IIP = find(Trial(trial).StimOrder);
    Trial(trial).Corr_Pos = Trial(trial).ResponsePositions(PosIndex_IIP);


    % For IOP of every Position

    IOP_Pos_Index=zeros(setsize,setsize-1);

    for j = 1:setsize

        Pos_IndexIOP = find(Trial(trial).StimOrder);

        Pos_IndexIOP(j) = [];

        IOP_Pos_Index(j,:) = Pos_IndexIOP;

        Trial(trial).IOP_Pos(j,:)= Trial(trial).ResponsePositions(Pos_IndexIOP);

    end


    %% DIP Categories for every Position. Either a DIP for one or two postions.

    Trial(trial).n_DIP_Pos =repelem(0,setsize*2); % check for data format (vector)


    for i=1:setsize*2

        if i < setsize*2 && i > 1

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
            if i == setsize*2

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


    DIP = zeros(setsize,3);

    for i = 1:setsize*2

        if i > 1 && i < setsize*2

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

        elseif i == setsize*2

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

    Pos_IndexDIOP_Pos = zeros(setsize,setsize);


    for j = 1:setsize*2
        if j < setsize*2 && j > 1

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

            elseif j == setsize*2

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


    %% Response Positions in Recall Grid



    Trial(trial).GridPos = Trial(trial).ResponsePositions(1:setsize*2);


    % Coordinates for all Stimuli
    Trial(trial).GridCoordStims = expinfo.Coord(Trial(trial).GridPos,1:2);

    % Assign Coordinates Index for Memory Items and Distractors

    PosIndex_IIP = find(Trial(trial).StimOrder);
    IIPPosCord_Index = Trial(trial).ResponsePositions(PosIndex_IIP);
    Dist_Pos = find(~Trial(trial).StimOrder);
    DIPPosCord_Index = Trial(trial).ResponsePositions(Dist_Pos);

    % Assign Coordinates Index for NPLs
    UsedPos = [Trial(trial).GridPos];
    Trial(trial).NPL_PosIndex = setdiff(Trial(trial).ResponsePositions,UsedPos);

    % Assign Circle Coordinates according to Coordinate Index

    Trial(trial).MemCoordinates = expinfo.Coord(IIPPosCord_Index,1:2);
    Trial(trial).DistCoordinates = expinfo.Coord(DIPPosCord_Index,1:2);
    Trial(trial).NPLCoordinates  = expinfo.Coord(Trial(trial).NPL_PosIndex,1:2);

    %% Calculate Trial Timing according to defined jitter for each Trial

    %    for i = 1:setsize
    %
    %       Trial(trial).ISI_Ret_jittered(i) = expinfo.ISI_Ret + (expinfo.ISI_Ret_jitter * rand(1));
    %
    %    end
    %
    %    for i = 1:setsize*2
    %
    %        Trial(trial).FixTime_jittered(i) = expinfo.Fixtime + (expinfo.Fix_jitter * rand(1));
    % %        Trial(trial).Fix_Cue_jittered(i) = expinfo.Fix_Cue + (expinfo.fix_cue_jitter * rand(1));
    % %        Trial(trial).Cue_Word_jittered(i) = expinfo.Cue_Word + (expinfo.fix_cue_jitter * rand(1));
    %
    %    end
    %
    %    for i = 1:setsize*2 + 1
    %
    %        Trial(trial).ISI_jittered(i) = expinfo.ISI + (expinfo.ISI_jitter * rand(1));
    %
    %    end


    %Trial(trial).ITI_jittered = expinfo.ITI + (expinfo.ITI_jitter * rand(1));

    clear MemStims LureStims

end

end
