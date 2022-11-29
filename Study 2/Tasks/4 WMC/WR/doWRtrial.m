% This program forms part of the Working Memory Capacity Battery, 
% written by Stephan Lewandowsky, Klaus Oberauer, Lee-Xieng Yang, and Ullrich Ecker. 
% The WMCBattery is available online at the website of the Cognitive Science
% Laboratories of the University of Western Australia's School of Psychology:
% http://www.cogsciwa.com ("Software" button on main menu).
% Conditions of Use: Using the WMCBattery is free of charge but the authors 
% request that the associated paper be cited (add details later) 
% when publications arise out of data collection with the WMCBattery. 
% The authors do not guarantee the WMCBattery's functionality. 
% This task requires Matlab version 7.5 (2007b) or higher and the 
% Psychophysics Toolbox version 2.54 or 3.0.8. 

%this function performs a complete ops-span trial and returns
%responses.

function doWRtrial(screenparms, expinfo, arrayLength, wordletters, nonwordletters, retrievedLetters, fid, instrDir)
global ptb3

gap = expinfo.frameGap;
frameborder = 2;
wordletters = char(wordletters);
nonwordletters = char(nonwordletters);

switch arrayLength
    case 4
        startposition = 2;
        endposition = 5;
    case 5
        startposition = 2;
        endposition = 6;
    case 6
        startposition = 1;
        endposition = 6;
    case 7
        startposition = 1;
        endposition = 7;
    otherwise
end

    
condperm = randperm(3);
condition = condperm(1);
% condition = 1;
if condition == 1
    letterseq = 1:arrayLength;
    displayletters = wordletters(letterseq);
elseif condition == 2
    A = 1:arrayLength;
    letterseq = sort(A,'descend');
    displayletters = wordletters(letterseq);
else
    letterseq = 1:arrayLength;
    displayletters = nonwordletters(letterseq);
end


for positionseq = randperm(arrayLength);       
    WaitSecs(.1); 
    for position = startposition+positionseq-1
        for pos = startposition:endposition
            Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
                3*gap+2*expinfo.frameH, ...
                pos*gap+(pos)*expinfo.frameW, ...
                3*gap+3*expinfo.frameH];
            if ptb3
                Screen('FrameRect', screenparms.window, [0 0 0], Frame_rect, frameborder);
            else
                Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
            end
        end
    end


    if ptb3
        Screen('TextSize', screenparms.window, expinfo.stimulussize);
        Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
        DrawFormattedText(screenparms.window, displayletters(positionseq), ...
            ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
            screenparms.h/2, ...
            [0 0 0]);       %wordletters(letterseq(position))
        Screen('Flip', screenparms.window);
    else
        % ptb2
        Screen(screenparms.window, 'FillRect', [255 255 255]);
        for pos = startposition:endposition
            Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
                3*gap+2*expinfo.frameH, ...
                pos*gap+(pos)*expinfo.frameW, ...
                3*gap+3*expinfo.frameH];
            Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
        end
        % expinfo.stimulussize=expinfo.stimulussize;
        Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);
        Screen(screenparms.window, 'TextSize', expinfo.stimulussize);   %%
        Screen(screenparms.window,'DrawText',displayletters(positionseq), ...
             ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
             screenparms.h/2, screenparms.black);
    end
    WaitSecs(.9);
end

if ptb3
    Screen('FillRect', screenparms.window, [255 255 255]);
    Screen('Flip', screenparms.window);
else
    % ptb2
    Screen(screenparms.window, 'FillRect', [255 255 255]);
end
WaitSecs(.1);



for pos = 1:arrayLength
    fprintf (fid, '%c', displayletters(pos));
end
fprintf (fid, '%s ', '');
fprintf (fid, '%1d ', condition); 

