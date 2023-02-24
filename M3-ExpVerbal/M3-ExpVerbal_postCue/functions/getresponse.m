% This function waits for a response and saves the 
function Trial = getresponse(expinfo, Trial, expTrial, Pos_MemSet)
% If timestamp for onset latency is not provided read out current system
% time. Attention this is just a work around and leads to biased reaction
% times

% Start iternal MATLAB stop-clock
tic 

if ~exist('start','var')
    start = GetSecs;
end



% clear Buffer of Keyboard
while toc < 0.1; KbCheck;  end

% read out keyboard until valid key is pressed or maximal allowed response
% time is reached

while toc < expinfo.MaxRTSec
    
    % Read keyboard
    [keyIsDown,timeSecs,keyCode] = KbCheck;
    
    if keyIsDown
        % get pressed Key
        pressedKey = KbName(keyCode);
        % Abbruch des Experiments
        if  strcmp(pressedKey,expinfo.AbortKey)
            closeexp(expinfo.window);
        end
        % Testen ob die Taste zu den erlaubten Antwort-Tasten geh�rt
        if strlength(pressedKey) ~= 1
            response = 0;
            break
        elseif length(pressedKey) > 1
            response = 0;
            break
        else
            if any(strcmp(pressedKey,expinfo.RespKeys))
                
                response = 1;
                break; % Dann soll die Loop abgebrochen werden
            end
        end
    else
        response = 0;
    end
    
end

if response == 1 % If valid key was pressed
    Trial(expTrial).RT_SecTask(Pos_MemSet) = timeSecs - start; % Calculate the Reaction Time
    % Save the actual response
    Trial(expTrial).Response_SecTask(Pos_MemSet) = pressedKey;
    
    % Test wether the correct response was given
    if strcmp(pressedKey,Trial(expTrial).CorrRespSize(Pos_MemSet))
        Trial(expTrial).ACC_SecTask(Pos_MemSet) = 1;
    else
        Trial(expTrial).ACC_SecTask(Pos_MemSet) = 0;
    end
    
    
    
else  % If no valid key was pressed
    Trial(expTrial).RT_SecTask(Pos_MemSet) = expinfo.MaxRTSec;
    Trial(expTrial).ACC_SecTask(Pos_MemSet) = 0;
    Trial(expTrial).Response_SecTask(Pos_MemSet) = 'm';
     
end

if Pos_MemSet == expinfo.SetSize*2
    Trial(expTrial).SumACCSecTask = sum(Trial(expTrial).ACC_SecTask)/(expinfo.SetSize*2);
end


while KbCheck; end % clear buffer
FlushEvents();

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de