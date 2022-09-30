% This function generates a trial list from the specified Trial
% configurations in the expinfo. Alternatively, we can specify the Trial
% configurations here if there is more complex things to do...

function [PreTrial, PostTrial, expinfo] = MakeTrial(expinfo, isPractice, isShort)
%% Trial Configurations
% First, we need to obtain the trial configurations crossing all
% experimental conditions

%% Defining trials to be conducted
% Specify how many practice trials should be conducted
if isPractice == 1

    expinfo.nExpTrials = expinfo.nPracTrials;


end

% Specify how many Trials in each block of the experiment will be conducted

if isShort == 1

    expinfo.nExpTrials = ceil(expinfo.nExpTrials /5);

end

%% Determine additional Information for each Trial
% Define Line Coordinates for each position in the memory array.

[Pre_Trial(:,1)] = BalanceTrials(expinfo.nExpTrials,1,expinfo.CueCond(1));

[Post_Trial(:,1), Post_Trial(:,2)] = BalanceTrials(expinfo.nExpTrials,1,expinfo.CueCond(2),expinfo.FT);


%[Mixed_Trial(:,1), Mixed_Trial(:,2)] = BalanceTrials(expinfo.nExpTrials,3,expinfo.CueCond,expinfo.FT);

%% Resort TrialConfigurations with constraints %% NOT FINISHED !!!
% No more than three time the same orientation or laterality trials in a row
% No more than three times the same FT in a row

% iter_test = 1;
% while iter_test == 1
%     SampleMatrix = Pre_Trial;
%     for i = 1:expinfo.nExpTrials
%         if i == 1
%             RandRow = randsample(size(SampleMatrix,1),1);
%             Pre_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%             iter = 1;
%         elseif i <= 3
%             test = 0;
%             iter = 0;
%             while test == 0
%                 RandRow = randsample(size(SampleMatrix,1),1);
% 
%                 if ~ismember(SampleMatrix(RandRow,2),Pre_Trial(i-1,2))
%                     LateralityLogical = 1;
%                 else
%                     LateralityLogical = 0;
%                 end
% 
%                 if ~ismember(SampleMatrix(RandRow,1),Pre_Trial(i-1,1))
% 
%                     OrientationLogical = 1;
%                 else
%                     OrientationLogical = 0;
%                 end
% 
%                 if ~LateralityLogical == 1 && OrientationLogical == 1
%                     test = 1;
%                 end
%                 iter = iter + 1;
% 
%                 if iter > 1000000
%                     break
%                 end
%             end
%             if iter > 1000000
%                 break
%             end
%             Pre_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%         else
%             iter = 0;
%             test = 0;
%             while test == 0
%                 RandRow = randsample(size(SampleMatrix,1),1);
%                 if ~ismember(SampleMatrix(RandRow,2),Pre_Trial(i-1,2)) || ...
%                         ~ismember(SampleMatrix(RandRow,2),Pre_Trial(i-2,2)) || ...
%                         ~ismember(SampleMatrix(RandRow,2),Pre_Trial(i-3,2))
% 
%                     LateralityLogical = 1;
%                 else
%                     LateralityLogical = 0;
%                 end
% 
%                 if ~ismember(SampleMatrix(RandRow,1),Pre_Trial(i-1,1)) ||...
%                         ~ismember(SampleMatrix(RandRow,1),Pre_Trial(i-2,1)) || ...
%                         ~ismember(SampleMatrix(RandRow,1),Pre_Trial(i-3,1))
% 
%                     OrientationLogical = 1;
%                 else
%                     OrientationLogical = 0;
%                 end
% 
%                 iter = iter+1;
%                 if LateralityLogical == 1 && OrientationLogical == 1
%                     test = 1;
%                 end
% 
%                 if iter > 10000
%                     break
%                 end
%             end
% 
%             if iter > 1000000
%                 break
%             end
%             Pre_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%         end
%         if iter > 10000
%             iter_test = 1;
%             break
%         else
%             iter_test = 0;
%         end
%     end
% end
% 
% clear("LateralityLogical","OrientationLogical","RandRow","SampleMatrix","test", "iter","iter_test","i");
% 
% iter_test = 1;
% while iter_test == 1
%     SampleMatrix = Post_Trial;
%     for i = 1:expinfo.nExpTrials
%         if i == 1
%             RandRow = randsample(size(SampleMatrix,1),1);
%             Post_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%             iter = 1;
%         elseif i <= 3
%             test = 0;
%             iter = 0;
%             while test == 0
%                 RandRow = randsample(size(SampleMatrix,1),1);
% 
%                 if ~ismember(SampleMatrix(RandRow,2),Post_Trial(i-1,2))
%                     FTLogical = 1;
%                 else
%                     FTLogical = 0;
%                 end
% 
%                 if ~ismember(SampleMatrix(RandRow,1),Post_Trial(i-1,1))
% 
%                     OrientationLogical = 1;
%                 else
%                     OrientationLogical = 0;
%                 end
% 
%                 if ~ismember(SampleMatrix(RandRow,3),Post_Trial(i-1,1))
% 
%                     LateralityLogical = 1;
%                 else
%                     LateralityLogical = 0;
%                 end
% 
%                 if FTLogical == 1 && LateralityLogical == 1 && OrientationLogical == 1
%                     test = 1;
%                 end
%                 iter = iter + 1;
% 
%                 if iter > 10000
%                     break
%                 end
%             end
%             if iter > 10000
%                 break
%             end
%             Post_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%         else
%             iter = 0;
%             test = 0;
% 
%             while test == 0
%                 RandRow = randsample(size(SampleMatrix,1),1); % not more than 3x the same FT in a row
%                 if ~ismember(SampleMatrix(RandRow,1),Post_Trial(i-1,1)) || ...
%                         ~ismember(SampleMatrix(RandRow,1),Post_Trial(i-2,1)) || ...
%                         ~ismember(SampleMatrix(RandRow,2),Post_Trial(i-3,1))
% 
%                     FTLogical = 1;
%                 else
%                     FTLogical = 0;
%                 end
%                 % not more than 3x the same orientation in a row
%                 if  ~ismember(SampleMatrix(RandRow,2),Post_Trial(i-1,2)) || ...
%                         ~ismember(SampleMatrix(RandRow,2),Post_Trial(i-2,2)) || ...
%                         ~ismember(SampleMatrix(RandRow,2),Post_Trial(i-3,2))
% 
%                     OrientationLogical = 1;
%                 else
%                     OrientationLogical = 0;
%                 end
% 
%                 % not more than 3x the same laterality in a row
%                 if  ~ismember(SampleMatrix(RandRow,3),Post_Trial(i-1,3)) || ...
%                         ~ismember(SampleMatrix(RandRow,3),Post_Trial(i-2,3)) || ...
%                         ~ismember(SampleMatrix(RandRow,3),Post_Trial(i-3,3))
% 
%                     LateralityLogical = 1;
%                 else
%                     LateralityLogical = 0;
%                 end
%                 iter = iter+1;
% 
% 
%                 if  FTLogical == 1 && OrientationLogical == 1 && LateralityLogical == 1
%                     test = 1;
%                 end
% 
%                 if iter > 10000
%                     break
%                 end
%             end
% 
%             if iter > 10000
%                 break
%             end
%             Post_Trial(i,:) = SampleMatrix(RandRow,:);
%             SampleMatrix(RandRow,:) = [];
%         end
%         if iter > 10000
%             iter_test = 1;
%             break
%         else
%             iter_test = 0;
%         end
%     end
% end
% 
% clear("LateralityLogical","OrientationLogical","RandRow","SampleMatrix","test", "iter","iter_test","i");