% *****
        cd '..'
        WRShortInstruct=[instrDir, 'WRShortInstruction.jpg'];
        ima=imread(WRShortInstruct, 'jpg');
        if ptb3
            Screen('PutImage', screenparms.window, ima);
            Screen('Flip', screenparms.window);          
        else
            Screen(screenparms.window, 'PutImage', ima); % put image on screen
        end
        cd 'WR'

[cx, t] = threeOptsGetresponse(screenparms,expinfo);
cls(screenparms);   %%%%%
if condition == 1
    if strcmp(cx,expinfo.left2rightkey)
        keypress = 1;
    else
        keypress = 0;
    end
elseif condition == 2
    if strcmp(cx,expinfo.right2leftkey)
        keypress = 1;
    else
        keypress = 0;
    end
else
    if strcmp(cx,expinfo.nowordkey)
        keypress = 1;
    else
        keypress = 0;
    end
end
fprintf (fid, '%1d %3d ', keypress, t);

for position = startposition:endposition       
    for pos = startposition:endposition
        Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
            3*gap+2*expinfo.frameH, ...
            pos*gap+(pos)*expinfo.frameW, ...
            3*gap+3*expinfo.frameH];
        if ptb3
            Screen('FrameRect', screenparms.window, [0 0 0], Frame_rect, frameborder);
        else
            %ptb2
            Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
        end
    end
    if ptb3
        Screen('TextSize', screenparms.window, expinfo.stimulussize);
        Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
        DrawFormattedText(screenparms.window, '?', ...
            ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
            screenparms.h/2, ...
            [0 0 0]);       
        Screen('Flip', screenparms.window);
    else
        % ptb2
        Screen(screenparms.window, 'FillRect', [255 255 255]);
        for pos = startposition:endposition
            Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
                3*gap+2*expinfo.frameH, ...
                pos*gap+(pos)*expinfo.frameW, ...
                3*gap+3*expinfo.frameH];
            Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
        end
       % expinfo.stimulussize=expinfo.stimulussize;
        Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);
        Screen(screenparms.window, 'TextSize', expinfo.stimulussize);   %%
        Screen(screenparms.window,'DrawText','?', ...
            ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
            screenparms.h/2, screenparms.black);
    end
    
    [cx, t] = getletters(screenparms);
    retrievedLetters(pos) = cx;     
    for pos = startposition:endposition
        Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
            3*gap+2*expinfo.frameH, ...
            pos*gap+(pos)*expinfo.frameW, ...
            3*gap+3*expinfo.frameH];
        if ptb3
            Screen('FrameRect', screenparms.window, [0 0 0], Frame_rect, frameborder);
        else
            %ptb2
            Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
        end        
    end
    if ptb3
        Screen('TextSize', screenparms.window, expinfo.stimulussize);
        Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
        DrawFormattedText(screenparms.window, cx, ...
            ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
            screenparms.h/2, ...
            [0 0 0]);       %wordletters(letterseq(position))
        Screen('Flip', screenparms.window);
    else
        % ptb2
        Screen(screenparms.window, 'FillRect', [255 255 255]);
        for pos = startposition:endposition
            Frame_rect = [pos*gap+(pos-1)*expinfo.frameW, ...
                3*gap+2*expinfo.frameH, ...
                pos*gap+(pos)*expinfo.frameW, ...
                3*gap+3*expinfo.frameH];
            Screen(screenparms.window, 'FrameRect', [0 0 0], Frame_rect, frameborder);
        end
       % expinfo.stimulussize=expinfo.stimulussize;
        Screen(screenparms.window,'TextFont',screenparms.sansSerifFont);
        Screen(screenparms.window, 'TextSize', expinfo.stimulussize);   %%
        Screen(screenparms.window,'DrawText',cx, ...
            ((position)*gap)-gap+((position-.5)*expinfo.frameW), ...
            screenparms.h/2, screenparms.black);
    end
    WaitSecs(.2);
    fprintf (fid, '%c', cx);
    
end

cls(screenparms);

