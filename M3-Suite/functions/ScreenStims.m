function [expinfo, timestamp_flip] = ScreenStim(expinfo,Trial,Target,Scram,expTrial,Pos_MemSet,when,Marker)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end


% Compute Coordinated to Center text on
textbounds_stim = Screen('TextBounds', expinfo.window, Target);

% Calculate Centered Coordinates
posX_right = expinfo.right(1) - textbounds_stim(3)/2;
posY_right = expinfo.right(2) - textbounds_stim(4)/2;

% Calculate Centered Coordinates
posX_left = expinfo.left(1) - textbounds_stim(3)/2;
posY_left = expinfo.left(2) - textbounds_stim(4)/2;


%% Draw Stims on Screen

if Trial(expTrial).LateralityStims(Pos_MemSet) == "right"

    % Target Stim
    Screen('DrawText',expinfo.window,Target,posX_right,posY_right,expinfo.Colors.stimColor);

    % Scrambled Stim
    Screen('DrawText',expinfo.window,Scram,posX_left,posY_left,expinfo.Colors.stimColor);

elseif Trial(expTrial).LateralityStims(Pos_MemSet) == "left"
    % Target Stim
    Screen('DrawText',expinfo.window,Target,posX_left,posY_left,expinfo.Colors.stimColor);

    % Scrambled Stim
    Screen('DrawText',expinfo.window,Scram,posX_right,posY_right,expinfo.Colors.stimColor);

end

%% Flip Screen
if ~exist('when','var') || isempty(when)
    % Flip window immediately
    timestamp_flip = Screen('Flip',expinfo.window,1);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);
else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when,1);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);
end


end