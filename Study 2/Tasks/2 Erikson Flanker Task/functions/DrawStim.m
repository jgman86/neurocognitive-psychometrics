
function [timestamp_flip] = DrawStim(expinfo, Trial, expTrial, when, Marker)
if Trial(expTrial).Arrow == 1
    PointListTri1 = zeros(3,2);
    PointListTri1(1,1) = expinfo.xTargetPos + (284/7)*(1/6);
    PointListTri1(1,2) = expinfo.yTargetPos - (284/7)*(1/4);
    PointListTri1(2,1) = expinfo.xTargetPos + (284/7)*(1/2);
    PointListTri1(2,2) = expinfo.yTargetPos;
    PointListTri1(3,1) = expinfo.xTargetPos + (284/7)*(1/6);
    PointListTri1(3,2) = expinfo.yTargetPos + (284/7)*(1/4);
    Screen('FillPoly',expinfo.window, expinfo.Colors.gray, PointListTri1)
    
    PointListRect1 = zeros(4,1);
    PointListRect1(1,1)= expinfo.xTargetPos - (284/7)*(1/2);
    PointListRect1(2,1)= expinfo.yTargetPos - ((284/7)*(1/4))*(1/3);
    PointListRect1(3,1)= expinfo.xTargetPos + ((284/7)*(1/2))*(1/3);
    PointListRect1(4,1)= expinfo.yTargetPos + ((284/7)*(1/4))*(1/3);
    
    Screen('FillRect',expinfo.window, expinfo.Colors.gray, PointListRect1)
else
    
    PointListTri1 = zeros(3,2);
    PointListTri1(1,1) = expinfo.xTargetPos - (284/7)*(1/6);
    PointListTri1(1,2) = expinfo.yTargetPos - (284/7)*(1/4);
    PointListTri1(2,1) = expinfo.xTargetPos - (284/7)*(1/2);
    PointListTri1(2,2) = expinfo.yTargetPos;
    PointListTri1(3,1) = expinfo.xTargetPos - (284/7)*(1/6);
    PointListTri1(3,2) = expinfo.yTargetPos + (284/7)*(1/4);
    Screen('FillPoly',expinfo.window, expinfo.Colors.gray, PointListTri1)
    
    PointListRect1 = zeros(4,1);
    PointListRect1(1,1)= expinfo.xTargetPos - ((284/7)*(1/2))*(1/3);
    PointListRect1(2,1)= expinfo.yTargetPos - ((284/7)*(1/4))*(1/3);
    PointListRect1(3,1)= expinfo.xTargetPos + (284/7)*(1/2);
    PointListRect1(4,1)= expinfo.yTargetPos + ((284/7)*(1/4))*(1/3);
    
    Screen('FillRect',expinfo.window, expinfo.Colors.gray, PointListRect1)
end

FlankerPos = [expinfo.xTargetPos+284/7+284/5 expinfo.xTargetPos+2*(284/7)+2*(284/5) expinfo.xTargetPos-284/7-284/5 expinfo.xTargetPos-2*(284/7)-2*(284/5)];

for i = 1: length(FlankerPos)
    if Trial(expTrial).Flanker == 1
        PointListTri = zeros(3,2);
        PointListTri(1,1) = FlankerPos(i) + (284/7)*(1/6);
        PointListTri(1,2) = expinfo.yTargetPos - (284/7)*(1/4);
        PointListTri(2,1) = FlankerPos(i) + (284/7)*(1/2);
        PointListTri(2,2) = expinfo.yTargetPos;
        PointListTri(3,1) = FlankerPos(i) + (284/7)*(1/6);
        PointListTri(3,2) = expinfo.yTargetPos + (284/7)*(1/4);
        Screen('FillPoly',expinfo.window, expinfo.Colors.gray, PointListTri)
        
        PointListRect = zeros(4,1);
        PointListRect(1,1)= FlankerPos(i) - (284/7)*(1/2);
        PointListRect(2,1)= expinfo.yTargetPos - ((284/7)*(1/4))*(1/3);
        PointListRect(3,1)= FlankerPos(i) + ((284/7)*(1/2))*(1/3);
        PointListRect(4,1)= expinfo.yTargetPos + ((284/7)*(1/4))*(1/3);
        Screen('FillRect',expinfo.window, expinfo.Colors.gray, PointListRect)
        
    elseif Trial(expTrial).Flanker == 2
        PointListTri = zeros(3,2);
        PointListTri(1,1) = FlankerPos(i) - (284/7)*(1/6);
        PointListTri(1,2) = expinfo.yTargetPos - (284/7)*(1/4);
        PointListTri(2,1) = FlankerPos(i) - (284/7)*(1/2);
        PointListTri(2,2) = expinfo.yTargetPos;
        PointListTri(3,1) = FlankerPos(i) - (284/7)*(1/6);
        PointListTri(3,2) = expinfo.yTargetPos + (284/7)*(1/4);
        Screen('FillPoly',expinfo.window, expinfo.Colors.gray, PointListTri)
        
        PointListRect = zeros(4,1);
        PointListRect(1,1)= FlankerPos(i) - ((284/7)*(1/2))*(1/3);
        PointListRect(2,1)= expinfo.yTargetPos - ((284/7)*(1/4))*(1/3);
        PointListRect(3,1)= FlankerPos(i) + (284/7)*(1/2);
        PointListRect(4,1)= expinfo.yTargetPos + ((284/7)*(1/4))*(1/3);
        Screen('FillRect',expinfo.window, expinfo.Colors.gray, PointListRect)
        
    elseif Trial(expTrial).Flanker == 3
        PointListRect = zeros(4,1);
        PointListRect(1,1)= FlankerPos(i) - (284/7)*(1/2);
        PointListRect(2,1)= expinfo.yTargetPos - ((284/7)*(1/4))*(1/3);
        PointListRect(3,1)= FlankerPos(i) + (284/7)*(1/2);
        PointListRect(4,1)= expinfo.yTargetPos + ((284/7)*(1/4))*(1/3);
        
        Screen('FillRect',expinfo.window, expinfo.Colors.gray, PointListRect)
    end
end
Screen('DrawingFinished', expinfo.window);


%% Flip stimuli to screen
% Flip Screen
if ~exist('when','var') || isempty(when)
    % Flip expinfo.window immediately
    timestamp_flip = Screen('Flip',expinfo.window);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);
else
    % Flip synced to timestamp entered
    timestamp_flip = Screen('Flip',expinfo.window,when);
    io64(expinfo.ioObj, expinfo.PortAddress, Marker);
end

end