%% Create balanced position matrix for vert and horz orientation

mem_dim_pre = ["vert";"horz"];
matrix_dim_pre= (repmat(mem_dim_pre, ceil((expinfo.nExpTrials)*expinfo.SetSize)/2,1));
sample_dim_pre = matrix_dim_pre(randperm(size(matrix_dim_pre, 1)),:);

mem_dim_post = ["vert";"horz"];
matrix_dim_post= (repmat(mem_dim_post, ceil((expinfo.nExpTrials)*expinfo.SetSize)/2,1));
sample_dim_post = matrix_dim_post(randperm(size(matrix_dim_post, 1)),:);

dim_horz = ["left" "right"];
matrix_dim_horz= repelem(dim_horz, expinfo.nExpTrials*expinfo.SetSize);
sample_dim_horz = matrix_dim_horz(:);
sample_dim_horz = sample_dim_horz(randperm(size(sample_dim_horz, 1)),:);

dim_vert = ["top" "buttom"];
matrix_dim_vert= repelem(dim_vert, expinfo.nExpTrials*expinfo.SetSize);
sample_dim_vert = matrix_dim_vert(:);
sample_dim_vert = sample_dim_vert(randperm(size(sample_dim_vert, 1)),:);

dim_horz_post = ["left" "right"];
matrix_dim_horz_post= repelem(dim_horz_post, expinfo.nExpTrials*expinfo.SetSize);
sample_dim_horz_post = matrix_dim_horz_post(:);
sample_dim_horz_post = sample_dim_horz_post(randperm(size(sample_dim_horz_post, 1)),:);

