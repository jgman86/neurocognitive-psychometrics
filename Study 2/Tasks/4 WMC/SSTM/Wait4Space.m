function Wait4Space
    
    while 1
        FlushEvents(); % Lin, 08.10.2014
        [keyIsDown,~,keyCode]=KbCheck;
        if keyIsDown
            kp = find(keyCode);
            if kp == 32
                break;
            end
            if kp == 27
                Screen('CloseAll')
                return
            end
        end
        WaitSecs(0.01); % Lin, 08.10.2014
    end