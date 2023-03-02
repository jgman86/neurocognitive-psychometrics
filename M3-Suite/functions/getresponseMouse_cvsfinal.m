function [Trial, givenAnswer, response] = getresponseMouse(expinfo, Trial, expTrial,num)
tic
start = GetSecs;


response = 0;
RT = 0;
givenAnswer = 0;


if num == 1
    SetMouse(expinfo.centerX, expinfo.centerY, expinfo.window);
    ShowCursor(0);
end

while response == 0
    [cursorX, cursorY, RespButton] = GetMouse(expinfo.window); % Read Mouse

    if RespButton(1) == 1
        if (cursorX >= expinfo.RangeRespGrid1(1) && cursorX <= expinfo.RangeRespGrid1(3) && cursorY >= expinfo.RangeRespGrid1(2) && cursorY <= expinfo.RangeRespGrid1(4)) || ...
                (cursorX >= expinfo.RangeRespGrid2(1) && cursorX <= expinfo.RangeRespGrid2(3) && cursorY >= expinfo.RangeRespGrid2(2) && cursorY <= expinfo.RangeRespGrid2(4)) || ...
                (cursorX >= expinfo.RangeRespGrid3(1) && cursorX <= expinfo.RangeRespGrid3(3) && cursorY >= expinfo.RangeRespGrid3(2) && cursorY <= expinfo.RangeRespGrid3(4)) || ...
                (cursorX >= expinfo.RangeRespGrid4(1) && cursorX <= expinfo.RangeRespGrid4(3) && cursorY >= expinfo.RangeRespGrid4(2) && cursorY <= expinfo.RangeRespGrid4(4)) || ...
                (cursorX >= expinfo.RangeRespGrid5(1) && cursorX <= expinfo.RangeRespGrid5(3) && cursorY >= expinfo.RangeRespGrid5(2) && cursorY <= expinfo.RangeRespGrid5(4)) || ...
                (cursorX >= expinfo.RangeRespGrid6(1) && cursorX <= expinfo.RangeRespGrid6(3) && cursorY >= expinfo.RangeRespGrid6(2) && cursorY <= expinfo.RangeRespGrid6(4)) || ...
                (cursorX >= expinfo.RangeRespGrid7(1) && cursorX <= expinfo.RangeRespGrid7(3) && cursorY >= expinfo.RangeRespGrid7(2) && cursorY <= expinfo.RangeRespGrid7(4)) || ...
                (cursorX >= expinfo.RangeRespGrid8(1) && cursorX <= expinfo.RangeRespGrid8(3) && cursorY >= expinfo.RangeRespGrid8(2) && cursorY <= expinfo.RangeRespGrid8(4)) || ...
                (cursorX >= expinfo.RangeRespGrid9(1) && cursorX <= expinfo.RangeRespGrid9(3) && cursorY >= expinfo.RangeRespGrid9(2) && cursorY <= expinfo.RangeRespGrid9(4)) || ...
                (cursorX >= expinfo.RangeRespGrid10(1) && cursorX <= expinfo.RangeRespGrid10(3) && cursorY >= expinfo.RangeRespGrid10(2) && cursorY <= expinfo.RangeRespGrid10(4)) || ...
                (cursorX >= expinfo.RangeRespGrid11(1) && cursorX <= expinfo.RangeRespGrid11(3) && cursorY >= expinfo.RangeRespGrid11(2) && cursorY <= expinfo.RangeRespGrid11(4)) || ...
                (cursorX >= expinfo.RangeRespGrid12(1) && cursorX <= expinfo.RangeRespGrid12(3) && cursorY >= expinfo.RangeRespGrid12(2) && cursorY <= expinfo.RangeRespGrid12(4)) || ...
                (cursorX >= expinfo.RangeRespGrid13(1) && cursorX <= expinfo.RangeRespGrid13(3) && cursorY >= expinfo.RangeRespGrid13(2) && cursorY <= expinfo.RangeRespGrid13(4)) || ...
                (cursorX >= expinfo.RangeRespGrid14(1) && cursorX <= expinfo.RangeRespGrid14(3) && cursorY >= expinfo.RangeRespGrid14(2) && cursorY <= expinfo.RangeRespGrid14(4)) || ...
                (cursorX >= expinfo.RangeRespGrid15(1) && cursorX <= expinfo.RangeRespGrid15(3) && cursorY >= expinfo.RangeRespGrid15(2) && cursorY <= expinfo.RangeRespGrid15(4)) || ...
                (cursorX >= expinfo.RangeRespGrid16(1) && cursorX <= expinfo.RangeRespGrid16(3) && cursorY >= expinfo.RangeRespGrid16(2) && cursorY <= expinfo.RangeRespGrid16(4))
            
            timeSecs = GetSecs;
            response = 1;
            answerX = cursorX;
            answerY = cursorY;
            break; % Dann soll die Loop abgebrochen werden
        end
    end
    response = 0;
