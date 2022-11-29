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

function rc=TSC(subject,sex,year,screenparms,expinfo,expMessage,instrDir)
global ptb3
%global mfulptr mlessptr

try %catch errors for entire function and all subsidiaries

    %::::::::::::::::: add shared function directory to path
    ptb3=-1;
    fnDir = '..\sharedFuns';
    preserveLW = lastwarn;
    lastwarn('');
    addpath(fnDir)
    if strmatch ('Name is nonexistent or not a directory',lastwarn)
        fnDir='';
        error('Faulty WMCBattery installation: Directory ''sharedFuns'' not found')
    end
    lastwarn(preserveLW);

    %::::::::::::::::: get version of ptb, this sets global variable ptb3
    getptb;
    
    seed = 54367;  %use 'seed=54367 + subject;' to change sequence for each subject
    rand ('state', seed + subject * 2);

    if ptb3
        expinfo.stimulussize = 60;
        expinfo.msgsize = 25;
    else
        expinfo.stimulussize = (screenparms.rect(RectBottom) - screenparms.rect(RectTop))/8;
        expinfo.msgsize = 40;
    end
     expinfo.textrow = 20;
     expinfo.leftofcenter = 0;
     expinfo.rsi = .5;
     expinfo.ptDuration = 10;		        %maximum time that equations are visible

    WaitSecs(0.1); % Hack to pre-load WaitSecs.dll/mex

    datafile =    ['..\Data\TSC-' int2str(subject) '-' int2str(sex) '-' int2str(year) '.dat'];
    fid = fopen (datafile,'a');
    if fid<0                             %trap problems before commencing data collection
        error(['Cannot open ' datafile '. WMCBattery installation may be faulty'])
    end
  
    practicemsg = expMessage(2,:);
    beginmsg = expMessage(3,:);
    breakmsg = expMessage(5,:);
    expovermsg = expMessage(8,:);
%     blockstartmsg = [];
%     blockstartmsgSize = 'Grösser 5: rechter Pfeil / kleiner 5: linker Pfeil';
%     blockstartmsgOddEven = 'Gerade Zahl: rechter Pfeil / ungerade Zahl: linker Pfeil';
    blockendmsg = expMessage(15,:);       % german only
    nexttaskmsg = expMessage(6,:);

    
   
    
    
    
    for block = 1:2     % 1:4
        switch block
            case 1
                task = 0;
                TSCInstructLargeSmall=['..\' instrDir 'TSCInstructLargeSmall.jpg'];
                ima=imread(TSCInstructLargeSmall, 'jpg');
                dImageWait;
                %waitfkey (screenparms, expinfo, blockstartmsgSize);
            case 2
                task = 1;
                TSCInstructEvenOdd=['..\' instrDir 'TSCInstructEvenOdd.jpg'];
                ima=imread(TSCInstructEvenOdd, 'jpg');
                dImageWait;                
                %waitfkey (screenparms, expinfo, blockstartmsgOddEven);
        end
        
        waitfkey (screenparms, expinfo, practicemsg);
        for trial = 1:10 % Practice Trials
            doPracticeTSCtrial(screenparms, expinfo, task);
            if ptb3
                Screen('FillRect', screenparms.window, [255 255 255]);
                Screen('Flip', screenparms.window);
            else
                Screen(screenparms.window, 'FillRect', [255 255 255]);
            end
            WaitSecs(expinfo.rsi);
        end
        if ptb3
            Screen('TextColor', screenparms.window, [0 0 0]);
        else
            Screen(screenparms.window, 'FillRect', [255 255 255]);
        end
        
        
        waitfkey (screenparms, expinfo, beginmsg);
        for trial = 1:100 % Productive Trials
            doTSCtrial(fid, screenparms, expinfo, task);
            if ptb3
                Screen('FillRect', screenparms.window, [255 255 255]);
                Screen('Flip', screenparms.window);
            else
                Screen(screenparms.window, 'FillRect', [255 255 255]);
            end
            WaitSecs(expinfo.rsi);
            % %             waitfkey (screenparms, expinfo, breakmsg);
        end
        if ptb3
            Screen('TextColor', screenparms.window, [0 0 0]);
        else
            Screen(screenparms.window, 'FillRect', [255 255 255]);
        end
        waitfkey (screenparms, expinfo, blockendmsg);
    end
       
    fclose(fid);
    
    
    %essential: Close it all down properly!
    waitfkey (screenparms, expinfo, nexttaskmsg);
    if nargin<2, shutDown; end
    rc=0;


    %:::::::::::::::::::: any error anywhere at any time...
catch errNo
    if strfind(errNo.message,'PsychtoolboxVersion')
        disp('Psychtoolbox not installed. WMCBattery cannot be run');
        return;
    end

    if ptb3>-1, shutDown; end
    rc=-1;
    if strfind(errNo.message,'User terminated')
        disp(errNo.message);
        return;    %no need for error message if user pressed F12
    end
    rethrow(errNo); %having shut down properly, continue with MatLab error
end

    function dImageWait
        if ptb3
            Screen('PutImage', screenparms.window, ima);
            Screen('Flip', screenparms.window);          
        else
            Screen(screenparms.window, 'PutImage', ima); % put image on screen
        end
        while KbCheck; end      %clear keyboard queue
        KbWait;                 %wait for any key
        cls(screenparms);
    end


    function shutDown
        if ptb3, ListenChar(0); end
        Screen('CloseAll');
        fclose('all');
        rmpath(fnDir);
        while KbCheck; end
        FlushEvents('keyDown');
    end
end