dim_vert_post = ["top" "buttom"];
matrix_dim_vert_post= repelem(dim_vert_post, expinfo.nExpTrials*expinfo.SetSize);
sample_dim_vert_post = matrix_dim_vert_post(:);
sample_dim_vert_post = sample_dim_vert_post(randperm(size(sample_dim_vert_post, 1)),:);


%% Pre allcocate Trial object for speed reasons 

% PreTrial = zeros(expinfo.nExpTrials);
% PostTrial = zeros(expinfo.nExpTrials);


trial=1;

%% Create Trial Object
for trial = 1:expinfo.nExpTrials
    %% Trial Conditions PreTrials
    PreTrial(trial).TrialNum = trial;
    PreTrial(trial).SetSize = expinfo.SetSize;
    PreTrial(trial).CueCondition = Pre_Trial(trial,1);

    %% Trial Conditions PostTrials

    PostTrial(trial).TrialNum =trial;
    PostTrial(trial).SetSize = expinfo.SetSize;
    PostTrial(trial).CueCondition = Post_Trial(trial,1);
    PostTrial(trial).FreeTime = str2num(Post_Trial(trial,2));


    %% Stimuli Orientation for Memory and Distractor Items

    % Sample MemStim and Distractor Position in MemoryArray from balanced matrix for Dimension left/right,
    % top/ buttom depending on Cue Condition

    % Position of Memstims in MemArray for Pre and Post Trials

    %% Pre Trials relevant Dimension for each Position

    Position_DimIndex = randsample((1:size(sample_dim_pre)), expinfo.SetSize);
    PreTrial(trial).CueOrientation = sample_dim_pre(Position_DimIndex);
    sample_dim_pre(Position_DimIndex,:) = [];    

    for i=1:expinfo.SetSize
        
        if ismember(PreTrial(trial).CueOrientation(i),"horz")
            
            % Sample Rows from Sample Matrix and save position in Trial Object
            
            Position_MemPosIndex = randsample((1:size(sample_dim_horz)), 1);
            PreTrial(trial).MemPos(i,:) = sample_dim_horz(Position_MemPosIndex,1);
            sample_dim_horz(Position_MemPosIndex,:) = [];
            
            if ismember(PreTrial(trial).MemPos(i), "right")
                
                PreTrial(trial).MemCoordArray(i,:) = expinfo.rect_right;
                PreTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_left];
                
            else
                
                PreTrial(trial).MemCoordArray(i,:) = expinfo.rect_left;
                PreTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_right];
                
            end
            
            % Sampe Dist Position according to Memory Postion
            Position_DistPosIndex = randsample((1:size(sample_dim_vert)), 1);
            PreTrial(trial).DistPos(i,:) = sample_dim_vert(Position_DistPosIndex,1);
            sample_dim_vert(Position_DistPosIndex,:) = [];
            
            if ismember(PreTrial(trial).DistPos(i), "top")
                
                PreTrial(trial).DistCoordArray(i,:) = expinfo.rect_top;
                PreTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_buttom];
                
            else
                
                PreTrial(trial).DistCoordArray(i,:) = expinfo.rect_buttom;
                PreTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_top];
                
            end
            
        elseif ismember(PreTrial(trial).CueOrientation(i),"vert")
        

            % Sample Rows from Sample Matrix and save position in Trial Object
            
            Position_MemPosIndex = randsample((1:size(sample_dim_vert)), 1);
            PreTrial(trial).MemPos(i,:) = sample_dim_vert(Position_MemPosIndex,1);
            sample_dim_vert(Position_MemPosIndex,:) = [];
            
            if ismember(PreTrial(trial).MemPos(i), "buttom")
                
                PreTrial(trial).MemCoordArray(i,:) = expinfo.rect_buttom;
                PreTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_top];
                
            else
                
                PreTrial(trial).MemCoordArray(i,:) = expinfo.rect_top;
                PreTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_buttom];
                
            end
            
            % Sampe Dist Position according to Memory Postion
            Position_DistPosIndex = randsample((1:size(sample_dim_horz)), 1);
            PreTrial(trial).DistPos(i,:) = sample_dim_horz(Position_DistPosIndex,1);
            sample_dim_horz(Position_DistPosIndex,:) = [];
            
            if ismember(PreTrial(trial).DistPos(i), "right")
                
                PreTrial(trial).DistCoordArray(i,:) = expinfo.rect_right;
                PreTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_left];
                
            else
                
                PreTrial(trial).DistCoordArray(i,:) = expinfo.rect_left;
                PreTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_right];
                
            end
    
        end 
    end 

      


    %% Post Trials

    Position_DimIndex_Post = randsample((1:size(sample_dim_post)), expinfo.SetSize);
    PostTrial(trial).CueOrientation = sample_dim_post(Position_DimIndex_Post);
    sample_dim_post(Position_DimIndex_Post,:) = [];    

    for i=1:expinfo.SetSize
        
        if ismember(PostTrial(trial).CueOrientation(i),"horz")
            
            % Sample Rows from Sample Matrix and save position in Trial Object
            
            Position_MemPosIndex = randsample((1:size(sample_dim_horz_post)), 1);
            PostTrial(trial).MemPos(i,:) = sample_dim_horz_post(Position_MemPosIndex,1);
            sample_dim_horz_post(Position_MemPosIndex,:) = [];
            
            if ismember(PostTrial(trial).MemPos(i), "right")
                
                PostTrial(trial).MemCoordArray(i,:) = expinfo.rect_right;
                PostTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_left];
                
            else
                
                PostTrial(trial).MemCoordArray(i,:) = expinfo.rect_left;
                PostTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_right];
                
            end
            
            % Sampe Dist Position according to Memory Postion
            Position_DistPosIndex = randsample((1:size(sample_dim_vert_post)), 1);
            PostTrial(trial).DistPos(i,:) = sample_dim_vert_post(Position_DistPosIndex,1);
            sample_dim_vert_post(Position_DistPosIndex,:) = [];
            
            if ismember(PostTrial(trial).DistPos(i), "top")
                
                PostTrial(trial).DistCoordArray(i,:) = expinfo.rect_top;
                PostTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_buttom];
                
            else
                
                PostTrial(trial).DistCoordArray(i,:) = expinfo.rect_buttom;
                PostTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_top];
                
            end
            
        elseif ismember(PostTrial(trial).CueOrientation(i),"vert")
        

            % Sample Rows from Sample Matrix and save position in Trial Object
            
            Position_MemPosIndex = randsample((1:size(sample_dim_vert_post)), 1);
            PostTrial(trial).MemPos(i,:) = sample_dim_vert_post(Position_MemPosIndex,1);
            sample_dim_vert_post(Position_MemPosIndex,:) = [];
            
            if ismember(PostTrial(trial).MemPos(i), "buttom")
                
                PostTrial(trial).MemCoordArray(i,:) = expinfo.rect_buttom;
                PostTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_top];
                
            else
                
                PostTrial(trial).MemCoordArray(i,:) = expinfo.rect_top;
                PostTrial(trial).MaskCoordArray{i,1} = [expinfo.rect_buttom];
                
            end
            
            % Sampe Dist Position according to Memory Postion
            Position_DistPosIndex = randsample((1:size(sample_dim_horz_post)), 1);
            PostTrial(trial).DistPos(i,:) = sample_dim_horz_post(Position_DistPosIndex,1);
            sample_dim_horz_post(Position_DistPosIndex,:) = [];
            
            if ismember(PostTrial(trial).DistPos(i), "right")
                
                PostTrial(trial).DistCoordArray(i,:) = expinfo.rect_right;
                PostTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_left];
                
            else
                
                PostTrial(trial).DistCoordArray(i,:) = expinfo.rect_left;
                PostTrial(trial).MaskCoordArray{i,2} = [expinfo.rect_right];
                
            end
    
        end 
    end 



    %% Sample Colors from Color Range for MemStims, Distractors and NPls
    
    %% Pre Cue Trials
    % Sample Two Colors per position
    % Sample Color Space for individual Trial

    ColorSpaceIndex = randsample(expinfo.ColorIndex,expinfo.GridSize);
    ColorSpaceTrial = expinfo.StimColors(ColorSpaceIndex,:);

    PreTrial(trial).ColorSpaceTrial = ColorSpaceTrial;

    ColorIndexTrial = 1:expinfo.GridSize;

    % Sample Color Pairs for Memory and Distractor Items

    for i = 1: expinfo.SetSize

        ColorPairs(i,:) = randsample(ColorIndexTrial,2,false);
        ColorIndexTrial(ColorIndexTrial==ColorPairs(i,1)) =[];
        ColorIndexTrial(ColorIndexTrial==ColorPairs(i,2)) =[];


        if i == expinfo.SetSize

            PreTrial(trial).NPLColors = ColorSpaceTrial(ColorIndexTrial,:);
            PreTrial(trial).MemColors = ColorSpaceTrial(ColorPairs(:,1),:);
            PreTrial(trial).DistColors = ColorSpaceTrial(ColorPairs(:,2),:);

        end

    end

    PreTrial(trial).ColorPairsIndex = ColorPairs;

    % Grid Positions

    % IIP

    PreTrial(trial).GridPositionIIP = PreTrial(trial).ColorPairsIndex(:,1);

    % IOP

    for j = 1:expinfo.SetSize

        Pos_IOP = PreTrial(trial).GridPositionIIP;
        Pos_IOP(j) = [];

        PreTrial(trial).GridPositionIOP(j,:) = Pos_IOP(:,1);

    end


    %  DIP

    PreTrial(trial).GridPositionDIP = PreTrial(trial).ColorPairsIndex(:,2);


    % Grid Position DIOP

    for j = 1:expinfo.SetSize

        Pos_DIOP = PreTrial(trial).GridPositionDIP;
        Pos_DIOP(j) = [];

        PreTrial(trial).GridPositionDIOP(j,:) = Pos_DIOP(:,1);

    end


    % Grid Position NPL

    PreTrial(trial).GridPositionNPL = ColorIndexTrial;

    clear ColorIndexTrial

    %% Secondary Testing Answer

    bright = ["Mem","Dist"];

    PreTrial(trial).BrightColor = randsample(bright,4,true);
    PostTrial(trial).BrightColor = randsample(bright,4,true);

    %% Post Cue Trials
    % Sample Two Colors per position

    % Sample Color Space for individual Trial

    ColorSpaceIndex_Post = randsample(expinfo.ColorIndex,expinfo.GridSize,false);
    ColorSpaceTrial_Post = expinfo.StimColors(ColorSpaceIndex_Post,:);

    ColorIndexTrial_Post = 1:expinfo.GridSize;


    PostTrial(trial).ColorSpaceTrial = ColorSpaceTrial_Post;

    % Sample Color Pairs for Memory and Distractor Items

    for i = 1: expinfo.SetSize

        ColorPairs_Post(i,:) = randsample(ColorIndexTrial_Post,2,false);
        ColorIndexTrial_Post(ColorIndexTrial_Post==ColorPairs_Post(i,1)) =[];
        ColorIndexTrial_Post(ColorIndexTrial_Post==ColorPairs_Post(i,2)) =[];


        if i == expinfo.SetSize

            PostTrial(trial).NPLColors = ColorSpaceTrial_Post(ColorIndexTrial_Post,:);
            PostTrial(trial).MemColors = ColorSpaceTrial_Post(ColorPairs_Post(:,1),:);
            PostTrial(trial).DistColors = ColorSpaceTrial_Post(ColorPairs_Post(:,2),:);

        end

    end

    PostTrial(trial).ColorPairsIndex_Post = ColorPairs_Post;


    %% Grid Positions

    % IIP

    PostTrial(trial).GridPositionIIP = PostTrial(trial).ColorPairsIndex_Post(:,1);

    % IOP

    for j = 1:expinfo.SetSize

        Pos_IOP = PostTrial(trial).GridPositionIIP;
        Pos_IOP(j) = [];

        PostTrial(trial).GridPositionIOP(j,:) = Pos_IOP(:,1);

    end


    %  DIP

    PostTrial(trial).GridPositionDIP = PostTrial(trial).ColorPairsIndex_Post(:,2);


    % Grid Position DIOP

    for j = 1:expinfo.SetSize

        Pos_DIOP = PostTrial(trial).GridPositionDIP;
        Pos_DIOP(j) = [];

        PostTrial(trial).GridPositionDIOP(j,:) = Pos_DIOP(:,1);

    end


    % Grid Position NPL

    PostTrial(trial).GridPositionNPL = ColorIndexTrial_Post;


   clear ColorIndexTrial_Post

    %% Assign Grid Coordinates

    % Pre Trials

    PreTrial(trial).IIPGridCoord = expinfo.Coord(PreTrial(trial).GridPositionIIP,:);
    PreTrial(trial).DIPGridCoord = expinfo.Coord(PreTrial(trial).GridPositionDIP,:);
    PreTrial(trial).NPLGridCoord = expinfo.Coord(PreTrial(trial).GridPositionNPL,:);

    % Post Trials

    PostTrial(trial).IIPGridCoord = expinfo.Coord(PostTrial(trial).GridPositionIIP,:);
    PostTrial(trial).DIPGridCoord = expinfo.Coord(PostTrial(trial).GridPositionDIP,:);
    PostTrial(trial).NPLGridCoord = expinfo.Coord(PostTrial(trial).GridPositionNPL,:);


end
end