end

if  RespButton(1) == 1 && response == 1% Wenn eine erlaubte Taste gedr�ckt wurde
    
    RT = timeSecs - start; % Berechnung der Reaktionszeit
    
    if  answerX >= expinfo.RangeRespGrid1(1) && answerY >= expinfo.RangeRespGrid1(2) && answerX <= expinfo.RangeRespGrid1(3) && answerY <= expinfo.RangeRespGrid1(4)
        givenAnswer = 1;
    elseif answerX >= expinfo.RangeRespGrid2(1) && answerY >= expinfo.RangeRespGrid2(2) && answerX <= expinfo.RangeRespGrid2(3) && answerY <= expinfo.RangeRespGrid2(4)
        givenAnswer = 2;
    elseif answerX >= expinfo.RangeRespGrid3(1) && answerY >= expinfo.RangeRespGrid3(2) && answerX <= expinfo.RangeRespGrid3(3) && answerY <= expinfo.RangeRespGrid3(4)
        givenAnswer = 3;
    elseif answerX >= expinfo.RangeRespGrid4(1) && answerY >= expinfo.RangeRespGrid4(2) && answerX <= expinfo.RangeRespGrid4(3) && answerY <= expinfo.RangeRespGrid4(4)
        givenAnswer = 4;
    elseif answerX >= expinfo.RangeRespGrid5(1) && answerY >= expinfo.RangeRespGrid5(2) && answerX <= expinfo.RangeRespGrid5(3) && answerY <= expinfo.RangeRespGrid5(4)
        givenAnswer = 5;
    elseif answerX >= expinfo.RangeRespGrid6(1) && answerY >= expinfo.RangeRespGrid6(2) && answerX <= expinfo.RangeRespGrid6(3) && answerY <= expinfo.RangeRespGrid6(4)
        givenAnswer = 6;
    elseif answerX >= expinfo.RangeRespGrid7(1) && answerY >= expinfo.RangeRespGrid7(2) && answerX <= expinfo.RangeRespGrid7(3) && answerY <= expinfo.RangeRespGrid7(4)
        givenAnswer = 7;
    elseif answerX >= expinfo.RangeRespGrid8(1) && answerY >= expinfo.RangeRespGrid8(2) && answerX <= expinfo.RangeRespGrid8(3) && answerY <= expinfo.RangeRespGrid8(4)
        givenAnswer = 8;
    elseif answerX >= expinfo.RangeRespGrid9(1) && answerY >= expinfo.RangeRespGrid9(2) && answerX <= expinfo.RangeRespGrid9(3) && answerY <= expinfo.RangeRespGrid9(4)
        givenAnswer = 9;
    elseif answerX >= expinfo.RangeRespGrid10(1) && answerY >= expinfo.RangeRespGrid10(2) && answerX <= expinfo.RangeRespGrid10(3) && answerY <= expinfo.RangeRespGrid10(4)
        givenAnswer = 10;
    elseif answerX >= expinfo.RangeRespGrid11(1) && answerY >= expinfo.RangeRespGrid11(2) && answerX <= expinfo.RangeRespGrid11(3) && answerY <= expinfo.RangeRespGrid11(4)
        givenAnswer = 11;
    elseif answerX >= expinfo.RangeRespGrid12(1) && answerY >= expinfo.RangeRespGrid12(2) && answerX <= expinfo.RangeRespGrid12(3) && answerY <= expinfo.RangeRespGrid12(4)
        givenAnswer = 12;
    elseif answerX >= expinfo.RangeRespGrid13(1) && answerY >= expinfo.RangeRespGrid13(2) && answerX <= expinfo.RangeRespGrid13(3) && answerY <= expinfo.RangeRespGrid13(4)
        givenAnswer = 13;
    elseif answerX >= expinfo.RangeRespGrid14(1) && answerY >= expinfo.RangeRespGrid14(2) && answerX <= expinfo.RangeRespGrid14(3) && answerY <= expinfo.RangeRespGrid14(4)
        givenAnswer= 14;
    elseif answerX >= expinfo.RangeRespGrid15(1) && answerY >= expinfo.RangeRespGrid15(2) && answerX <= expinfo.RangeRespGrid15(3) && answerY <= expinfo.RangeRespGrid15(4)
        givenAnswer = 15;
    elseif answerX >= expinfo.RangeRespGrid16(1) && answerY >= expinfo.RangeRespGrid16(2) && answerX <= expinfo.RangeRespGrid16(3) && answerY <= expinfo.RangeRespGrid16(4)
        givenAnswer = 16;
    end
    
    % Test wether the correct response was given
    if givenAnswer == Trial(expTrial).CorrRespPositions(num)
        ACC = 1;
    else
        ACC = 0;
    end
    
    MemsLures = Trial(expTrial).CorrRespPositions;
    MemsLures(num) = [];
    
    if ismember(givenAnswer,MemsLures)
        MemSetLure = 1;
    else
        MemSetLure = 0;
    end
    
    if  ismember(givenAnswer,Trial(expTrial).LurePositions)
        OuterSetLure = 1;
    else
        OuterSetLure = 0;
    end
    
    DistractorLures = Trial(expTrial).DistrLurePositions;
    DistractorLures(num) = [];
    if ismember(givenAnswer,DistractorLures)
        DistractorLureOther = 1;
    else
        DistractorLureOther = 0;
    end
    
    if ismember(givenAnswer,Trial(expTrial).DistrLurePositions(num))
        DistractorLureInPos = 1;
    else
        DistractorLureInPos = 0;
    end
    
    Misses = 0;
    
