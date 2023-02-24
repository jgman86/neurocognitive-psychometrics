% This function displays one trial of a Simon Task

function Trial = DisplayTrial(expinfo, Trial, expTrial, isPractice)

%% Start Trial Procedure and display all created trials in a loop!
WaitSecs(2);
%% Initialize Images and Positions

% Show Fixation Cross %%

Trial(expTrial).time_fixation = TextCenteredOnPos(expinfo.window,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation,expinfo.Fixtime);


% Clear Screen for ISI

Trial(expTrial).Fix_Cue = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix_Cue,expinfo.Fix_Cue);

%% next_flip muss immer noch übergeben werden. Funktion schreiben, für due cues...

for Pos_MemSet = 1:expinfo.SetSize*2

    %     Trial(expTrial).Fix_Cue = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
    %     next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix_Cue,expinfo.Fix_Cue);
    %

    %% Show Mem Stims

    if Trial(expTrial).StimOrder(Pos_MemSet) == 1

        if (strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'left'))

            Screen('DrawText',expinfo.window,Trial(expTrial).Stims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor);
            Screen('DrawText',expinfo.window,Trial(expTrial).ScrambledStims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor);

            Trial(expTrial).Stim_Time = Screen('Flip', expinfo.window, next_flip,1);

            Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);

            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,Pos_MemSet,next_flip);


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo.window,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo.window,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo.window,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo.window,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
            end




            Trial(expTrial).FreeTime= clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime,expinfo.FT);


        elseif (strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'right'))


            Screen('DrawText',expinfo.window,Trial(expTrial).Stims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor);
            Screen('DrawText',expinfo.window,Trial(expTrial).ScrambledStims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor);

            Trial(expTrial).Stim_Time = Screen('Flip', expinfo.window, next_flip,1);

            Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);

            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,Pos_MemSet,next_flip);


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo.window,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo.window,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo.window,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo.window,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
            end



            Trial(expTrial).FreeTime= clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime,expinfo.FT);

        end

    else

        if (strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'left'))


            Screen('DrawText',expinfo.window,Trial(expTrial).Stims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor);
            Screen('DrawText',expinfo.window,Trial(expTrial).ScrambledStims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor);

            Trial(expTrial).Stim_Time = Screen('Flip', expinfo.window, next_flip,1);

            Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);

            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,Pos_MemSet,next_flip);


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo.window,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo.window,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo.window,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo.window,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
            end


            Trial(expTrial).FreeTime= clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime,expinfo.FT);

        elseif (strcmp(Trial(expTrial).LateralityStims{Pos_MemSet},'right'))


            Screen('DrawText',expinfo.window,Trial(expTrial).Stims{Pos_MemSet},expinfo.maxX*0.75,expinfo.maxY*0.5,expinfo.Colors.stimColor);
            Screen('DrawText',expinfo.window,Trial(expTrial).ScrambledStims{Pos_MemSet},expinfo.maxX*0.25,expinfo.maxY*0.5,expinfo.Colors.stimColor);

            Trial(expTrial).Stim_Time = Screen('Flip', expinfo.window, next_flip,1);

            Trial = getresponse(expinfo, Trial,expTrial,Pos_MemSet);

            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,Pos_MemSet,next_flip);


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo.window,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo.window,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo.window,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo.window,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
            end


            Trial(expTrial).FreeTime= clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime,expinfo.FT);


        end
    end


    Trial(expTrial).RetStart = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetStart,expinfo.cue_word);



end


%% Show Retrieval Cue
% display Cue

Trial(expTrial).RetCue = TextCenteredOnPos(expinfo.window,'?',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetCue,expinfo.Fixtime);

Trial(expTrial).Fix_Cue = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Fix_Cue,expinfo.cue_time);

%% Show Retrieval Grid

for Pos = 1:expinfo.SetSize

    [expinfo, next_flip] = ScreenGrid(expinfo, Trial, expTrial, next_flip);
    [Trial, givenAnswer_mouse, response_mouse] = getresponseMouse(expinfo, Trial, expTrial, Pos);
    RespFeedback(expinfo, givenAnswer_mouse,response_mouse);

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
        TextCenteredOnPos(expinfo.window,'Weiter mit Beliebiger Taste',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green);
        KbWait();

    end


    Trial(expTrial).ITI = clearScreen(expinfo.window,expinfo.Colors.bgColor, next_flip);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);



end


%% Recording Data for each trial for the subject

%% Assign different files for practice and experimental trials
if isPractice == 1
    fid = fopen(expinfo.pracFile, 'a');
else
    fid = fopen(expinfo.expFile, 'a');
end

%% Print general information into data file for each subject
fprintf(fid, '%d ',expinfo.subject);
fprintf(fid, '%d ',Trial(expTrial).TrialNum);

%% Print experimental conditions
fprintf(fid, '%d ',expinfo.SetSize);

%% Print presentation properties of the stimulus

% for i = 1:expinfo.SetSize*2
%     fprintf(fid, '%d ', Trial(expTrial).CorrRespPos_helper(i));
%     fprintf(fid, '%s ', Trial(expTrial).CorrRespSize(i));
% end

%% Print Response for every Position information into data file

fprintf(fid, '%d ',Trial(expTrial).n_DIP_total);

for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).n_DIP_MemSetPos(i));
end


for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).ACC(i));
end

for i = 1:expinfo.SetSize

    fprintf(fid, '%1.4f ',Trial(expTrial).RTGrid(i));
end


fprintf(fid, '%d ', Trial(expTrial).SumACC);


for i = 1:expinfo.SetSize*2
    % Print Responses to Secondary Task
    fprintf(fid, '%d ',Trial(expTrial).ACC_SecTask(i));
end

for i = 1:expinfo.SetSize*2

    fprintf(fid, '%1.4f ',Trial(expTrial).RT_SecTask(i));
end

fprintf(fid, '%d ', Trial(expTrial).SumACCSecTask);

% Choice for every Postion

% for i=1:expinfo.SetSize
% 
%     fprintf(fid, '%d ' ,Trial(expTrial).ChosenIIP(i));
% 
% end
% 
% for i=1:expinfo.SetSize
% 
% 
%     fprintf(fid, '%d ' ,Trial(expTrial).ChosenIOP(i));
% 
% 
% end
% 
% for i=1:expinfo.SetSize
% 
% 
%     fprintf(fid, '%d ' ,Trial(expTrial).ChosenDIP(i));
% 
% 
% end
% 
% for i=1:expinfo.SetSize
% 
% 
%     fprintf(fid, '%d ' ,Trial(expTrial).ChosenDIOP(i));
% 
% end
% 
% 
% for i=1:expinfo.SetSize
% 
% 
%     fprintf(fid, '%d ' ,Trial(expTrial).ChosenNPLs(i));
% 
% end

% Print Multinomial Data
% Sum for on Trial
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


% 
% if isPractice == 1
%     SaveTable = Trial;
%     Data = struct2table(SaveTable,'AsArray',true);
%     writetable(Data,[expinfo.DataFolder,expinfo.TaskName,'_PracTrials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),'.csv']);
% 
% else
% 
%     SaveTable = Trial;
%     Data = struct2table(SaveTable,'AsArray',true);
%     writetable(Data,[expinfo.DataFolder,expinfo.TaskName,'_ExpTrials_S',num2str(expinfo.subject),'_Ses',num2str(expinfo.session),'.csv']);
% 
% end



% Flip again after ITI is over
Trial(expTrial).ITI = clearScreen(expinfo.window,expinfo.Colors.bgColor,next_flip);
getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);

end

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uzh.ch