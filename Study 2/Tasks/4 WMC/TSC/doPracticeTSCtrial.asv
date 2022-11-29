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

function [resps, rts, senresps, sentrts] = doPracticeTSCtrial(screenparms, expinfo, task)
global ptb3

digits = [1:4, 6:9];
randomdigits = digits(randperm(8));
nextdigit = randomdigits(1);  

if ptb3
    Screen('TextSize', screenparms.window, expinfo.stimulussize);
    Screen('TextFont', screenparms.window, screenparms.sansSerifFont);
    DrawFormattedText(screenparms.window, int2str(nextdigit) , 'center', 'center', [0 0 0]);
    Screen('Flip', screenparms.window);
else
    expinfo.stimulussize=expinfo.stimulussize;
    centertext_colour (screenparms, expinfo, int2str(nextdigit), [0 0 0]);
end

noblinkgetresponse(screenparms,expinfo);



 
cls(screenparms);