else  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
    OuterSetLure = 0;
    DistractorLureInPos = 0;
    DistractorLureOther = 0;
    MemSetLure = 0;
    Misses = 1;
    RT = expinfo.MaxRTGrid;
    ACC = 0;
    givenAnswer = 0;
    response = 'm';
    
end

Trial(expTrial).ACC(num) = ACC;
Trial(expTrial).RTGrid(num) = RT;
Trial(expTrial).givenAnswer(num) = givenAnswer;
Trial(expTrial).response(num) = response;
Trial(expTrial).resOutersetLures(num) = OuterSetLure;
Trial(expTrial).resDistractorLureOther(num) = DistractorLureOther;
Trial(expTrial).resDistractorLureInPos(num) = DistractorLureInPos;
Trial(expTrial).resMemSetLures(num) = MemSetLure;
Trial(expTrial).Misses(num) = Misses;

if num == expinfo.nMemStims
    Trial(expTrial).SumACC = sum(Trial(expTrial).ACC);
    Trial(expTrial).SumOuterSetLures = sum(Trial(expTrial).resOutersetLures);
    Trial(expTrial).SumMemSetLures = sum(Trial(expTrial).resMemSetLures);
    Trial(expTrial).SumDistractorLureInPos = sum(Trial(expTrial).resDistractorLureInPos);
    Trial(expTrial).SumDistractorLureOther = sum(Trial(expTrial).resDistractorLureOther);
   Trial(expTrial).SumMisses = sum(Trial(expTrial).Misses);
    
end



if num == expinfo.nMemStims
    HideCursor();
end

FlushEvents();

end