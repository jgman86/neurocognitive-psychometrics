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

function rc=WR(subject,sex,year,screenparms,expinfo,langDir,expMessage,instrDir)
global ptb3
% global mfulptr mlessptr

try %catch errors for entire function and all subsidiaries
    rc=[];

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
        expinfo.stimulussize = 50;
        expinfo.msgsize = 25;
    else
        expinfo.stimulussize = 80; %(screenparms.rect(RectBottom) - screenparms.rect(RectTop))/8;
        expinfo.msgsize = 40;
    end
    expinfo.textrow = 20;
    expinfo.minArrayLength = 4;
    expinfo.maxArrayLength = 7;
    expinfo.frameGap = 15;
    expinfo.frameW = (screenparms.w-((expinfo.maxArrayLength+1)*expinfo.frameGap))/expinfo.maxArrayLength;
    expinfo.frameH = (screenparms.h-((5+1)*expinfo.frameGap))/5;
    expinfo.rsi = .5;
    expinfo.ptDuration = 20;  % maximum decision time for arrow key judgement
    expinfo.leftofcenter = 5;
     
    wordsfile    = ['..\' langDir 'wortliste']; 
    nonwordsfile    = ['..\' langDir 'nichtwortliste'];
     
    WaitSecs(0.1); % Hack to pre-load WaitSecs.dll/mex

    datafile =    ['..\Data\WR-' int2str(subject) '-' int2str(sex) '-' int2str(year) '.dat'];
    fid = fopen (datafile,'a');
    if fid<0                             % trap problems before commencing data collection
        error(['Cannot open ' datafile '. WMCBattery installation may be faulty'])
    end
    
    practicemsg = expMessage(2,:);
    beginmsg = expMessage(3,:);
    nexttrialmsg = expMessage(4,:);
    breakmsg = expMessage(5,:);
    expovermsg = expMessage(8,:);
    blockendmsg = expMessage(15,:);
  
% *******************************
% PRACTICE TRIALS
% *******************************
waitfkey (screenparms, expinfo, practicemsg);
for arrayLength = 4:5
    retrievedLetters = char(zeros(1,arrayLength));
    waitfkey (screenparms, expinfo, expMessage(16,:), 1);
    WaitSecs(.5);
    %[~, wordsxls]=xlsread(wordsfile, int2str(arrayLength));
	fid_w = fopen([wordsfile int2str(arrayLength) '.txt'],'rt');
    if (fid_w < 0)
        error('could not open file');
    end;
    % wordstxt = fscanf(fid,'%s\n',[inf,1]);

    wordstxt = readtextfile([wordsfile int2str(arrayLength) '.txt']);

    fclose(fid_w);
    words = char(upper(wordstxt));                         % 
    wordsorder = randperm(length(words));                 % check
    
    %[~, nonwordsxls]=xlsread(nonwordsfile, int2str(arrayLength));
    fid_nw = fopen([nonwordsfile int2str(arrayLength) '.txt'],'rt');
    if (fid_nw < 0)
        error('could not open file');
    end;
    % nonwordstxt = fscanf(fid,'%s\n',[inf,1]);
    nonwordstxt = readtextfile([nonwordsfile int2str(arrayLength) '.txt']);
    fclose(fid_nw);
    nonwords = char(upper(nonwordstxt));                         % 
    nonwordsorder = randperm(length(nonwords));                 % check
    
    waitfkey (screenparms, expinfo, nexttrialmsg);
    for trial = 1:1     % 10
        wordletters = words(wordsorder(trial),:);          % check
        nonwordletters = nonwords(nonwordsorder(trial),:);          % check
        doPracticeWRtrial(screenparms, expinfo, arrayLength, wordletters, nonwordletters, retrievedLetters, instrDir);
        if ptb3
            Screen('FillRect', screenparms.window, [255 255 255]);
            Screen('Flip', screenparms.window);
        else
            % ptb2
            Screen(screenparms.window, 'FillRect', [255 255 255]);
        end
        WaitSecs(expinfo.rsi);
    end
    if ptb3
        Screen('TextColor', screenparms.window, [0 0 0]);
    else
        % ptb2
        Screen(screenparms.window, 'FillRect', [255 255 255]);
    end
end   

    
% *******************************
% PRODUKTIVE TRIALS
% *******************************
waitfkey (screenparms, expinfo, beginmsg);
for arrayLength = expinfo.minArrayLength:expinfo.maxArrayLength
    retrievedLetters = char(zeros(1,arrayLength));
    waitfkey (screenparms, expinfo, expMessage(16,:), 1);
    WaitSecs(.5);

	fid_w = fopen([wordsfile int2str(arrayLength) '.txt'],'rt');
    if (fid_w < 0)
        error('could not open file');
    end;
    wordstxt = readtextfile([wordsfile int2str(arrayLength) '.txt']);
    fclose(fid_w);
    
    words = char(upper(wordstxt));                          
    wordsorder = randperm(length(words));
    

    fid_nw = fopen([nonwordsfile int2str(arrayLength) '.txt'],'rt');
    if (fid_nw < 0)
        error('could not open file');
    end;
    nonwordstxt = readtextfile([nonwordsfile int2str(arrayLength) '.txt']);
    fclose(fid_nw);
    
    nonwords = char(upper(nonwordstxt));                     
    nonwordsorder = randperm(length(nonwords));                 
    waitfkey (screenparms, expinfo, nexttrialmsg);
    
    for trial = 1:10     % 10
        wordletters = words(wordsorder(trial),:);          % check
        nonwordletters = nonwords(nonwordsorder(trial),:);          % check         % check
%       fprintf (fid, '%1d %s: ',arrayLength, wordletters);
        doWRtrial(screenparms, expinfo, arrayLength, wordletters, nonwordletters, retrievedLetters, fid, instrDir);
        fprintf (fid, '\n');
        if ptb3
            Screen('FillRect', screenparms.window, [255 255 255]);
            Screen('Flip', screenparms.window);
        else
            % ptb2
            Screen(screenparms.window, 'FillRect', [255 255 255]);
        end
        WaitSecs(expinfo.rsi);
    end
    if ptb3
        Screen('TextColor', screenparms.window, [0 0 0]);
    else
        % ptb2
        Screen(screenparms.window, 'FillRect', [255 255 255]);
    end
    waitfkey (screenparms, expinfo, blockendmsg);
end

fclose(fid);


  
    
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



    function shutDown
        if ptb3, ListenChar(0); end
        Screen('CloseAll');
        fclose('all');
        rmpath(fnDir);
        while KbCheck; end
        FlushEvents('keyDown');
    end
end