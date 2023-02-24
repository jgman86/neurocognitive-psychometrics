function [expinfo, timestamp_flip] = ScreenStims(expinfo, Trial, expTrial,Pos_MemSet,when)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var')
    flip = 0;
elseif isempty(flip)
    flip = 0;
end

%% Initialize Cue Files

fileMem = [expinfo.StimFolder,'Cue_Mem'];
fileDist = [expinfo.StimFolder,'Cue_Dist'];

imaMem=imread(fileMem, 'jpg');
imaDist=imread(fileDist, 'jpg');


rectCue = [expinfo.center(1)-0.5*expinfo.lengthPic expinfo.center(2)-0.5*expinfo.widthPic expinfo.center(1)+0.5*expinfo.lengthPic expinfo.center(2)+0.5*expinfo.widthPic];
posCue = [rectCue'];



% Render Cues
if Trial(expTrial).CorrRespPos(Pos_MemSet) == 1
    
    
    CueMem = Screen('MakeTexture',expinfo.window,imaMem);
    Screen('DrawTextures', expinfo.window,CueMem,[], expinfo.centralStimRange); % put images on screen
    
    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);
    
    Trial(1).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,expinfo.cue_word);
    
else
    
    CueDist = Screen('MakeTexture',expinfo.window,imaDist);
    Screen('DrawTextures', expinfo.window,CueDist,[], expinfo.centralStimRange'); % put images on screen
    
    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);
    
    Trial(1).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,expinfo.cue_word);
    
end



% Show Mem Stims

if Trial(expTrial).CorrRespPos(Pos_MemSet) == 1 && strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'left')
    
    Trial(expTrial).Stim_time = TextCenteredOnPos(expinfo.window,Trial(expTrial).MemStims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor,next_flip);
    Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);
    %next_flip = getAccurateFlip(expinfo.window,Trial(1).Stim_time,2);
    
    Trial(expTrial).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,2);
    
elseif Trial(expTrial).CorrRespPos(Pos_MemSet) == 0 && strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'left')
    
    Trial(expTrial).Stim_time = TextCenteredOnPos(expinfo.window,Trial(expTrial).LureStims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor,next_flip);
    Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);
    %next_flip = getAccurateFlip(expinfo.window,Trial(1).Stim_time,2);
    
    Trial(1).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,2);
    
elseif Trial(expTrial).CorrRespPos(Pos_MemSet) == 1 && strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'right')
    
    Trial(expTrial).Stim_time = TextCenteredOnPos(expinfo.window,Trial(expTrial).MemStims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor,next_flip);
    Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);
    %next_flip = getAccurateFlip(expinfo.window,Trial(1).Stim_time,2);
    
    Trial(1).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,2);
    
elseif Trial(expTrial).CorrRespPos(Pos_MemSet) == 0 && strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'right')
    
    Trial(expTrial).Stim_time = TextCenteredOnPos(expinfo.window,Trial(expTrial).LureStims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor,next_flip);
    Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);
    %next_flip = getAccurateFlip(expinfo.window,Trial(1).Stim_time,2);
    
    Trial(1).ISI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI,2);
    
end




end