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

function [resps, rts, senresps, sentrts] = doTStrial(fid, screenparms, expinfo)
global ptb3

digits = [1:4, 6:9];
randomdigits = digits(randperm(8));
nextdigit = randomdigits(1);

task = round(rand(1));
if task
    colour = [255 0 0];
else
    colour = [0 0 255];
end

if ptb3
    Screen('TextSize', screenparms.window, expinfo.stimulussize);
    Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
    DrawFormattedText(screenparms.window, int2str(nextdigit) , 'center', 'center', colour);
    Screen('Flip', screenparms.window);
else
    expinfo.stimulussize=expinfo.stimulussize;
    centertext_colour (screenparms, expinfo, int2str(nextdigit), colour);
end



% % if ptb3;
% %     Screen('TextSize', screenparms.window, expinfo.stimulussize)
% %     Screen('DrawText',screenparms.window, int2str(nextdigit), screenparms.w/2, screenparms.h/2, colour);
% %     Screen('Flip', screenparms.window);
% % else
% %     Screen(screenparms.window,'DrawText', nextdigit, colour);
% % end




[cx, t] = noblinkgetresponse(screenparms,expinfo);

if task                     % odd even
    if mod(nextdigit,2)     % ungerade zahl 
        if strcmp(cx,expinfo.oddkey)
            resp = 1;
        else
            resp = 0;
        end
    else                    % gerade zahl
        if strcmp(cx,expinfo.evenkey)
            resp = 1;
        else
            resp = 0;
        end 
    end
else                        % smaller larger than 5
    if nextdigit < 5        % smaller
        if strcmp(cx,expinfo.smallerkey)
            resp = 1;
        else
            resp = 0;
        end
    else                    % larger
        if strcmp(cx,expinfo.largerkey)
            resp = 1;
        else
            resp = 0;
        end 
    end
end


 fprintf (fid, '%3d %3i %s %3d %3d  ', task, nextdigit, cx, resp, t);
 fprintf(fid, '\n');
 
 


cls(screenparms);

