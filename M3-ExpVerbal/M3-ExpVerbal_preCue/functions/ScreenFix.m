function [timestamp_flip] = ScreenFix(expinfo, when, Marker)


if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('when','var') || isempty(when)
    flip = 0;

end

 Screen('FillOval', expinfo.window,expinfo.Colors.black,expinfo.rect_bull);
 Screen('DrawLines', expinfo.window,expinfo.fix,10,expinfo.Colors.white,expinfo.center,0);
 Screen('FillOval', expinfo.window,expinfo.Colors.black,expinfo.bullseye);



%% Flip stimuli to screen
% Flip Screen

if ~exist('when','var') || isempty(when)

    % Flip expinfo.expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);


else
    % Flip synced to timestamp entered
    Trial(expTrial).Cue_Time = Screen('Flip',expinfo.window,when,1);
    timestamp_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation,expinfo.FixTime);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);

end


end