function RespFeedback(expinfo, givenAnswer, response)
if ~exist('Marker','var') || isempty(Marker)
    Marker = 0;
end

if ~exist('flip','var')
    flip = 0;
elseif isempty(flip)
    flip = 0;
end

if ~exist('angle','var')
    angle = 0;
elseif isempty(angle)
    angle = 0;
end



    
%Box0 
%Links oben nach nach rechts oben 
%Links unten nach rechts unten 
%Links oben nach Links unten 
%Rechts oben nach rechts unten 

if response==1
    Screen('FrameRect', expinfo.window ,expinfo.Colors.black, expinfo.Coord(,1) [,penWidth]);

if givenAnswer == 1
%Box1
Screen('Rect', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(2), expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(4), expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(2), expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid1(3),  expinfo.RangeRespGrid1(2),expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(4) ,3);

elseif givenAnswer == 2
%Box2
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(2), expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(4), expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(2), expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid2(3),  expinfo.RangeRespGrid2(2),expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(4) ,3);

elseif givenAnswer == 3
%Box3
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(2), expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(4), expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(2), expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid3(3),  expinfo.RangeRespGrid3(2),expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(4) ,3);

elseif givenAnswer == 4
%Box4
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(2), expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(4), expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(2), expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid4(3),  expinfo.RangeRespGrid4(2),expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(4) ,3);

elseif givenAnswer == 5
%Box5
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(2), expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(4), expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(2), expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid5(3),  expinfo.RangeRespGrid5(2),expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(4) ,3);

elseif givenAnswer == 6
%Box6
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(2), expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(4), expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(2), expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid6(3),  expinfo.RangeRespGrid6(2),expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(4) ,3);

elseif givenAnswer == 7
%Box7
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(2), expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(4), expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(2), expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid7(3),  expinfo.RangeRespGrid7(2),expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(4) ,3);

elseif givenAnswer == 8
%Box8
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(2), expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(4), expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(2), expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid8(3),  expinfo.RangeRespGrid8(2),expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(4) ,3);

elseif givenAnswer == 9
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(2), expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(4), expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(2), expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid9(3),  expinfo.RangeRespGrid9(2),expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(4) ,3);

elseif givenAnswer == 10
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(2), expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(4), expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(2), expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid10(3),  expinfo.RangeRespGrid10(2),expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(4) ,3);

elseif givenAnswer == 11
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(2), expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(4), expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(2), expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid11(3),  expinfo.RangeRespGrid11(2),expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(4) ,3);

elseif givenAnswer == 12
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(2), expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(4), expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(2), expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid12(3),  expinfo.RangeRespGrid12(2),expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(4) ,3);

elseif givenAnswer == 13
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(2), expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(4), expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(2), expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid13(3),  expinfo.RangeRespGrid13(2),expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(4) ,3);

elseif givenAnswer == 14
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(2), expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(4), expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(2), expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid14(3),  expinfo.RangeRespGrid14(2),expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(4) ,3);

elseif givenAnswer == 15
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(2), expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(4), expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(2), expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.black , expinfo.RangeRespGrid15(3),  expinfo.RangeRespGrid15(2),expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(4) ,3);


end
end
Screen('DrawingFinished', expinfo.window,0)

Screen('Flip', expinfo.window,0);
end
% 
% Wait for a keystroke and then close the screen
% ListenChar(-1);
% KbStrokeWait;
% sca;
% ListenChar(); 

