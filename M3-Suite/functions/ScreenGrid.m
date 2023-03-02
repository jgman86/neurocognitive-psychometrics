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


% j=find(Trial(expTrial.StimOrder==1,1);
% k=find(Trial(expTrial.StimOrder==1,1);
% 
% for i = 1:expinfo.SetSize*2
% 
%     if Trial(expTrial).StimOrder(i) == 1
% 
%         CenterText(expinfo.window,Trial(expTrial).MemStims{j},Trial(expTrial).MemCoordinates(j,1), ...
%             Trial(expTrial).MemCoordinates(j,2), expinfo.Colors.stimColor);
%         
%         j = j+1;
% 
%     else 
% 
% 
%         CenterText(expinfo.window,Trial(expTrial).LureStims{k},Trial(expTrial).DistCoordinates(k,1), ...
%             Trial(expTrial).DistCoordinates(k,2),expinfo.Colors.stimColor);
% 
%         k = k+1;
%         
%     end
% 
% end

for i = 1:expinfo.SetSize*2

        CenterText(expinfo.window,Trial(expTrial).Stims{i},Trial(expTrial).GridCoordStims(i,1), ...
            Trial(expTrial).GridCoordStims(i,2), expinfo.Colors.stimColor);

end 
        
%% Screen NPLs
for i = 1:length(Trial(expTrial).NPLs)

    
   CenterText(expinfo.window,Trial(expTrial).NPLs{i},Trial(expTrial).NPLCoordinates(i,1), ...
       Trial(expTrial).NPLCoordinates(i,2),expinfo.Colors.stimColor);
    
    
end


% Flip stimuli to screen

        if ~exist('when','var') || isempty(when)
           % Flip expinfo.expinfo.window immediately
            timestamp_flip =Screen('Flip', expinfo.window);
            
        else
            % Flip synced to timestamp entered
            timestamp_flip = Screen('Flip', expinfo.window,when,1);
        end
    
        
        
end