function [expinfo] = getMarkers(expinfo,isPractice)
% This is a function that specifies EEG Markers for the experiment and
% saves them into the expinfo object, so that Markers can be accessed
% during the Experiment without any further computational load.

%% Specify Block Markers for Experiment

Marker.MatlabStart = 111;
Marker.PracStart = 211;
Marker.PracEnd = 212;
Marker.ExpStart = 2;
Marker.ExpEnd = 3;


%% Specify Stimulus Markers within each trial
% Markers for different Screens
Marker.Fixation = zeros(2,2);
Marker.ISI = zeros(2,2);
Marker.Target = zeros(2,2);
Marker.ITI = zeros(2,2);

for i = expinfo.Congruency
    if isPractice == 1
        Marker.Fixation = 0;
        Marker.ISI = 0;
        Marker.Target = 0;
        Marker.ITI = 0;
    else
        Marker.Fixation(i) = 30+(i);  %(1,2)   1 congruent 2 incongruent
        Marker.ISI(i) = 40+(i);
        Marker.Target(i) = 50+(i);
        Marker.ITI(i) = 90+(i);
    end
end

if isPractice == 1
    Marker.Miss = 0;
    Marker.CorrResp_D = 0;
    Marker.CorrResp_L = 0;
    Marker.IncorrResp = 0;
    Marker.IncorrResp_D = 0;
    Marker.IncorrResp_L = 0;
else
    Marker.Miss = 222;
    Marker.CorrResp_D = 150;
    Marker.CorrResp_L = 160;
    Marker.IncorrResp_D = 250;
    Marker.IncorrResp_L = 255;
    Marker.IncorrResp = 251;
end

Marker.Block = zeros(expinfo.Block,2);
for i = 1:expinfo.Block
    Marker.Block(i,1) = 100 + i;
    Marker.Block(i,2) = 200 + i ;
end

%% Write Markers into expinfo object
expinfo.Marker = Marker;
end

