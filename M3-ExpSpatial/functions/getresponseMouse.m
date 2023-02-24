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
        if (cursorX >= expinfo.Coord(1,1) && cursorX <= expinfo.Coord(1,3) && cursorY >= expinfo.Coord(1,2) && cursorY <= expinfo.Coord(1,4)) || ...
                (cursorX >= expinfo.Coord(2,1) && cursorX <= expinfo.Coord(2,3) && cursorY >= expinfo.Coord(2,2) && cursorY <= expinfo.Coord(2,4)) || ...
                (cursorX >= expinfo.Coord(3,1) && cursorX <= expinfo.Coord(3,3) && cursorY >= expinfo.Coord(3,2) && cursorY <= expinfo.Coord(3,4)) || ...
                (cursorX >= expinfo.Coord(4,1) && cursorX <= expinfo.Coord(4,3) && cursorY >= expinfo.Coord(4,2) && cursorY <= expinfo.Coord(4,4)) || ...
                (cursorX >= expinfo.Coord(5,1) && cursorX <= expinfo.Coord(5,3) && cursorY >= expinfo.Coord(5,2) && cursorY <= expinfo.Coord(5,4)) || ...
                (cursorX >= expinfo.Coord(6,1) && cursorX <= expinfo.Coord(6,3) && cursorY >= expinfo.Coord(6,2) && cursorY <= expinfo.Coord(6,4)) || ...
                (cursorX >= expinfo.Coord(7,1) && cursorX <= expinfo.Coord(7,3) && cursorY >= expinfo.Coord(7,2) && cursorY <= expinfo.Coord(7,4)) || ...
                (cursorX >= expinfo.Coord(8,1) && cursorX <= expinfo.Coord(8,3) && cursorY >= expinfo.Coord(8,2) && cursorY <= expinfo.Coord(8,4)) || ...
                (cursorX >= expinfo.Coord(9,1) && cursorX <= expinfo.Coord(9,3) && cursorY >= expinfo.Coord(9,2) && cursorY <= expinfo.Coord(9,4)) || ...
                (cursorX >= expinfo.Coord(10,1) && cursorX <= expinfo.Coord(10,3) && cursorY >= expinfo.Coord(10,2) && cursorY <= expinfo.Coord(10,4)) || ...
                (cursorX >= expinfo.Coord(11,1) && cursorX <= expinfo.Coord(11,3) && cursorY >= expinfo.Coord(11,2) && cursorY <= expinfo.Coord(11,4)) || ...
                (cursorX >= expinfo.Coord(12,1) && cursorX <= expinfo.Coord(12,3) && cursorY >= expinfo.Coord(12,2) && cursorY <= expinfo.Coord(12,4)) || ...
                (cursorX >= expinfo.Coord(13,1) && cursorX <= expinfo.Coord(13,3) && cursorY >= expinfo.Coord(13,2) && cursorY <= expinfo.Coord(13,4)) || ...
                (cursorX >= expinfo.Coord(14,1) && cursorX <= expinfo.Coord(14,3) && cursorY >= expinfo.Coord(14,2) && cursorY <= expinfo.Coord(14,4)) || ...
                (cursorX >= expinfo.Coord(15,1) && cursorX <= expinfo.Coord(15,3) && cursorY >= expinfo.Coord(15,2) && cursorY <= expinfo.Coord(15,4)) || ...
                (cursorX >= expinfo.Coord(16,1) && cursorX <= expinfo.Coord(16,3) && cursorY >= expinfo.Coord(16,2) && cursorY <= expinfo.Coord(16,4)) || ...
                (cursorX >= expinfo.Coord(17,1) && cursorX <= expinfo.Coord(17,3) && cursorY >= expinfo.Coord(17,2) && cursorY <= expinfo.Coord(17,4)) || ...
                (cursorX >= expinfo.Coord(18,1) && cursorX <= expinfo.Coord(18,3) && cursorY >= expinfo.Coord(18,2) && cursorY <= expinfo.Coord(18,4)) || ...
                (cursorX >= expinfo.Coord(19,1) && cursorX <= expinfo.Coord(19,3) && cursorY >= expinfo.Coord(19,2) && cursorY <= expinfo.Coord(19,4)) || ...
                (cursorX >= expinfo.Coord(20,1) && cursorX <= expinfo.Coord(20,3) && cursorY >= expinfo.Coord(20,2) && cursorY <= expinfo.Coord(20,4))

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
    
    if  answerX >= expinfo.Coord(1,1) && answerY >= expinfo.Coord(1,2) && answerX <= expinfo.Coord(1,3) && answerY <= expinfo.Coord(1,4)
        givenAnswer_mouse = 1;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(1,1) expinfo.Coord(1,2) expinfo.Coord(1,3)  expinfo.Coord(1,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);
    
    elseif answerX >= expinfo.Coord(2,1) && answerY >= expinfo.Coord(2,2) && answerX <= expinfo.Coord(2,3)&& answerY <= expinfo.Coord(2,4)
        givenAnswer_mouse = 2;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(2,1) expinfo.Coord(2,2) expinfo.Coord(2,3)  expinfo.Coord(2,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(3,1) && answerY >= expinfo.Coord(3,2) && answerX <= expinfo.Coord(3,3)&& answerY <= expinfo.Coord(3,4)
        givenAnswer_mouse = 3;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(3,1) expinfo.Coord(3,2) expinfo.Coord(3,3)  expinfo.Coord(3,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(4,1) && answerY >= expinfo.Coord(4,2) && answerX <= expinfo.Coord(4,3)&& answerY <= expinfo.Coord(4,4)
        givenAnswer_mouse = 4;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(4,1) expinfo.Coord(4,2) expinfo.Coord(4,3)  expinfo.Coord(4,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(5,1) && answerY >= expinfo.Coord(5,2) && answerX <= expinfo.Coord(5,3)&& answerY <= expinfo.Coord(5,4)
        givenAnswer_mouse = 5;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(5,1) expinfo.Coord(5,2) expinfo.Coord(5,3) expinfo.Coord(5,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(6,1) && answerY >= expinfo.Coord(6,2) && answerX <= expinfo.Coord(6,3)&& answerY <= expinfo.Coord(6,4)
        givenAnswer_mouse = 6;
        
        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(6,1) expinfo.Coord(6,2) expinfo.Coord(6,3) expinfo.Coord(6,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(7,1) && answerY >= expinfo.Coord(7,2) && answerX <= expinfo.Coord(7,3)&& answerY <= expinfo.Coord(7,4)
        givenAnswer_mouse = 7;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(7,1) expinfo.Coord(7,2) expinfo.Coord(7,3) expinfo.Coord(7,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(8,1) && answerY >= expinfo.Coord(8,2) && answerX <= expinfo.Coord(8,3)&& answerY <= expinfo.Coord(8,4)
        givenAnswer_mouse = 8;
        
        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(8,1) expinfo.Coord(8,2) expinfo.Coord(8,3)  expinfo.Coord(8,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);


    elseif answerX >= expinfo.Coord(9,1) && answerY >= expinfo.Coord(9,2) && answerX <= expinfo.Coord(9,3)&& answerY <= expinfo.Coord(9,4)
        givenAnswer_mouse = 9;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(9,1) expinfo.Coord(9,2) expinfo.Coord(9,3) expinfo.Coord(9,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);


    elseif answerX >= expinfo.Coord(10,1) && answerY >= expinfo.Coord(10,2) && answerX <= expinfo.Coord(10,3)&& answerY <= expinfo.Coord(10,4)
        givenAnswer_mouse = 10;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(10,1) expinfo.Coord(10,2) expinfo.Coord(10,3) expinfo.Coord(10,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(11,1) && answerY >= expinfo.Coord(11,2) && answerX <= expinfo.Coord(11,3)&& answerY <= expinfo.Coord(11,4)
        givenAnswer_mouse = 11;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(11,1) expinfo.Coord(11,2) expinfo.Coord(11,3) expinfo.Coord(11,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);



    elseif answerX >= expinfo.Coord(12,1) && answerY >= expinfo.Coord(12,2) && answerX <= expinfo.Coord(12,3)&& answerY <= expinfo.Coord(12,4)
        givenAnswer_mouse = 12;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(12,1) expinfo.Coord(12,2) expinfo.Coord(12,3) expinfo.Coord(12,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);


    elseif answerX >= expinfo.Coord(13,1) && answerY >= expinfo.Coord(13,2) && answerX <= expinfo.Coord(13,3)&& answerY <= expinfo.Coord(13,4)
        givenAnswer_mouse = 13;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(13,1) expinfo.Coord(13,2) expinfo.Coord(13,3) expinfo.Coord(13,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(14,1) && answerY >= expinfo.Coord(14,2) && answerX <= expinfo.Coord(14,3)&& answerY <= expinfo.Coord(14,4)
        givenAnswer_mouse = 14;


        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(14,1) expinfo.Coord(14,2) expinfo.Coord(14,3) expinfo.Coord(14,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);


    elseif answerX >= expinfo.Coord(15,1) && answerY >= expinfo.Coord(15,2) && answerX <= expinfo.Coord(15,3)&& answerY <= expinfo.Coord(15,4)
        givenAnswer_mouse = 15;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(15,1) expinfo.Coord(15,2) expinfo.Coord(15,3) expinfo.Coord(15,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(16,1) && answerY >= expinfo.Coord(16,2) && answerX <= expinfo.Coord(16,3)&& answerY <= expinfo.Coord(16,4)
        givenAnswer_mouse = 16;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(16,1) expinfo.Coord(16,2) expinfo.Coord(16,3) expinfo.Coord(16,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(17,1) && answerY >= expinfo.Coord(17,2) && answerX <= expinfo.Coord(17,3)&& answerY <= expinfo.Coord(17,4)
        givenAnswer_mouse = 17;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(17,1) expinfo.Coord(17,2) expinfo.Coord(17,3) expinfo.Coord(17,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(18,1) && answerY >= expinfo.Coord(18,2) && answerX <= expinfo.Coord(18,3)&& answerY <= expinfo.Coord(18,4)
        givenAnswer_mouse = 18;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(18,1) expinfo.Coord(18,2) expinfo.Coord(18,3) expinfo.Coord(18,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    elseif answerX >= expinfo.Coord(19,1) && answerY >= expinfo.Coord(19,2) && answerX <= expinfo.Coord(19,3)&& answerY <= expinfo.Coord(19,4)
        givenAnswer_mouse = 19;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(19,1) expinfo.Coord(19,2) expinfo.Coord(19,3) expinfo.Coord(19,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);


    elseif answerX >= expinfo.Coord(20,1) && answerY >= expinfo.Coord(20,2) && answerX <= expinfo.Coord(20,3)&& answerY <= expinfo.Coord(20,4)
        givenAnswer_mouse = 20;

        Screen('FrameRect', expinfo.window ,expinfo.Colors.white, [expinfo.Coord(20,1) expinfo.Coord(20,2) expinfo.Coord(20,3) expinfo.Coord(20,4)],3);
        Screen('Flip',expinfo.window,0,1);
        WaitSecs(2);

    end
    
    %% Track Answer Categories for IIP, IOP, DIP, DIOP and NPL
    
    % Track Correct Answer as ACC and IIP
    if givenAnswer_mouse == Trial(expTrial).GridPositionIIP(Pos)
        ACC = 1;
        IIP = 1;
    else
        ACC = 0;
        IIP = 0;
    end
    
    % IOP
    
    IOP = Trial(expTrial).GridPositionIOP(Pos,:);
    
    if ismember(givenAnswer_mouse,IOP)
        IOP = 1;
    else
        IOP = 0;
    end
    
    % DIP
    
    
    DIP = Trial(expTrial).GridPositionDIP(Pos);
    
    if ismember(givenAnswer_mouse,DIP)
        DIP = 1;
    else
        DIP = 0;
    end
    
    % DIOP
    
    DIOP = Trial(expTrial).GridPositionDIOP(Pos,:);
    
    if ismember(givenAnswer_mouse,DIOP)
        
        DIOP = 1;
    else
        
        DIOP = 0;
    end
    
    % NPL
    
    if  ismember(givenAnswer_mouse,Trial(expTrial).GridPositionNPL)
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
Trial(expTrial).RT(Pos) = RT;
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