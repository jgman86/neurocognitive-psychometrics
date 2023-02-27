% This function waits for a response and saves the
function [Trial, next_flip] = getresponse(expinfo, Trial, expTrial, n_cues, when)
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

    if toc < expinfo.EncTime

        next_flip = when;

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

    elseif toc >= expinfo.EncTime
         
         % Mask Stim after Encoding Time and continue to wait for Input
         % till Max RT is reached.
         Trial(expTrial).BlankTimeEnc(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,when,0);
         next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).BlankTimeEnc(n_cues),expinfo.MaxRTSec-expinfo.EncTime);

    

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

end

if response == 1 % If valid key was pressed
    Trial(expTrial).RT_SecTask(n_cues) = timeSecs - start; % Calculate the Reaction Time

    % Save the actual response
    Trial(expTrial).Response_SecTask(n_cues) = pressedKey;

    % Test wether the correct response was given
    if strcmp(pressedKey,Trial(expTrial).CorrRespSize(n_cues))
        Trial(expTrial).ACC_SecTask(n_cues) = 1;
        io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.RespSecondary_correct);

    else
        Trial(expTrial).ACC_SecTask(n_cues) = 0;
        io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.RespSecondary_incorrect);
    end

   % New approach
        Trial(expTrial).BlankTimeDec(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip,0);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).BlankTimeDec(n_cues),expinfo.MaxRTSec-Trial(expTrial).RT_SecTask(n_cues));


   

else  % If no valid key was pressed

    Trial(expTrial).RT_SecTask(n_cues) = expinfo.MaxRTSec;
    Trial(expTrial).ACC_SecTask(n_cues) = 0;
    Trial(expTrial).Response_SecTask(n_cues) = 'm';
    io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.RespSecondary_miss);
    WaitSecs(0.05);

    %New approach
    Trial(expTrial).BlankTimeDec(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,when,0);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).BlankTimeDec(n_cues),expinfo.MaxRTSec-Trial(expTrial).RT_SecTask(n_cues));

end

 

if n_cues == expinfo.SetSize*2
    Trial(expTrial).SumACCSecTask = sum(Trial(expTrial).ACC_SecTask)/(expinfo.SetSize*2);
end


while KbCheck; end % clear buffer
FlushEvents();

%% End of Function