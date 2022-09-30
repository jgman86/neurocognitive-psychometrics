function [Trial, givenAnswer_mouse_sec, response_mouse_sec] = getresponseMouse_secondary(expinfo, Trial, expTrial,Pos)
tic
start = GetSecs;


response_mouse_sec = 0;
RT_sec = 0;
givenAnswer_mouse_sec = 0;

if Pos == 1
    SetMouse(expinfo.centerX, expinfo.centerY, expinfo.window);
    ShowCursor(0);
end

while response_mouse_sec == 0  && toc < expinfo.MaxRTSec
    [cursorX, cursorY, RespButton] = GetMouse(expinfo.window); % Read Mouse
    timeSecs = GetSecs;
    
    if RespButton(1) == 1
        if (cursorX >= Trial(expTrial).MemCoordArray(Pos,1) && cursorX <= Trial(expTrial).MemCoordArray(Pos,3) && cursorY >= Trial(expTrial).MemCoordArray(Pos,2) && cursorY <= Trial(expTrial).MemCoordArray(Pos,4)) || ...
           (cursorX >= Trial(expTrial).DistCoordArray(Pos,1) && cursorX <= Trial(expTrial).DistCoordArray(Pos,3) && cursorY >= Trial(expTrial).DistCoordArray(Pos,2) && cursorY <= Trial(expTrial).DistCoordArray(Pos,4))


            timeSecs = GetSecs;
            response_mouse_sec = 1;
            answerX = cursorX;
            answerY = cursorY;
            break; % Dann soll die Loop abgebrochen werden
        end
    end
    response_mouse_sec = 0;
end

if  RespButton(1) == 1 && response_mouse_sec == 1 % Wenn eine erlaubte Taste gedr�ckt wurde
    
    RT_sec = timeSecs - start; % Berechnung der Reaktionszeit
    
    if  answerX >= Trial(expTrial).MemCoordArray(Pos,1) && answerY >= Trial(expTrial).MemCoordArray(Pos,2) && answerX <= Trial(expTrial).MemCoordArray(Pos,3)&& answerY <= Trial(expTrial).MemCoordArray(Pos,4)
        givenAnswer_mouse_sec = "Mem";
    elseif Trial(expTrial).DistCoordArray(Pos,1) && answerY >= Trial(expTrial).DistCoordArray(Pos,2) && answerX <= Trial(expTrial).DistCoordArray(Pos,3)&& answerY <= Trial(expTrial).DistCoordArray(Pos,4)
        givenAnswer_mouse_sec = "Dist";
    end
    
    %% Track Answer Correct Answer for Secondary Task 

    % Track Correct Answer for brighter Color 
    if strcmp(givenAnswer_mouse_sec,Trial(expTrial).BrightColor(Pos)) == 1
        ACC_sec = 1;
    else
        ACC_sec = 0;
    end
    
       
else  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
 
    Misses = 1;
    RT_sec = expinfo.MaxRTSec;
    ACC_sec = 0;
    givenAnswer_mouse_sec = 0;
    response_mouse_sec = 'm';
    
end

Trial(expTrial).ACC_secondary(Pos) = ACC_sec;
Trial(expTrial).RT_secondary(Pos) = RT_sec;
Trial(expTrial).givenAnswer_mouse_sec(Pos) = givenAnswer_mouse_sec;
Trial(expTrial).response_mouse_sec(Pos) = response_mouse_sec;


if Pos == expinfo.SetSize
    HideCursor();
end

FlushEvents();

end