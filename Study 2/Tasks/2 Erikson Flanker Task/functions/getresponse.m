% This function waits for a response and saves the
function Trial = getresponse(expinfo, Trial, expTrial, start)
% Start iternal MATLAB stop-clock
tic

% If timestamp for onset latency is not provided read out current system
% time. Attention this is just a work around and leads to biased reaction
% times
if ~exist('start','var')
    start = GetSecs;
end

% Initialise the response variables
Trial(expTrial).response = 0;
Trial(expTrial).ACC = -9;
Trial(expTrial).RT = -9;

% clear Buffer of Keyboard
while toc < 0.1; KbCheck;  end
io64(expinfo.ioObj, expinfo.PortAddress, 0); % Stop Writing to Output Port

% read out keyboard until valid key is pressed or maximal allowed response
% time is reached
ScreenCleared = 0;
while toc < expinfo.MaxRT
    % clear screen once after 0.250 ms
    if expinfo.LongRT ~= 1
        if toc >= 0.250 && ScreenCleared == 0
            clearScreen(expinfo.window,expinfo.Colors.bgColor);
            ScreenCleared = 1;
        end
    end
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
            response = -9;
            break
        elseif length(pressedKey) > 1
            response = -9;
            break
        else
            if any(strcmp(pressedKey,expinfo.RespKeys))
                
                response = 1;
                if strcmp(pressedKey,Trial(expTrial).CorResp)
                    if  Trial(expTrial).CorResp == 'd'
                        io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_D);
                    else
                        io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.CorrResp_L);
                    end
                else
                    if strcmp(pressedKey,'d')
                        io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp_D);
                    else
                        io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp_L);
                    end
                end
                break; % Dann soll die Loop abgebrochen werden
            end            
        end        
    else
        response = 0;
    end    
end
Trial(expTrial).keyPressed = timeSecs;

if response == 1 % Wenn eine erlaubte Taste gedr�ckt wurde
    Trial(expTrial).RT = timeSecs - start; % Berechnung der Reaktionszeit
    
    % Test wether the correct response was given
    if strcmp(pressedKey,Trial(expTrial).CorResp)
        Trial(expTrial).ACC = 1;
    else
        Trial(expTrial).ACC = 0;
    end
    
    Trial(expTrial).response = pressedKey;
elseif  response == 0  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
    Trial(expTrial).RT = expinfo.MaxRT;
    Trial(expTrial).ACC = -2;
    Trial(expTrial).response = 'miss';
    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.Miss);
else % Wenn keine erlaubte Taste gegeben wurde
    Trial(expTrial).RT = expinfo.MaxRT;
    Trial(expTrial).ACC = -3;
    Trial(expTrial).response = 'wrongKey';    
   io64(expinfo.ioObj, expinfo.PortAddress,expinfo.Marker.IncorrResp);
end

while KbCheck; end % clear buffer
FlushEvents('keyDown');

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uni-heidelberg.de