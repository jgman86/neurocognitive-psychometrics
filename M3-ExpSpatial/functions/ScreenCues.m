function [expinfo,timestamp_flip] = ScreenCues(Trial,expinfo,expTrial,pos,when)

% Draw Cue According to relevant Dimension

if Trial(expTrial).CueOrientation(pos) == "horz"

    Screen('DrawLines', expinfo.window,expinfo.cue_horz,5,expinfo.Colors.white,expinfo.center,0);
 
else

    Screen('DrawLines', expinfo.window,expinfo.cue_vert,5,expinfo.Colors.white,expinfo.center,0);

end

%% Flip stimuli to screen
% Flip Screen

if ~exist('when','var') || isempty(when)

    % Flip expinfo.expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);

else
    % Flip synced to timestamp entered
    Trial(expTrial).Cue_Time = Screen('Flip',expinfo.window,when);
    timestamp_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.CueTime);
end


end 


 