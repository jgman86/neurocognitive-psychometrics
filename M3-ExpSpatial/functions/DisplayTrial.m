% This fun ction displays one trial of a Simon Task

function Trial = DisplayTrial(expinfo, Trial, expTrial, isPractice)

%% Start Trial Procedure and display all created trials in a loop!
 WaitSecs(2);

%% Initialize Images and Positions

% Show Fixation Cross %%

Trial(expTrial).time_fixation = TextCenteredOnPos(expinfo.window,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.white);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation,expinfo.FixTime);



%% next_flip muss immer noch übergeben werden. Funktion schreiben, für due cues...

for Pos_MemSet = 1:expinfo.SetSize

    if Trial(expTrial).CueCondition == "pre"

        % Clear Screen for ISI

        Trial(expTrial).Fix_Cue = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix_Cue,expinfo.CueInt);

        [expinfo, next_flip] =  ScreenCues(Trial,expinfo,expTrial,Pos_MemSet,next_flip);

        % Cue-Array Interval
        Trial(expTrial).CueMemInt = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).CueMemInt,expinfo.CueMemInt);
 
        [expinfo, next_flip] = Screen_MemArray(expinfo, Pos_MemSet,Trial,expTrial, next_flip);

        % Here now get response mouse for secondary task - which color is
        % brighter

        % Now screen an new fixation cross in addition to the grid for a
        % given time to gain time for eeg measurement
  
        % Screen Mask after MemArray
        [expinfo, next_flip] =  ScreenMask(Trial,expinfo,expTrial, next_flip);

        % Freetime fix for Pre Trials
        Trial(expTrial).FT = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FT,expinfo.FreeTime);

    else % post-cue trials
           
       % Clear Screen for ISI
        
        Trial(expTrial).Fix_Cue = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix_Cue,expinfo.CueInt);

        [expinfo, next_flip] = Screen_MemArray(expinfo, Pos_MemSet,Trial,expTrial,next_flip);

        % Here now get response mouse for secondary task - which color is
        % brighter

        % Now screen an new fixation cross in addition to the grid for a
        % given time to gain time for eeg measurement
  
        % Cue-Array Interval
        Trial(expTrial).CueMemInt = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).CueMemInt,expinfo.CueMemInt);

        [expinfo, next_flip] =  ScreenCues(Trial,expinfo,expTrial,Pos_MemSet,next_flip);

        % Screen Mask after MemArray
        [expinfo, next_flip] =  ScreenMask(Trial,expinfo,expTrial, next_flip);

        % Freetime fix for Pre Trials
        Trial(expTrial).FT = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
        next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FT,Trial(expTrial).FreeTime);


    end
end


%% Show Retrieval Cue
% display Cue

Trial(expTrial).RetCue = TextCenteredOnPos(expinfo.window,'?',expinfo.centerX,expinfo.centerY,expinfo.Colors.white,next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetCue,expinfo.FixTime);

Trial(expTrial).RetCue_Fix = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetCue_Fix,expinfo.CueInt);

Trial(expTrial).FixGrid = TextCenteredOnPos(expinfo.window,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.white,next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FixGrid,expinfo.FixTime);

Trial(expTrial).Fix2Grid = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix2Grid,0);

%% Show Retrieval Grid

for Pos = 1:expinfo.SetSize

    [expinfo, next_flip] = ScreenGrid(expinfo, Trial, expTrial, next_flip);

    [Trial, givenAnswer_mouse, response_mouse] = getresponseMouse(expinfo, Trial, expTrial, Pos);
  

    if isPractice == 1 % Show feedback in practice trials
        if Trial(expTrial).ACC(Pos) == 1
            TextCenteredOnPos(expinfo.window,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
        else
            TextCenteredOnPos(expinfo.window,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
        end
        WaitSecs(expinfo.FeedbackDuration);
    end

    if Pos == expinfo.SetSize

        clearScreen(expinfo.window,expinfo.Colors.bgColor);
        TextCenteredOnPos(expinfo.window,'Weiter mit beliebiger Taste',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.white);
        KbWait();

    end


    Trial(expTrial).ITI = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);



end


%% Recording Data for each trial for the subject

%% Assign different files for practice and experimental trials and cue block
if isPractice == 1 && expinfo.Cond == 0
    
        fid = fopen(expinfo.pracFile_pre, 'a');
    
    elseif isPractice == 0 && expinfo.Cond == 0
        fid = fopen(expinfo.expFile_pre, 'a');

    elseif isPractice == 1 && expinfo.Cond == 1
        fid = fopen(expinfo.pracFile_post, 'a');
    
    elseif isPractice == 0 && expinfo.Cond == 1
        fid = fopen(expinfo.expFile_post, 'a');

    
end

%% Print general information into data file for each subject
fprintf(fid, '%d ',expinfo.subject);
fprintf(fid, '%d ',Trial(expTrial).TrialNum);


%% Print experimental conditions
fprintf(fid, '%d ',expinfo.SetSize);
fprintf(fid, '%s ',Trial(expTrial).CueCondition);


if expinfo.Cond == 1
  
    fprintf(fid, '%d ',Trial(expTrial).FreeTime);

end 

% for i = 1 :expinfo.SetSize
%  
%   fprintf(fid, '%s ',Trial(expTrial).CueOrientation(i)); 
%     
% end
% 


%% Print Response for every Position information into data file

for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).ACC(i));
end


for i = 1:expinfo.SetSize

    fprintf(fid, '%1.4f ',Trial(expTrial).RT(i));
end


for i=1:expinfo.SetSize
    
fprintf(fid, '%d ', Trial(expTrial).ChosenIIP(i));
fprintf(fid, '%d ', Trial(expTrial).ChosenIOP(i));
fprintf(fid, '%d ', Trial(expTrial).ChosenDIP(i)); 
fprintf(fid, '%d ', Trial(expTrial).ChosenDIOP(i)); 
fprintf(fid, '%d ', Trial(expTrial).ChosenNPLs(i));
    
end 

% Overall Accuracy
fprintf(fid, '%d ', Trial(expTrial).SumACC);

% Print Multinomial Data
fprintf(fid, '%d ',Trial(expTrial).SumIIP);
fprintf(fid, '%d ',Trial(expTrial).SumIOP);
fprintf(fid, '%d ',Trial(expTrial).SumDIP);
fprintf(fid, '%d ',Trial(expTrial).SumDIOP);
fprintf(fid, '%d ',Trial(expTrial).SumNPLs);
fprintf(fid, '%d ',Trial(expTrial).Misses);

%% Print new Line after each Trial
fprintf(fid, '\n');

% Close the text file
fclose (fid);

% Flip again after ITI is over
Trial(expTrial).ITI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);

end

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uzh.ch