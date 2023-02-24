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
    Marker.Clear = 32;
    Marker.RetCue = 33;

    Marker.Cue_dist = 41;
    Marker.Cue_mem = 42;

    Marker.Mem_right =  51;
    Marker.Mem_left = 52;
    Marker.Dist_right = 61;
    Marker.Dist_left = 62;

    Marker.RespSecondary_correct = 71;
    Marker.RespSecondary_correct = 72;
    Marker.RespSecondary_miss = 73;


else

    Marker.Fixation = 0;
    Marker.Clear = 0;
    Marker.RetCue = 33;

    Marker.Cue_dist = 0;
    Marker.Cue_mem = 0;

    Marker.Mem_right = 0;
    Marker.Mem_left = 0;
    Marker.Dist_right = 0;
    Marker.Dist_left = 0;

    Marker.RespSecondary_correct = 0;
    Marker.RespSecondary_incorrect = 0;
    Marker.RespSecondary_miss = 0;


end       


%% Write Markers into expinfo object
expinfo.Marker = Marker;
end

