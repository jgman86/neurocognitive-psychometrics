function Trial = DisplayTrial(expinfo, Trial, expTrial, isPractice)

%% Start Trial Procedure and display all created trials in a loop!
WaitSecs(1);

%% Set Count Variables
n_cues = 1;
left_right = 1;
%% Loop through Stims and Cues in Trials

for Pos_MemSet = 1:expinfo.SetSize

    % Show Mem Stims

    if Trial(expTrial).CorrRespPos(Pos_MemSet) == 1

        if (strcmp(Trial(expTrial).LateralityStims{left_right},'left')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'left'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross %%
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end

                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);

            end

            n_cues = n_cues + 1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            %Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims  
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); 


            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start)
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start)
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues + 1;


        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'right')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'right'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
        
            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims         
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


           if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end

            n_cues = n_cues + 1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
            
            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); 

          if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
          end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;


        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'left')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'right'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


           if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues + 1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);
            
            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

             if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;


        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'right')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'left'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cues    
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_mem_right); 
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);
            
            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

           if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
              WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues + 1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
            
            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_dist_left); 
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end

            n_cues = n_cues +  1;

        end

    else

        if (strcmp(Trial(expTrial).LateralityStims{left_right},'left')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'left'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            
            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

             if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end

            n_cues = n_cues +  1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);
            
            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
               WaitSecs(expinfo.FeedbackDuration);
               clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
               WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
               io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end

            n_cues = n_cues +  1;

        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'right')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'right'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %
            
            % Screen Cues
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end

           
            n_cues = n_cues +  1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Stims
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);
            
            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            
            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;


        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'left')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'right'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %%

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);


            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Dist_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

           if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
           end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


     
            n_cues = n_cues +  1;

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Mem_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

             if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;


        elseif (strcmp(Trial(expTrial).LateralityStims{left_right},'right')) && (strcmp(Trial(expTrial).LateralityStims{left_right+1},'left'))

            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right,n_cues,next_flip,expinfo.Marker.Cue_dist_right);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).LureStims{Pos_MemSet},Trial(expTrial).ScrambledLureStims{Pos_MemSet},expTrial,left_right,next_flip,expinfo.Marker.Dist_right);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

           if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            
            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
           
            end

            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;
            
            % Write Marker for Serial Position
            io64(expinfo.ioObj, expinfo.PortAddress, expinfo.Marker.SerialPos(n_cues)); %
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Show Fixation Cross for next Stim
            Trial(expTrial).time_fixation(n_cues) = TextCenteredOnPos(expinfo,'+',expinfo.centerX,expinfo.centerY,expinfo.Colors.stimColor,[],expinfo.Marker.Fixation);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).time_fixation(n_cues),Trial(expTrial).FixTime_jittered(n_cues));
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

 
            % Screen Cue
            [expinfo, next_flip] = ScreenCues(expinfo, Trial, expTrial,left_right+1,n_cues,next_flip,expinfo.Marker.Cue_mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            % Cue Word Interval
            Trial(expTrial).Cue_Word(n_cues) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
            next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).Cue_Word(n_cues),expinfo.Cue_Word);

            % Screen Stims
            [expinfo, next_flip] = ScreenStims(expinfo,Trial,Trial(expTrial).MemStims{Pos_MemSet},Trial(expTrial).ScrambledMemStims{Pos_MemSet},expTrial,left_right+1,next_flip,expinfo.Marker.Mem_left);
            WaitSecs(0.05);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %


            Trial = getresponse(expinfo, Trial,expTrial,n_cues);
            io64(expinfo.ioObj, expinfo.PortAddress, 0); %

            if Trial(expTrial).RT_SecTask(n_cues) < expinfo.MinTarget
                WaitSecs(expinfo.MinTarget-Trial(expTrial).RT_SecTask(n_cues));
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);

            else
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);

            end


            if isPractice == 1 % Show feedback in practice trials
                clearScreen(expinfo,expinfo.Colors.bgColor);
                if Trial(expTrial).ACC_SecTask(n_cues) == 1
                    TextCenteredOnPos(expinfo,'RICHTIG',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.green,next_flip);
                elseif Trial(expTrial).ACC_SecTask(n_cues) == 0 && strcmp(Trial(expTrial).Response_SecTask(n_cues),'m') == 0
                    TextCenteredOnPos(expinfo,'FALSCH',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                elseif  strcmp(Trial(expTrial).Response_SecTask(n_cues),'m')
                    TextCenteredOnPos(expinfo,'ZU LANGSAM',0.5*expinfo.maxX,0.5*expinfo.maxY,expinfo.Colors.red,next_flip);
                end
                WaitSecs(expinfo.FeedbackDuration);
                clearScreen(expinfo,expinfo.Colors.bgColor,[],expinfo.Marker.ISI_Start);
                WaitSecs(Trial(expTrial).ISI_jittered(n_cues));
                io64(expinfo.ioObj, expinfo.PortAddress, 0);
            end


            n_cues = n_cues +  1;


        end
    end


     left_right = left_right + 2;

end

%% Show Retrieval Cue
% display Cue

Trial(expTrial).RetStart_ISI = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip);
next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).RetStart_ISI,Trial(expTrial).ISI_jittered(n_cues)); 

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

if Pos < expinfo.SetSize

    Trial(expTrial).ISI_Ret(Pos) = clearScreen(expinfo,expinfo.Colors.bgColor, next_flip,expinfo.Marker.ISI_Ret);
    next_flip = getAccurateFlip(expinfo.window,Trial(expTrial).ISI_Ret(Pos),Trial(expTrial).ISI_Ret_jittered(Pos));
    WaitSecs(0.05);
    io64(expinfo.ioObj, expinfo.PortAddress, 0); %

end


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

%% Print experimental conditions
fprintf(fid, '%d ',expinfo.SetSize);

%% Print presentation properties of the stimulus

% for i = 1:expinfo.SetSize*2
%     fprintf(fid, '%d ', Trial(expTrial).CorrRespPos_helper(i));
%     fprintf(fid, '%s ', Trial(expTrial).CorrRespSize(i));
% end

%% Print Response for every Position information into data file

for i = 1:expinfo.SetSize
    fprintf(fid, '%d ', Trial(expTrial).ACC(i));
end

for i = 1:expinfo.SetSize

    fprintf(fid, '%1.4f ',Trial(expTrial).RT(i));
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
Trial(expTrial).ITI = clearScreen(expinfo,expinfo.Colors.bgColor,next_flip,expinfo.Marker.ITI_Start);
getAccurateFlip(expinfo.window,Trial(expTrial).ITI,expinfo.ITI);
WaitSecs(0.05);
io64(expinfo.ioObj, expinfo.PortAddress, 0); %

end

%% End of Function
% This function was programmed by Gidon T. Frischkorn, as part of a
% template for MATLAB experiments. If you have any questions please contact
% me via mail: gidon.frischkorn@psychologie.uzh.ch