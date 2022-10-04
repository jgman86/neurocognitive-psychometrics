function [expinfo , timestamp_flip] = Screen_MemArray(expinfo,Set_Pos,Trial,expTrial,when)


% Screen Array
Screen('FillOval', expinfo.window, Trial(expTrial).MemColors{Set_Pos,1:3},Trial(expTrial).MemCoordArray(Set_Pos,:));
Screen('FillOval', expinfo.window, Trial(expTrial).DistColors{Set_Pos,1:3},Trial(expTrial).DistCoordArray(Set_Pos,:));
Screen('FillOval', expinfo.window, expinfo.Colors.MaskColor,Trial(expTrial).MaskCoordArray{Set_Pos,1});
Screen('FillOval', expinfo.window,expinfo.Colors.MaskColor,Trial(expTrial).MaskCoordArray{Set_Pos,2});

% Screen Fixation
Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.rect_bull);
Screen('DrawLines', expinfo.window,expinfo.fix,10,expinfo.Colors.black,expinfo.center,0);
Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.bullseye);



%% Flip stimuli to screen
% Flip Screen

if ~exist('when','var') || isempty(when)

    % Flip expinfo.expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);

else
    % Flip synced to timestamp entered
    Trial(expTrial).ArrayTime_fix = Screen('Flip',expinfo.window,when);
    timestamp_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ArrayTime_fix,expinfo.ArrayTime_fix);
end


end

