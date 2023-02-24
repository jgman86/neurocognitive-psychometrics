function [expinfo] = getMarkers(expinfo,isPractice)
% This is a function that specifies EEG Markers for the experiment and
% saves them into the expinfo object, so that Markers can be accessed
% during the Experiment without any further computational load.


%% Specify Block Markers for Experiment

Marker.MatlabStart = 100;
Marker.PracStart = 101;
Marker.PracEnd = 102;
Marker.ExpStart = 201;
Marker.ExpEnd = 202;


%% Specify Stimulus Markers within each trial
% Markers for different Screens


if isPractice == 0

    Marker.Fixation = 31;
    Marker.RetCue = 32;
    Marker.RetStart = 33;
    Marker.ISI_Start = 34;
    Marker.ITI_Start = 35;
    Marker.ISI_Ret = 36;

    Marker.Cue_dist_right = 41;
    Marker.Cue_dist_left = 42;
    Marker.Cue_mem_right = 43;
    Marker.Cue_mem_left = 44;

    Marker.Dist_right = 51;
    Marker.Dist_left = 52;
    Marker.Mem_right =  53;
    Marker.Mem_left = 54;

    Marker.RespSecondary_correct = 71;
    Marker.RespSecondary_incorrect = 72;
    Marker.RespSecondary_miss = 73;

    Marker.IIP = 81;
    Marker.IOP = 82;
    Marker.DIP = 83;
    Marker.DIOP = 84;
    Marker.NPL = 85;
    Marker.Miss_Ret = 86;

    for i=1:expinfo.SetSize*2

        Marker.SerialPos(i) = 19 + i;

    end


else


    Marker.Fixation = 0;
    Marker.RetCue = 0;
    Marker.RetStart = 0;
    Marker.ISI_Start = 0;
    Marker.ITI_Start = 0;
    Marker.ISI_Ret = 0;


    Marker.Cue_dist_right = 0;
    Marker.Cue_dist_left = 0;
    Marker.Cue_mem_right = 0;
    Marker.Cue_mem_left = 0;

    Marker.Mem_right = 0;
    Marker.Mem_left = 0;
    Marker.Dist_right = 0;
    Marker.Dist_left = 0;

    Marker.RespSecondary_correct = 0;
    Marker.RespSecondary_incorrect = 0;
    Marker.RespSecondary_miss = 0;

    Marker.Start_Ret = 0;
    Marker.IIP = 0;
    Marker.IOP = 0;
    Marker.DIP = 0;
    Marker.DIOP = 0;
    Marker.NPL = 0;
    Marker.Miss_Ret= 0;

    for i=1:expinfo.SetSize*2

        Marker.SerialPos(i) = 0;

    end


end       


%% Write Markers into expinfo object
expinfo.Marker = Marker;
end

