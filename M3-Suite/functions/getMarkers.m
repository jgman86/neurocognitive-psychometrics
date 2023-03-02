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
    Marker.Cue_Word_Fix = 32;
    Marker.FT_Start = 34;
    Marker.ITI_Start = 35;

    Marker.RetCue = 36;
    Marker.RetStart = 37;
    Marker.ISI_Ret = 36;

    Marker.Cue_dist= 41;
    Marker.Cue_mem = 42;

    Marker.DistStim = 51;
    Marker.MemStim=  52;

    Marker.RespSecondary_correct = 71;
    Marker.RespSecondary_incorrect = 72;
    Marker.RespSecondary_miss = 73;

    % adjust to map for every serial position in a trial
    Marker.IIP = 81;
    Marker.IOP = 82;
    Marker.DIP = 83;
    Marker.DIOP = 84;
    Marker.NPL = 85;
    Marker.Miss_Ret = 86;

    % Mark every Serial Position
    for i=1:expinfo.SetSize*2

        Marker.SerialPos(i) = 19 + i;

    end


else


    Marker.Fixation = 0;
    Marker.Cue_Word_Fix = 0;
    Marker.FT_Start = 0;
    Marker.ITI_Start = 0;

    Marker.RetCue = 0;
    Marker.RetStart = 0;
    Marker.ISI_Ret = 0;

    Marker.Cue_dist = 0;
    Marker.Cue_mem = 0;

    Marker.DistStim = 0;
    Marker.MemStim=  0;

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

