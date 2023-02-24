function [expinfo, timestamp_flip] = ScreenCues(expinfo,Trial,expTrial,left_right,n_cues,when,Marker)

if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('when','var') || isempty(when)
    when = 0;
end



%% Initialize Cue Position


rectCue = [expinfo.center(1)-0.5*expinfo.lengthPic expinfo.center(2)-0.5*expinfo.widthPic expinfo.center(1)+0.5*expinfo.lengthPic expinfo.center(2)+0.5*expinfo.widthPic];


% Show Memory Set, Distractor and Cues

if Trial(expTrial).CorrRespPos_helper(n_cues) == 1 
  
   if (strcmp(Trial(expTrial).LateralityStims{left_right},'left'))
    
    Screen('FillOval', expinfo.window,expinfo.Colors.CueMem, rectCue); % put images on screen
    draw_arrow(expinfo.window,expinfo.center,0,expinfo.Colors.white,[10 10 10 5]);

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window,when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);

   else 

    Screen('FillOval', expinfo.window,expinfo.Colors.CueMem, rectCue); % put images on screen
    draw_arrow(expinfo.window,expinfo.center,180,expinfo.Colors.white,[10 10 10 5]);

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window,when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);

   end 

else

   if (strcmp(Trial(expTrial).LateralityStims{left_right},'left'))

    Screen('FillOval', expinfo.window,expinfo.Colors.CueDist, rectCue); % put images on screen
    draw_arrow(expinfo.window,expinfo.center,0,expinfo.Colors.white,[10 10 10 5]);

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window, when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);
   
   else 

    Screen('FillOval', expinfo.window,expinfo.Colors.CueDist, rectCue); % put images on screen
    draw_arrow(expinfo.window,expinfo.center,180,expinfo.Colors.white,[10 10 10 5]);

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window, when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);

   end

end

%% Flip stimuli to screen
% Flip Screen
if ~exist('when','var') || isempty(when)
    % Flip expinfo.expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);

else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);
end


end