function Trial = DisplayTrial(expinfo, Trial, expTrial, isPractice)

%% Start Trial Procedure and display all created trials in a loop!
WaitSecs(1);

%% Loop through Stims and Cues in Trials

for Pos_MemSet = 1:expinfo.SetSize*2

    if Trial(expTrial).CueCondition == "pre"

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(Pos_MemSet)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross %%
            Trial(expTrial).time_fixation(Pos_MemSet) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(Pos_MemSet),expinfo.Fixtime);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] =  ScreenCue(expinfo, Trial, expTrial,Pos_MemSet,next_flip);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval with Fixation cross
            Trial(expTrial).Cue_Word_Fix(Pos_MemSet) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.Cue_Word_Fix);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word_Fix(Pos_MemSet),expinfo.Cue_Word);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

 
            % Show Stim according to Stim Class

            if Trial(expTrial).StimOrder(Pos_MemSet) == 1

                % Screen Mem Stims
                Trial(expTrial).StimTime(Pos_MemSet) = TextCenteredOnPos(expinfo,Trial(expTrial).MemStims{Pos_MemSet},expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.MemStim);
                next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).StimTime(Pos_MemSet),expinfo.EncTime); % test if necessary
                WaitSecs(0.05);
                io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            else

                % Screen Dist Stims
                Trial(expTrial).StimTime(Pos_MemSet) = TextCenteredOnPos(expinfo,Trial(expTrial).LureStims{Pos_MemSet},expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.DistStim);
                next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).StimTime(Pos_MemSet),expinfo.EncTime); % test if necessary
                WaitSecs(0.05);
                io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            end
       
            [Trial, next_flip] = getresponse(expinfo, Trial,expTrial,Pos_MemSet, next_flip);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Feedback, if PracticeTrial
            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end

                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[]);

            end

            % Freetime Condtion for Pre Cue is fixed
%             Trial(expTrial).FreeTime(Pos_MemSet) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip,expinfo.Marker.FT_Start);
%             next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime(Pos_MemSet),Trial(expTrial).FT);
%             WaitSecs(0.05);
%             io64(expinfo.ioObj, expinfo.PortAddress, 0); %
             clearScreen(expinfo,expinfo.Colors.bgColor,[]);
             WaitSecs(Trial(expTrial).FT);
    else 
        
            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(Pos_MemSet)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross %%
            Trial(expTrial).time_fixation(Pos_MemSet) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(Pos_MemSet),expinfo.Fixtime);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

          
            % Show Stim according to Stim Class

            if Trial(expTrial).StimOrder(Pos_MemSet) == 1

                % Screen Mem Stims
                Trial(expTrial).StimTime(Pos_MemSet) = TextCenteredOnPos(expinfo,Trial(expTrial).MemStims{Pos_MemSet},expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.MemStim);
                next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).StimTime(Pos_MemSet),expinfo.EncTime);
                WaitSecs(0.05);
                io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            else

                % Screen Dist Stims
                Trial(expTrial).StimTime(Pos_MemSet) = TextCenteredOnPos(expinfo,Trial(expTrial).LureStims{Pos_MemSet},expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.MemStim);
                next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).StimTime(Pos_MemSet),expinfo.EncTime);
                WaitSecs(0.05);
                io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            end

            [Trial, next_flip] = getresponse(expinfo, Trial,expTrial,Pos_MemSet, next_flip);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
    

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(Pos_MemSet) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(Pos_MemSet) == 0 && strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(Pos_MemSet),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end

                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[]);

            end

            % Word Cue Interval with Fixation cross
            Trial(expTrial).Word_Fix_Cue(Pos_MemSet) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.Cue_Word_Fix);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Word_Fix_Cue(Pos_MemSet),expinfo.Cue_Word);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Screen Cue
            [expinfo, next_flip] = ScreenCue(expinfo, Trial, expTrial,Pos_MemSet,next_flip);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
        
            % Freetime Condtion for Post Cue Condition
%             Trial(expTrial).FreeTime(Pos_MemSet) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip,expinfo.Marker.FT_Start); 
%             next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).FreeTime(Pos_MemSet),Trial(expTrial).FT);
%             WaitSecs(0.05);
%             io64(expinfo.ioObj, expinfo.PortAddress, 0); %
             clearScreen(expinfo,expinfo.Colors.bgColor,[]);
             WaitSecs(Trial(expTrial).FT);
            % Marker according to FT Condition Ending
    end
