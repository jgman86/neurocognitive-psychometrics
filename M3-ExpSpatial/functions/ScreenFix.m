function [expinfo, timestamp_flip] = ScreenFix(expinfo, when)



 Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.rect_center);
 Screen('DrawLines', expinfo.window,expinfo.fix,10,expinfo.Colors.black,expinfo.center,0);
 Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.bullseye);



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