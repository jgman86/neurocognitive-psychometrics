function [expinfo, timestamp_flip] = ScreenCues(expinfo, Trial,expTrial,n_cues,when,Marker)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var')
    flip = 0;
elseif isempty(flip)
    flip = 0;
end

%% Initialize Cue Position



rectCue = [expinfo.center(1)-0.5*expinfo.lengthPic expinfo.center(2)-0.5*expinfo.widthPic expinfo.center(1)+0.5*expinfo.lengthPic expinfo.center(2)+0.5*expinfo.widthPic];


% Show Memory Set, Distractor and Cues

if Trial(expTrial).CorrRespPos_helper(n_cues) == 1 
    
    
    Screen('FillOval', expinfo.window,expinfo.Colors.CueMem, rectCue); % put images on screen
    
    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window,when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);
    
    Trial(expTrial).Cue_Word = clearScreen(expinfo,expinfo.window,expinfo.Colors.bgColor,when);
     when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word,expinfo.cue_word);

  
   
else
    
    
    Screen('FillOval', expinfo.window,expinfo.Colors.CueDist, rectCue); % put images on screen


    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window, when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);
    
    Trial(expTrial).Cue_Word = clearScreen(expinfo,expinfo.window,expinfo.Colors.bgColor,when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word,expinfo.cue_word);

       
end
  
%% Flip stimuli to screen
        % Flip Screen
        if ~exist('when','var') || isempty(when)
            % Flip expinfo.expinfo.window immediately
            timestamp_flip = Screen('Flip',expinfo.window);
            
        else
            % Flip synced to timestamp entered
            timestamp_flip = Screen('Flip',expinfo.window,when);
            io64(expinfo.ioObj, expinfo.PortAddress, Marker);
        end
    
end