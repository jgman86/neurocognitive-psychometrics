function [expinfo, timestamp_flip] = ScreenGrid(expinfo, Trial, expTrial,when)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var')
    flip = 0;
elseif isempty(flip)
    flip = 0;
end

%% Screen MemStims & Distractor Categories

for i = 1:expinfo.SetSize

    
   Screen('FillOval', expinfo.window,Trial(expTrial).MemColors{i,1:3},Trial(expTrial).IIPGridCoord(i,:))
   Screen('FillOval', expinfo.window,Trial(expTrial).DistColors{i,1:3},Trial(expTrial).DIPGridCoord(i,:))

  
end


%% Screen NPLs
for i = 1:expinfo.NPLs

    Screen('FillOval', expinfo.window,Trial(expTrial).NPLColors{i,1:3},Trial(expTrial).NPLGridCoord(i,:))

end

%% Screen Fixation

 Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.rect_bull);
 Screen('DrawLines', expinfo.window,expinfo.fix,10,expinfo.Colors.black,expinfo.center,0);
 Screen('FillOval', expinfo.window,expinfo.Colors.white,expinfo.bullseye);


%% Flip stimuli to screen

        if ~exist('when','var') || isempty(when)
           % Flip expinfo.expinfo.window immediately
            timestamp_flip =Screen('Flip', expinfo.window);
            
        else
            % Flip synced to timestamp entered
            timestamp_flip = Screen('Flip', expinfo.window,when);
        end
    
        
        
end