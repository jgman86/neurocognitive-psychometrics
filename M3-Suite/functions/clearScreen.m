% This function clears the screen by overriding the current screen with a
% filled rectangle of a specified color. Optionally a timestamp for the
% flip "when" can be provided

function timestamp_flip = clearScreen(expinfo,color,when, Marker)

if ~exist('when','var') || isempty(when)
    when = 0;
end

if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end


Screen('FillRect',expinfo.window,color);

% Tell PTB no more drawing commands will be issued until the next flip
Screen('DrawingFinished', expinfo.window);

if ~exist('when','var') || isempty(when)
    % Flip window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);

else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);

end


%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de