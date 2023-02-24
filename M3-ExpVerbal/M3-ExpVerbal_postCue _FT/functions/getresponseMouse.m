function [Trial, givenAnswer_mouse, response_mouse] = getresponseMouse(expinfo, Trial, expTrial,Pos)
tic
start = GetSecs;


response_mouse = 0;
RT = 0;
givenAnswer_mouse = 0;

if Pos == 1
    SetMouse(expinfo.centerX, expinfo.centerY, expinfo.window);
    ShowCursor(0);
end

while response_mouse == 0  %&& toc < expinfo.MaxRTGrid
    [cursorX, cursorY, RespButton] = GetMouse(expinfo.window); % Read Mouse
    timeSecs = GetSecs;
    
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
                (cursorX >= expinfo.RangeRespGrid16(1) && cursorX <= expinfo.RangeRespGrid16(3) && cursorY >= expinfo.RangeRespGrid16(2) && cursorY <= expinfo.RangeRespGrid16(4)) ||...
                (cursorX >= expinfo.RangeRespGrid17(1) && cursorX <= expinfo.RangeRespGrid17(3) && cursorY >= expinfo.RangeRespGrid17(2) && cursorY <= expinfo.RangeRespGrid17(4)) || ...
                (cursorX >= expinfo.RangeRespGrid18(1) && cursorX <= expinfo.RangeRespGrid18(3) && cursorY >= expinfo.RangeRespGrid18(2) && cursorY <= expinfo.RangeRespGrid18(4)) || ...
                (cursorX >= expinfo.RangeRespGrid19(1) && cursorX <= expinfo.RangeRespGrid19(3) && cursorY >= expinfo.RangeRespGrid19(2) && cursorY <= expinfo.RangeRespGrid19(4)) || ...
                (cursorX >= expinfo.RangeRespGrid20(1) && cursorX <= expinfo.RangeRespGrid20(3) && cursorY >= expinfo.RangeRespGrid20(2) && cursorY <= expinfo.RangeRespGrid20(4)) || ...
                (cursorX >= expinfo.RangeRespGrid21(1) && cursorX <= expinfo.RangeRespGrid21(3) && cursorY >= expinfo.RangeRespGrid21(2) && cursorY <= expinfo.RangeRespGrid21(4)) || ...
                (cursorX >= expinfo.RangeRespGrid22(1) && cursorX <= expinfo.RangeRespGrid22(3) && cursorY >= expinfo.RangeRespGrid22(2) && cursorY <= expinfo.RangeRespGrid22(4)) || ...
                (cursorX >= expinfo.RangeRespGrid23(1) && cursorX <= expinfo.RangeRespGrid23(3) && cursorY >= expinfo.RangeRespGrid23(2) && cursorY <= expinfo.RangeRespGrid23(4)) || ...
                (cursorX >= expinfo.RangeRespGrid24(1) && cursorX <= expinfo.RangeRespGrid24(3) && cursorY >= expinfo.RangeRespGrid24(2) && cursorY <= expinfo.RangeRespGrid24(4)) || ...
                (cursorX >= expinfo.RangeRespGrid25(1) && cursorX <= expinfo.RangeRespGrid25(3) && cursorY >= expinfo.RangeRespGrid25(2) && cursorY <= expinfo.RangeRespGrid25(4))
              
