 %  -written by Stephan Lewandowsky, Klaus Oberauer, Lee-Xieng Yang,
       %  and Ullrich Ecker. +
 % The WMCBattery is available online at the website of the Cognitive Science
% - Laboratories of the University of Western Australia's School of Psychology:
% http://www.cogsciwa.com ("Software" button on main menu).
% Conditions of Use: Using the WMCBattery is free of charge but the authors 
% request that the associated paper be cited (add details later) 
% when publications arise out of data collection with the WMCBattery. 
% The authors do not guarantee the WMCBattery's functionality. 
% This task requires Matlab version 7.5 (2007b) or higher and the 
% Psychophysics Toolbox version 2.54 or 3.0.8. 

function WMCBattery
% clear all;
global ptb3

try %to catch errors
    
    %select language version of sentence span. Choices are:
    fnDir = [cd '\sharedFuns'];
    addpath(fnDir);
    langlist = findLanguages();
    langPersDatStruct = getLangNData(langlist);
    language = char(strtrim(langPersDatStruct.language));
    langDir = ['LANGUAGES\' language '\'];
    instrDir = [langDir 'Instructions\'];
%    expmessages = [langDir '\ExpMessages.xls']; 
 %    [~,expMessage]=xlsread(expmessages);        % ~ <- dummy+
 
    expmessages = [langDir '\ExpMessages.txt'];
    fid_expM = fopen(expmessages,'rt');
    if (fid_expM < 0)
        error('could not open file');
    end;
    expMessage=readtextfile(expmessages);

    fclose(fid_expM);
    expovermsg = expMessage(8,:);
    
    sex = langPersDatStruct.sex;
    if sex == 'M'
        sex = 1;
    else
        sex = 0;
    end
        
    year = langPersDatStruct.year;
    subject = str2double(langPersDatStruct.subject);

    %determine response keys
    expinfo.yeskey = 'RIGHT';          %e.g., for right arrow: 'right';
    expinfo.evenkey = 'RIGHT';
    expinfo.largerkey = 'RIGHT';
    expinfo.left2rightkey = 'RIGHT';
    expinfo.nokey = 'LEFT';           %e.g., for left arrow: 'left';
    expinfo.oddkey = 'LEFT';
    expinfo.smallerkey = 'LEFT';
    expinfo.right2leftkey = 'LEFT';
    expinfo.nowordkey = 'UP';
    
    yesno{1}=expinfo.yeskey;        % evtl von Gui übernehmen
    yesno{2}=expinfo.nokey; 
    oddeven{1}=expinfo.oddkey;
    oddeven{2}=expinfo.evenkey;
    largersmaller{1}=expinfo.largerkey;
    largersmaller{2}=expinfo.smallerkey;
    
    %::::::::::::::::: add shared function directory to path
    ptb3=-1;
    preserveLW = lastwarn;
    lastwarn('');
    if strmatch ('Name is nonexistent or not a directory',lastwarn)
        fnDir='';
        error('Faulty WMCBattery installation: Directory ''sharedFuns'' not found')
    end
    lastwarn(preserveLW);

     %::::::::::::::::: get subject number, and set up screen
    Screen('Preference', 'SkipSyncTests', 1); %Disable Sync Test
    getptb;
    screenparms = prepexp;

    %initial instructions
    InitInstruct=[instrDir 'InitInstruct.jpg'];
    ima=imread(InitInstruct, 'jpg');
    dImageWait;
    
    if langPersDatStruct.memup == 1
        %display MU instructions and run task
        MUInstruct1=[instrDir 'MUInstruct1.jpg'];
        ima=imread(MUInstruct1, 'jpg');
        dImageWait;
        MUInstruct2=[instrDir 'MUInstruct2.jpg'];
        ima=imread(MUInstruct2, 'jpg');
        dImageWait;
        if regexpi(language,'_')>1
            MUInstruct3=[instrDir 'MUInstruct3.jpg'];
            ima=imread(MUInstruct3, 'jpg');
            dImageWait;
        end
        cd 'MU'
        rc=MU(subject,sex,year,screenparms,expMessage);             % !!
        cd '. .'
       if rc<0, return, end;   
   end
    
    
    if langPersDatStruct.opsp == 1
        %display OS instructions and run task
        cls(screenparms);
        OSInstruct1=[instrDir 'OSInstruct1.jpg'];
        ima=imread(OSInstruct1, 'jpg');
        dImageWait;
        OSInstruct2=[instrDir 'OSInstruct2.jpg'];
        ima=imread(OSInstruct2, 'jpg');
        dImageWait;
        cd 'OS'
        rc=OS(subject,sex,year,screenparms,expMessage,yesno);
        cd '..'
        if rc<0, return, end;
    end
    
    
    if langPersDatStruct.sentsp == 1
        %display SS instructions and run task
        if regexpi(language,'_Easy')>1
            SSeasyInstruct1=[instrDir 'SSeasyInstruct1.jpg'];
            ima=imread(SSeasyInstruct1, 'jpg');
            dImageWait ;
             SSeasyInstruct2=[instrDir 'SSeasyInstruct2.jpg'];
            ima=imread(SSeasyInstruct2, 'jpg');
            dImageWait;
        else
            cls(screenparms);
            SSInstruct1=[instrDir 'SSInstruct1.jpg'];
            ima=imread(SSInstruct1, 'jpg');
            dImageWait;
            SSInstruct2=[instrDir 'SSInstruct2.jpg'];
            ima=imread(SSInstruct2, 'jpg');
            dImageWait;
        end
        cd 'SS'
        rc=SS(subject,sex,year,screenparms,expMessage,yesno,language);
        cd '..'
        if rc<0, return, end;
    end
    
    
    if langPersDatStruct.spatstm == 1
        %display SSTM instructions and run task
        cls(screenparms);
        SSTMInstruct1=[instrDir 'SSTMInstruct1.jpg'];
        ima=imread(SSTMInstruct1, 'jpg');
        dImageWait;
        SSTMInstruct2=[instrDir 'SSTMInstruct2.jpg'];
        ima=imread(SSTMInstruct2, 'jpg');
        dImageWait;
        cd 'SSTM'
        rc=SSTM(subject,sex,year,screenparms, expMessage);
        cd '..'
        if rc<0, return, end;
    end
 
        
    if  langPersDatStruct.taskswc == 1              
        %display TSC instructions and run task
        cls(screenparms);
        cd 'TSC'
        rc=TSC(subject,sex,year,screenparms,expinfo,expMessage,instrDir);
        cd '..'
        if rc<0, return, end;
    end
    
    if langPersDatStruct.tasksw == 1
        %display TS instructions and run task
        cls(screenparms);
        TSInstruct=[instrDir 'TSInstruct.jpg'];
        ima=imread(TSInstruct, 'jpg');
        dImageWait;
        cd 'TS'
        rc=TS(subject,sex,year,screenparms,expinfo,expMessage);
        cd '..'
        if rc<0, return, end;
    end
    
    if langPersDatStruct.wordrec == 1       
        %display WR instructions and run task
        cls(screenparms);
        WRInstruct1=[instrDir 'WRInstruct1.jpg'];
        ima=imread(WRInstruct1, 'jpg');
        dImageWait;
        WRInstruct2=[instrDir 'WRInstruct2.jpg'];
        ima=imread(WRInstruct2, 'jpg');
        dImageWait;
        cd 'WR'
        rc=WR(subject,sex,year,screenparms,expinfo,langDir,expMessage, instrDir);
        cd '..'
        if rc<0, return, end;
    end

    if ptb3
        expinfo.stimulussize = 50;
        expinfo.msgsize = 25;
    else
        expinfo.stimulussize = 80; %(screenparms.rect(RectBottom) - screenparms.rect(RectTop))/8;
        expinfo.msgsize = 40;
    end
    
    waitfkey (screenparms, expinfo, expovermsg);
    
    %::::::::::::::: normal program termination 
    shutDown;


catch errNo
    if strfind(errNo.message,'PsychtoolboxVersion')
        disp('Psychtoolbox not installed. WMCBattery cannot be run');
        return;
    end

    if ptb3>-1, shutDown; end
    if strfind(errNo.message,'User terminated')
        disp(errNo.message);
        return;    %no need for error message if user pressed F12
    end
    if strfind(errNo.message,'does not exist')
        ME = MException('WMC:Installation', 'Faulty WMCBattery installation: Instructions not found');
        throw(ME)
    end
    if strfind(errNo.message,'Cannot CD')
        ME = MException('WMC:Installation', 'Faulty WMCBattery installation: Task folder not found');
        throw(ME)
    end

    rethrow(errNo); %having shut down properly, continue with MatLab error
end

%:::::::::::::: embedded auxiliary functions
    function shutDown
        if ptb3, ListenChar(0); end
        Screen('CloseAll');
        fclose('all');
        rmpath(fnDir);
        while KbCheck; end
        FlushEvents('keyDown');
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
end