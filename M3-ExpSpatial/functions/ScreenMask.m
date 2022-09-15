function [expinfo, timestamp_flip] = ScreenMask(Trial, expinfo, expTrial, when)



Screen('FillRect', expinfo.window,expinfo.Colors.black,expinfo.rect_center);



%% Flip stimuli to screen
% Flip Screen

if ~exist('when','var') || isempty(when)

    % Flip expinfo.expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);

else
    % Flip synced to timestamp entered
    Trial(expTrial).Cue_Time = Screen('Flip',expinfo.window,when);
    timestamp_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.MaskTime);
end


end