%                 (cursorX >= expinfo.RangeRespGrid26(1) && cursorX <= expinfo.RangeRespGrid26(3) && cursorY >= expinfo.RangeRespGrid26(2) && cursorY <= expinfo.RangeRespGrid26(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid27(1) && cursorX <= expinfo.RangeRespGrid27(3) && cursorY >= expinfo.RangeRespGrid27(2) && cursorY <= expinfo.RangeRespGrid27(4)) ||...
%                 (cursorX >= expinfo.RangeRespGrid28(1) && cursorX <= expinfo.RangeRespGrid28(3) && cursorY >= expinfo.RangeRespGrid28(2) && cursorY <= expinfo.RangeRespGrid28(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid29(1) && cursorX <= expinfo.RangeRespGrid29(3) && cursorY >= expinfo.RangeRespGrid29(2) && cursorY <= expinfo.RangeRespGrid29(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid30(1) && cursorX <= expinfo.RangeRespGrid30(3) && cursorY >= expinfo.RangeRespGrid30(2) && cursorY <= expinfo.RangeRespGrid30(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid31(1) && cursorX <= expinfo.RangeRespGrid31(3) && cursorY >= expinfo.RangeRespGrid31(2) && cursorY <= expinfo.RangeRespGrid31(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid32(1) && cursorX <= expinfo.RangeRespGrid32(3) && cursorY >= expinfo.RangeRespGrid32(2) && cursorY <= expinfo.RangeRespGrid32(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid33(1) && cursorX <= expinfo.RangeRespGrid33(3) && cursorY >= expinfo.RangeRespGrid33(2) && cursorY <= expinfo.RangeRespGrid33(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid34(1) && cursorX <= expinfo.RangeRespGrid34(3) && cursorY >= expinfo.RangeRespGrid34(2) && cursorY <= expinfo.RangeRespGrid34(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid35(1) && cursorX <= expinfo.RangeRespGrid35(3) && cursorY >= expinfo.RangeRespGrid35(2) && cursorY <= expinfo.RangeRespGrid35(4)) || ...
%                 (cursorX >= expinfo.RangeRespGrid36(1) && cursorX <= expinfo.RangeRespGrid36(3) && cursorY >= expinfo.RangeRespGrid36(2) && cursorY <= expinfo.RangeRespGrid36(4)) 
            
            timeSecs = GetSecs;
            response_mouse = 1;
            answerX = cursorX;
            answerY = cursorY;
            break; % Dann soll die Loop abgebrochen werden
        end
    end
    response_mouse = 0;
end

if  RespButton(1) == 1 && response_mouse == 1 % Wenn eine erlaubte Taste gedr�ckt wurde
    
    RT = timeSecs - start; % Berechnung der Reaktionszeit
    
    if  answerX >= expinfo.RangeRespGrid1(1) && answerY >= expinfo.RangeRespGrid1(2) && answerX <= expinfo.RangeRespGrid1(3) && answerY <= expinfo.RangeRespGrid1(4)
        givenAnswer_mouse = 1;
    elseif answerX >= expinfo.RangeRespGrid2(1) && answerY >= expinfo.RangeRespGrid2(2) && answerX <= expinfo.RangeRespGrid2(3) && answerY <= expinfo.RangeRespGrid2(4)
        givenAnswer_mouse = 2;
    elseif answerX >= expinfo.RangeRespGrid3(1) && answerY >= expinfo.RangeRespGrid3(2) && answerX <= expinfo.RangeRespGrid3(3) && answerY <= expinfo.RangeRespGrid3(4)
        givenAnswer_mouse = 3;
    elseif answerX >= expinfo.RangeRespGrid4(1) && answerY >= expinfo.RangeRespGrid4(2) && answerX <= expinfo.RangeRespGrid4(3) && answerY <= expinfo.RangeRespGrid4(4)
        givenAnswer_mouse = 4;
    elseif answerX >= expinfo.RangeRespGrid5(1) && answerY >= expinfo.RangeRespGrid5(2) && answerX <= expinfo.RangeRespGrid5(3) && answerY <= expinfo.RangeRespGrid5(4)
        givenAnswer_mouse = 5;
    elseif answerX >= expinfo.RangeRespGrid6(1) && answerY >= expinfo.RangeRespGrid6(2) && answerX <= expinfo.RangeRespGrid6(3) && answerY <= expinfo.RangeRespGrid6(4)
        givenAnswer_mouse = 6;
    elseif answerX >= expinfo.RangeRespGrid7(1) && answerY >= expinfo.RangeRespGrid7(2) && answerX <= expinfo.RangeRespGrid7(3) && answerY <= expinfo.RangeRespGrid7(4)
        givenAnswer_mouse = 7;
    elseif answerX >= expinfo.RangeRespGrid8(1) && answerY >= expinfo.RangeRespGrid8(2) && answerX <= expinfo.RangeRespGrid8(3) && answerY <= expinfo.RangeRespGrid8(4)
        givenAnswer_mouse = 8;
    elseif answerX >= expinfo.RangeRespGrid9(1) && answerY >= expinfo.RangeRespGrid9(2) && answerX <= expinfo.RangeRespGrid9(3) && answerY <= expinfo.RangeRespGrid9(4)
        givenAnswer_mouse = 9;
    elseif answerX >= expinfo.RangeRespGrid10(1) && answerY >= expinfo.RangeRespGrid10(2) && answerX <= expinfo.RangeRespGrid10(3) && answerY <= expinfo.RangeRespGrid10(4)
        givenAnswer_mouse = 10;
    elseif answerX >= expinfo.RangeRespGrid11(1) && answerY >= expinfo.RangeRespGrid11(2) && answerX <= expinfo.RangeRespGrid11(3) && answerY <= expinfo.RangeRespGrid11(4)
        givenAnswer_mouse = 11;
    elseif answerX >= expinfo.RangeRespGrid12(1) && answerY >= expinfo.RangeRespGrid12(2) && answerX <= expinfo.RangeRespGrid12(3) && answerY <= expinfo.RangeRespGrid12(4)
        givenAnswer_mouse = 12;
    elseif answerX >= expinfo.RangeRespGrid13(1) && answerY >= expinfo.RangeRespGrid13(2) && answerX <= expinfo.RangeRespGrid13(3) && answerY <= expinfo.RangeRespGrid13(4)
        givenAnswer_mouse = 13;
    elseif answerX >= expinfo.RangeRespGrid14(1) && answerY >= expinfo.RangeRespGrid14(2) && answerX <= expinfo.RangeRespGrid14(3) && answerY <= expinfo.RangeRespGrid14(4)
        givenAnswer_mouse= 14;
    elseif answerX >= expinfo.RangeRespGrid15(1) && answerY >= expinfo.RangeRespGrid15(2) && answerX <= expinfo.RangeRespGrid15(3) && answerY <= expinfo.RangeRespGrid15(4)
        givenAnswer_mouse = 15;
    elseif answerX >= expinfo.RangeRespGrid16(1) && answerY >= expinfo.RangeRespGrid16(2) && answerX <= expinfo.RangeRespGrid16(3) && answerY <= expinfo.RangeRespGrid16(4)
        givenAnswer_mouse = 16;
    elseif answerX >= expinfo.RangeRespGrid17(1) && answerY >= expinfo.RangeRespGrid17(2) && answerX <= expinfo.RangeRespGrid17(3) && answerY <= expinfo.RangeRespGrid17(4)
        givenAnswer_mouse = 17;
    elseif answerX >= expinfo.RangeRespGrid18(1) && answerY >= expinfo.RangeRespGrid18(2) && answerX <= expinfo.RangeRespGrid18(3) && answerY <= expinfo.RangeRespGrid18(4)
        givenAnswer_mouse = 18;
    elseif answerX >= expinfo.RangeRespGrid19(1) && answerY >= expinfo.RangeRespGrid19(2) && answerX <= expinfo.RangeRespGrid19(3) && answerY <= expinfo.RangeRespGrid19(4)
        givenAnswer_mouse = 19;
    elseif answerX >= expinfo.RangeRespGrid20(1) && answerY >= expinfo.RangeRespGrid20(2) && answerX <= expinfo.RangeRespGrid20(3) && answerY <= expinfo.RangeRespGrid20(4)
        givenAnswer_mouse = 20;
    elseif answerX >= expinfo.RangeRespGrid21(1) && answerY >= expinfo.RangeRespGrid21(2) && answerX <= expinfo.RangeRespGrid21(3) && answerY <= expinfo.RangeRespGrid21(4)
        givenAnswer_mouse = 21;
    elseif answerX >= expinfo.RangeRespGrid22(1) && answerY >= expinfo.RangeRespGrid22(2) && answerX <= expinfo.RangeRespGrid22(3) && answerY <= expinfo.RangeRespGrid22(4)
        givenAnswer_mouse = 22;
    elseif answerX >= expinfo.RangeRespGrid23(1) && answerY >= expinfo.RangeRespGrid23(2) && answerX <= expinfo.RangeRespGrid23(3) && answerY <= expinfo.RangeRespGrid23(4)
        givenAnswer_mouse= 23;
    elseif answerX >= expinfo.RangeRespGrid24(1) && answerY >= expinfo.RangeRespGrid24(2) && answerX <= expinfo.RangeRespGrid24(3) && answerY <= expinfo.RangeRespGrid24(4)
        givenAnswer_mouse = 24;
    elseif answerX >= expinfo.RangeRespGrid25(1) && answerY >= expinfo.RangeRespGrid25(2) && answerX <= expinfo.RangeRespGrid25(3) && answerY <= expinfo.RangeRespGrid25(4)
        givenAnswer_mouse = 25;
%     elseif answerX >= expinfo.RangeRespGrid26(1) && answerY >= expinfo.RangeRespGrid26(2) && answerX <= expinfo.RangeRespGrid26(3) && answerY <= expinfo.RangeRespGrid26(4)
%         givenAnswer_mouse = 26;
%     elseif answerX >= expinfo.RangeRespGrid27(1) && answerY >= expinfo.RangeRespGrid27(2) && answerX <= expinfo.RangeRespGrid27(3) && answerY <= expinfo.RangeRespGrid27(4)
%         givenAnswer_mouse = 27;
%     elseif answerX >= expinfo.RangeRespGrid28(1) && answerY >= expinfo.RangeRespGrid28(2) && answerX <= expinfo.RangeRespGrid28(3) && answerY <= expinfo.RangeRespGrid28(4)
%         givenAnswer_mouse = 28;
%     elseif answerX >= expinfo.RangeRespGrid29(1) && answerY >= expinfo.RangeRespGrid29(2) && answerX <= expinfo.RangeRespGrid29(3) && answerY <= expinfo.RangeRespGrid29(4)
%         givenAnswer_mouse = 29;
%     elseif answerX >= expinfo.RangeRespGrid30(1) && answerY >= expinfo.RangeRespGrid30(2) && answerX <= expinfo.RangeRespGrid30(3) && answerY <= expinfo.RangeRespGrid30(4)
%         givenAnswer_mouse = 30;
%     elseif answerX >= expinfo.RangeRespGrid31(1) && answerY >= expinfo.RangeRespGrid31(2) && answerX <= expinfo.RangeRespGrid31(3) && answerY <= expinfo.RangeRespGrid31(4)
%         givenAnswer_mouse = 31;
%     elseif answerX >= expinfo.RangeRespGrid32(1) && answerY >= expinfo.RangeRespGrid32(2) && answerX <= expinfo.RangeRespGrid32(3) && answerY <= expinfo.RangeRespGrid32(4)
%         givenAnswer_mouse = 32;
%     elseif answerX >= expinfo.RangeRespGrid33(1) && answerY >= expinfo.RangeRespGrid33(2) && answerX <= expinfo.RangeRespGrid33(3) && answerY <= expinfo.RangeRespGrid33(4)
%         givenAnswer_mouse = 33;
%     elseif answerX >= expinfo.RangeRespGrid34(1) && answerY >= expinfo.RangeRespGrid34(2) && answerX <= expinfo.RangeRespGrid34(3) && answerY <= expinfo.RangeRespGrid34(4)
%         givenAnswer_mouse = 34;
%     elseif answerX >= expinfo.RangeRespGrid35(1) && answerY >= expinfo.RangeRespGrid35(2) && answerX <= expinfo.RangeRespGrid35(3) && answerY <= expinfo.RangeRespGrid35(4)
%         givenAnswer_mouse = 35;
%     elseif answerX >= expinfo.RangeRespGrid36(1) && answerY >= expinfo.RangeRespGrid36(2) && answerX <= expinfo.RangeRespGrid36(3) && answerY <= expinfo.RangeRespGrid36(4)
%         givenAnswer_mouse = 36;
    end
    
    %% Track Answer Categories for IIP, IOP, DIP, DIOP and NPL
    
    % Track Correct Answer as ACC and IIP
    if givenAnswer_mouse == Trial(expTrial).Corr_Pos(Pos)
        ACC = 1;
        IIP = 1;
    else
        ACC = 0;
        IIP = 0;
    end
    
    % IOP
    
    IOP = Trial(expTrial).IOP_Pos(Pos,:);
    
    if ismember(givenAnswer_mouse,IOP)
        IOP = 1;
    else
        IOP = 0;
    end
    
    % DIP

    
    DIP = Trial(expTrial).DIP_Pos(Pos,:);
    
    if ismember(givenAnswer_mouse,DIP)
        DIP = 1;
    else
        DIP = 0;
    end
    
    % DIOP
    
    DIOP = Trial(expTrial).DIOP_Pos(Pos,:);
    
    if ismember(givenAnswer_mouse,DIOP)
        
        DIOP = 1;
    else
        
        DIOP = 0;
    end
    
    % NPL
    
    if  ismember(givenAnswer_mouse,Trial(expTrial).NPL_Pos)
        NPLs = 1;
    else
        NPLs = 0;
    end
    
    % Misses
    
    Misses = 0;
    
else  % Wenn keine erlaubte Antwort gegeben wurde -> Miss
    IIP = 0;
    NPLs = 0;
    IOP = 0;
    DIP = 0;
    DIOP = 0;
    Misses = 1;
    RT = expinfo.MaxRTGrid;
    ACC = 0;
    givenAnswer_mouse = 0;
    response_mouse = 'm';
    
end

Trial(expTrial).ACC(Pos) = ACC;
Trial(expTrial).RTGrid(Pos) = RT;
Trial(expTrial).givenAnswer_mouse(Pos) = givenAnswer_mouse;
Trial(expTrial).response_mouse(Pos) = response_mouse;
Trial(expTrial).ChosenIIP(Pos) = IIP;
Trial(expTrial).ChosenIOP(Pos) = IOP;
Trial(expTrial).ChosenDIP(Pos) = DIP;
Trial(expTrial).ChosenDIOP(Pos) = DIOP;
Trial(expTrial).ChosenNPLs(Pos) = NPLs;
Trial(expTrial).Misses(Pos) = Misses;

if Pos == expinfo.SetSize
    Trial(expTrial).SumACC = sum(Trial(expTrial).ACC)/(expinfo.SetSize);
    Trial(expTrial).SumIIP = sum(Trial(expTrial).ChosenIIP);
    Trial(expTrial).SumIOP = sum(Trial(expTrial).ChosenIOP);
    Trial(expTrial).SumDIP = sum(Trial(expTrial).ChosenDIP);
    Trial(expTrial).SumDIOP = sum(Trial(expTrial).ChosenDIOP);
    Trial(expTrial).SumNPLs = sum(Trial(expTrial).ChosenNPLs);
    Trial(expTrial).SumMisses = sum(Trial(expTrial).Misses);

end


if Pos == expinfo.SetSize
    HideCursor();
end

FlushEvents();

end