end

%% Show Retrieval Cue
% display Cue

% Neccesary?
% Trial(expTrial).RetStart_ISI = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
% next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetStart_ISI,expinfo.ISI); 

Trial(expTrial).RetCue = TextCenteredOnPos(expinfo,'?',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,next_flip,expinfo.Marker.RetCue);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetCue,expinfo.Fixtime);
WaitSecs(0.05);
io64(expinfo.ioObj, expinfo.PortAddress, 0); %

Trial(expTrial).Cue_Ret_Int = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Ret_Int,expinfo.cue_time);


%% Show Retrieval Grid

for Pos = 1:expinfo.SetSize

    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.RetStart); %
    WaitSecs(0.05);
    io64(expinfo.ioObj, expinfo.PortAddress, 0);


    % Write Marker for Serial Position
    io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(Pos)); %
    WaitSecs(0.05);
    io64(expinfo.ioObj, expinfo.PortAddress, 0); %


    [expinfo, next_flip] = ScreenGrid(expinfo, Trial, expTrial, next_flip);
    [Trial, givenAnswer_mouse, response_mouse] = getresponseMouse(expinfo, Trial, expTrial, Pos);
    WaitSecs(0.05);
    io64(expinfo.ioObj, expinfo.PortAddress, 0); %


    if isPractice == 1 % Show feedback in practice trials
        if Trial(expTrial).ACC(Pos) == 1
            TextCenteredOnPos(expinfo,'RICHTIG',expinfo.centerX,expinfo.centerY,expinfo.Colors.green,next_flip);
        else
            TextCenteredOnPos(expinfo,'FALSCH',expinfo.centerX,expinfo.centerY,expinfo.Colors.red,next_flip);
        end
        WaitSecs(expinfo.FeedbackDuration);
    end

    if Pos == expinfo.SetSize

        clearScreen(expinfo,expinfo.Colors.bgColor);
        TextCenteredOnPos(expinfo,'Weiter mit Beliebiger Taste',expinfo.centerX,expinfo.centerY,expinfo.Colors.green);
        KbWait();

    end

   clearScreen(expinfo,expinfo.Colors.bgColor);

end

%% Recording Data for each trial for the subject

% Assign different files for practice and experimental trials
if isPractice == 1
    fid = fopen(expinfo.pracFile, 'a');
else
    fid = fopen(expinfo.expFile, 'a');
end

%% Print general information into data file for each subject
fprintf(fid, '%d ',expinfo.subject);
fprintf(fid, '%d ',Trial(expTrial).TrialNum);
fprintf(fid, '%s ',Trial(expTrial).CueCondition);

%% Print experimental conditions
fprintf(fid, '%d ',expinfo.SetSize);
fprintf(fid, '%d ',Trial(expTrial).FT);

%% Print Response for every Position information into data file

% Total Number of Distractors in Position
fprintf(fid, '%d ',Trial(expTrial).n_DIP_total);

% Numer of Distractors for every Serial Position
for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).n_DIP_MemSetPos(i));
end

% Recall Accuracy for every Memory Item
for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).ACC(i));
end

% Recall Reaction Time for every Position
for i = 1:expinfo.SetSize

    fprintf(fid, '%1.4f ',Trial(expTrial).RT(i));
end

% Trial Accuracy for alle Recalls
fprintf(fid, '%d ', Trial(expTrial).SumACC);

% Accuracy for Secondary Task
for i = 1:expinfo.SetSize*2  

    % Print Responses to Secondary Task
    fprintf(fid, '%d ',Trial(expTrial).ACC_SecTask(i));
end

% Reaction Times for Secondary Tasks
for i = 1:expinfo.SetSize*2

    fprintf(fid, '%1.4f ',Trial(expTrial).RT_SecTask(i));
end

fprintf(fid, '%d ', Trial(expTrial).SumACCSecTask);


% Summed Category Frequencies

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
Trial(expTrial).ITI = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip,expinfo.Marker.ITI_Start);
getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);
WaitSecs(0.05);
io64(expinfo.ioObj, expinfo.PortAddress, 0); %

end

