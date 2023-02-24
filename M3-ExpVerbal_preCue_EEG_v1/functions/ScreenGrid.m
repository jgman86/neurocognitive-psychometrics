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

    
   CenterText(expinfo.window,Trial(expTrial).MemStims{i},Trial(expTrial).IIPPosCord(i,1),Trial(expTrial).IIPPosCord(i,2),expinfo.Colors.stimColor);
   CenterText(expinfo.window,Trial(expTrial).LureStims{i},Trial(expTrial).DIPPosCord(i,1),Trial(expTrial).DIPPosCord(i,2),expinfo.Colors.stimColor);
        
   
end


%% Screen NPLs
for i = 1:length(Trial(expTrial).NPLs)

    
   CenterText(expinfo.window,Trial(expTrial).NPLs{i},Trial(expTrial).NPLPosCord(i,1),Trial(expTrial).NPLPosCord(i,2),expinfo.Colors.stimColor);
    
    
end

WaitSecs(0.5);

% Flip stimuli to screen

        if ~exist('when','var') || isempty(when)
           % Flip expinfo.expinfo.window immediately
            timestamp_flip =Screen('Flip', expinfo.window);
            
        else
            % Flip synced to timestamp entered
            timestamp_flip = Screen('Flip', expinfo.window,when,1);
        end
    
        
        
end