function [expinfo, timestamp_flip] = ScreenCue(expinfo,Trial,expTrial,Pos_MemSet,when)

if ~exist('when','var') || isempty(when)
    when = 0;
end


%% Initialize Cue Position


rectCue = [expinfo.center(1)-0.5*expinfo.lengthPic expinfo.center(2)-0.5*expinfo.widthPic expinfo.center(1)+0.5*expinfo.lengthPic ...
    expinfo.center(2)+0.5*expinfo.widthPic];


% Show Memory Set, Distractor and Cues

if Trial(expTrial).StimOrder(Pos_MemSet) == 1 

    Marker = expinfo.Marker.Cue_mem;
    Screen('FillOval', expinfo.window,expinfo.Colors.CueMem, rectCue); 

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window,when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);


else


    Marker = expinfo.Marker.Cue_dist;
    Screen('FillOval', expinfo.window,expinfo.Colors.CueDist, rectCue); 

    Trial(expTrial).Cue_Time = Screen('Flip', expinfo.window, when);
    when = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Time,expinfo.cue_time);



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