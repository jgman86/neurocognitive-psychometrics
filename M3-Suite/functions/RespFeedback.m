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

if givenAnswer == 1
%Box1
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(2), expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(4), expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(2), expinfo.RangeRespGrid1(1), expinfo.RangeRespGrid1(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid1(3),  expinfo.RangeRespGrid1(2),expinfo.RangeRespGrid1(3), expinfo.RangeRespGrid1(4) ,3);

elseif givenAnswer == 2
%Box2
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(2), expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(4), expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(2), expinfo.RangeRespGrid2(1), expinfo.RangeRespGrid2(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid2(3),  expinfo.RangeRespGrid2(2),expinfo.RangeRespGrid2(3), expinfo.RangeRespGrid2(4) ,3);

elseif givenAnswer == 3
%Box3
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(2), expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(4), expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(2), expinfo.RangeRespGrid3(1), expinfo.RangeRespGrid3(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid3(3),  expinfo.RangeRespGrid3(2),expinfo.RangeRespGrid3(3), expinfo.RangeRespGrid3(4) ,3);

elseif givenAnswer == 4
%Box4
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(2), expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(4), expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(2), expinfo.RangeRespGrid4(1), expinfo.RangeRespGrid4(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid4(3),  expinfo.RangeRespGrid4(2),expinfo.RangeRespGrid4(3), expinfo.RangeRespGrid4(4) ,3);

elseif givenAnswer == 5
%Box5
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(2), expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(4), expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(2), expinfo.RangeRespGrid5(1), expinfo.RangeRespGrid5(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid5(3),  expinfo.RangeRespGrid5(2),expinfo.RangeRespGrid5(3), expinfo.RangeRespGrid5(4) ,3);

elseif givenAnswer == 6
%Box6
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(2), expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(4), expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(2), expinfo.RangeRespGrid6(1), expinfo.RangeRespGrid6(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid6(3),  expinfo.RangeRespGrid6(2),expinfo.RangeRespGrid6(3), expinfo.RangeRespGrid6(4) ,3);

elseif givenAnswer == 7
%Box7
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(2), expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(4), expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(2), expinfo.RangeRespGrid7(1), expinfo.RangeRespGrid7(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid7(3),  expinfo.RangeRespGrid7(2),expinfo.RangeRespGrid7(3), expinfo.RangeRespGrid7(4) ,3);

elseif givenAnswer == 8
%Box8
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(2), expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(4), expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(2), expinfo.RangeRespGrid8(1), expinfo.RangeRespGrid8(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid8(3),  expinfo.RangeRespGrid8(2),expinfo.RangeRespGrid8(3), expinfo.RangeRespGrid8(4) ,3);

elseif givenAnswer == 9
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(2), expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(4), expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(2), expinfo.RangeRespGrid9(1), expinfo.RangeRespGrid9(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid9(3),  expinfo.RangeRespGrid9(2),expinfo.RangeRespGrid9(3), expinfo.RangeRespGrid9(4) ,3);

elseif givenAnswer == 10
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(2), expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(4), expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(2), expinfo.RangeRespGrid10(1), expinfo.RangeRespGrid10(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid10(3),  expinfo.RangeRespGrid10(2),expinfo.RangeRespGrid10(3), expinfo.RangeRespGrid10(4) ,3);

elseif givenAnswer == 11
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(2), expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(4), expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(2), expinfo.RangeRespGrid11(1), expinfo.RangeRespGrid11(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid11(3),  expinfo.RangeRespGrid11(2),expinfo.RangeRespGrid11(3), expinfo.RangeRespGrid11(4) ,3);

elseif givenAnswer == 12
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(2), expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(4), expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(2), expinfo.RangeRespGrid12(1), expinfo.RangeRespGrid12(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid12(3),  expinfo.RangeRespGrid12(2),expinfo.RangeRespGrid12(3), expinfo.RangeRespGrid12(4) ,3);

elseif givenAnswer == 13
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(2), expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(4), expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(2), expinfo.RangeRespGrid13(1), expinfo.RangeRespGrid13(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid13(3),  expinfo.RangeRespGrid13(2),expinfo.RangeRespGrid13(3), expinfo.RangeRespGrid13(4) ,3);

elseif givenAnswer == 14
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(2), expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(4), expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(2), expinfo.RangeRespGrid14(1), expinfo.RangeRespGrid14(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid14(3),  expinfo.RangeRespGrid14(2),expinfo.RangeRespGrid14(3), expinfo.RangeRespGrid14(4) ,3);

elseif givenAnswer == 15
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(2), expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(4), expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(2), expinfo.RangeRespGrid15(1), expinfo.RangeRespGrid15(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid15(3),  expinfo.RangeRespGrid15(2),expinfo.RangeRespGrid15(3), expinfo.RangeRespGrid15(4) ,3);

elseif givenAnswer == 16
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid16(1), expinfo.RangeRespGrid16(2), expinfo.RangeRespGrid16(3), expinfo.RangeRespGrid16(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid16(1), expinfo.RangeRespGrid16(4), expinfo.RangeRespGrid16(3), expinfo.RangeRespGrid16(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid16(1), expinfo.RangeRespGrid16(2), expinfo.RangeRespGrid16(1), expinfo.RangeRespGrid16(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid16(3),  expinfo.RangeRespGrid16(2),expinfo.RangeRespGrid16(3), expinfo.RangeRespGrid16(4) ,3);

elseif givenAnswer == 17
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid17(1), expinfo.RangeRespGrid17(2), expinfo.RangeRespGrid17(3), expinfo.RangeRespGrid17(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid17(1), expinfo.RangeRespGrid17(4), expinfo.RangeRespGrid17(3), expinfo.RangeRespGrid17(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid17(1), expinfo.RangeRespGrid17(2), expinfo.RangeRespGrid17(1), expinfo.RangeRespGrid17(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid17(3),  expinfo.RangeRespGrid17(2),expinfo.RangeRespGrid17(3), expinfo.RangeRespGrid17(4) ,3);

elseif givenAnswer == 18
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid18(1), expinfo.RangeRespGrid18(2), expinfo.RangeRespGrid18(3), expinfo.RangeRespGrid18(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid18(1), expinfo.RangeRespGrid18(4), expinfo.RangeRespGrid18(3), expinfo.RangeRespGrid18(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid18(1), expinfo.RangeRespGrid18(2), expinfo.RangeRespGrid18(1), expinfo.RangeRespGrid18(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid18(3),  expinfo.RangeRespGrid18(2),expinfo.RangeRespGrid18(3), expinfo.RangeRespGrid18(4) ,3);

elseif givenAnswer == 19
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid19(1), expinfo.RangeRespGrid19(2), expinfo.RangeRespGrid19(3), expinfo.RangeRespGrid19(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid19(1), expinfo.RangeRespGrid19(4), expinfo.RangeRespGrid19(3), expinfo.RangeRespGrid19(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid19(1), expinfo.RangeRespGrid19(2), expinfo.RangeRespGrid19(1), expinfo.RangeRespGrid19(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid19(3),  expinfo.RangeRespGrid19(2),expinfo.RangeRespGrid19(3), expinfo.RangeRespGrid19(4) ,3);

elseif givenAnswer == 20
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid20(1), expinfo.RangeRespGrid20(2), expinfo.RangeRespGrid20(3), expinfo.RangeRespGrid20(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid20(1), expinfo.RangeRespGrid20(4), expinfo.RangeRespGrid20(3), expinfo.RangeRespGrid20(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid20(1), expinfo.RangeRespGrid20(2), expinfo.RangeRespGrid20(1), expinfo.RangeRespGrid20(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid20(3),  expinfo.RangeRespGrid20(2),expinfo.RangeRespGrid20(3), expinfo.RangeRespGrid20(4) ,3);

elseif givenAnswer == 21
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid21(1), expinfo.RangeRespGrid21(2), expinfo.RangeRespGrid21(3), expinfo.RangeRespGrid21(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid21(1), expinfo.RangeRespGrid21(4), expinfo.RangeRespGrid21(3), expinfo.RangeRespGrid21(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid21(1), expinfo.RangeRespGrid21(2), expinfo.RangeRespGrid21(1), expinfo.RangeRespGrid21(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid21(3),  expinfo.RangeRespGrid21(2),expinfo.RangeRespGrid21(3), expinfo.RangeRespGrid21(4) ,3);

elseif givenAnswer == 22
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid22(1), expinfo.RangeRespGrid22(2), expinfo.RangeRespGrid22(3), expinfo.RangeRespGrid22(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid22(1), expinfo.RangeRespGrid22(4), expinfo.RangeRespGrid22(3), expinfo.RangeRespGrid22(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid22(1), expinfo.RangeRespGrid22(2), expinfo.RangeRespGrid22(1), expinfo.RangeRespGrid22(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid22(3),  expinfo.RangeRespGrid22(2),expinfo.RangeRespGrid22(3), expinfo.RangeRespGrid22(4) ,3);

elseif givenAnswer == 23
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid23(1), expinfo.RangeRespGrid23(2), expinfo.RangeRespGrid23(3), expinfo.RangeRespGrid23(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid23(1), expinfo.RangeRespGrid23(4), expinfo.RangeRespGrid23(3), expinfo.RangeRespGrid23(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid23(1), expinfo.RangeRespGrid23(2), expinfo.RangeRespGrid23(1), expinfo.RangeRespGrid23(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid23(3),  expinfo.RangeRespGrid23(2),expinfo.RangeRespGrid23(3), expinfo.RangeRespGrid23(4) ,3);

elseif givenAnswer == 24
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid24(1), expinfo.RangeRespGrid24(2), expinfo.RangeRespGrid24(3), expinfo.RangeRespGrid24(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid24(1), expinfo.RangeRespGrid24(4), expinfo.RangeRespGrid24(3), expinfo.RangeRespGrid24(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid24(1), expinfo.RangeRespGrid24(2), expinfo.RangeRespGrid24(1), expinfo.RangeRespGrid24(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid24(3),  expinfo.RangeRespGrid24(2),expinfo.RangeRespGrid24(3), expinfo.RangeRespGrid24(4) ,3);

elseif givenAnswer == 25
%Box9
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid25(1), expinfo.RangeRespGrid25(2), expinfo.RangeRespGrid25(3), expinfo.RangeRespGrid25(2) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid25(1), expinfo.RangeRespGrid25(4), expinfo.RangeRespGrid25(3), expinfo.RangeRespGrid25(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid25(1), expinfo.RangeRespGrid25(2), expinfo.RangeRespGrid25(1), expinfo.RangeRespGrid25(4) ,3);
Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid25(3),  expinfo.RangeRespGrid25(2),expinfo.RangeRespGrid25(3), expinfo.RangeRespGrid25(4) ,3);

% 
% elseif givenAnswer == 26
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid26(1), expinfo.RangeRespGrid26(2), expinfo.RangeRespGrid26(3), expinfo.RangeRespGrid26(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid26(1), expinfo.RangeRespGrid26(4), expinfo.RangeRespGrid26(3), expinfo.RangeRespGrid26(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid26(1), expinfo.RangeRespGrid26(2), expinfo.RangeRespGrid26(1), expinfo.RangeRespGrid26(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid26(3),  expinfo.RangeRespGrid26(2),expinfo.RangeRespGrid26(3), expinfo.RangeRespGrid26(4) ,3);
% 
% elseif givenAnswer == 27
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid27(1), expinfo.RangeRespGrid27(2), expinfo.RangeRespGrid27(3), expinfo.RangeRespGrid27(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid27(1), expinfo.RangeRespGrid27(4), expinfo.RangeRespGrid27(3), expinfo.RangeRespGrid27(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid27(1), expinfo.RangeRespGrid27(2), expinfo.RangeRespGrid27(1), expinfo.RangeRespGrid27(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid27(3),  expinfo.RangeRespGrid27(2),expinfo.RangeRespGrid27(3), expinfo.RangeRespGrid27(4) ,3);
% 
% elseif givenAnswer == 28
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid28(1), expinfo.RangeRespGrid28(2), expinfo.RangeRespGrid28(3), expinfo.RangeRespGrid28(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid28(1), expinfo.RangeRespGrid28(4), expinfo.RangeRespGrid28(3), expinfo.RangeRespGrid28(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid28(1), expinfo.RangeRespGrid28(2), expinfo.RangeRespGrid28(1), expinfo.RangeRespGrid28(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid28(3),  expinfo.RangeRespGrid28(2),expinfo.RangeRespGrid28(3), expinfo.RangeRespGrid28(4) ,3);
% 
% elseif givenAnswer == 29
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid29(1), expinfo.RangeRespGrid29(2), expinfo.RangeRespGrid29(3), expinfo.RangeRespGrid29(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid29(1), expinfo.RangeRespGrid29(4), expinfo.RangeRespGrid29(3), expinfo.RangeRespGrid29(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid29(1), expinfo.RangeRespGrid29(2), expinfo.RangeRespGrid29(1), expinfo.RangeRespGrid29(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid29(3),  expinfo.RangeRespGrid29(2),expinfo.RangeRespGrid29(3), expinfo.RangeRespGrid29(4) ,3);
% 
% elseif givenAnswer == 30
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid30(1), expinfo.RangeRespGrid30(2), expinfo.RangeRespGrid30(3), expinfo.RangeRespGrid30(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid30(1), expinfo.RangeRespGrid30(4), expinfo.RangeRespGrid30(3), expinfo.RangeRespGrid30(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid30(1), expinfo.RangeRespGrid30(2), expinfo.RangeRespGrid30(1), expinfo.RangeRespGrid30(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid30(3),  expinfo.RangeRespGrid30(2),expinfo.RangeRespGrid30(3), expinfo.RangeRespGrid30(4) ,3);
% 
% elseif givenAnswer == 31
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid31(1), expinfo.RangeRespGrid31(2), expinfo.RangeRespGrid31(3), expinfo.RangeRespGrid31(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid31(1), expinfo.RangeRespGrid31(4), expinfo.RangeRespGrid31(3), expinfo.RangeRespGrid31(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid31(1), expinfo.RangeRespGrid31(2), expinfo.RangeRespGrid31(1), expinfo.RangeRespGrid31(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid31(3),  expinfo.RangeRespGrid31(2),expinfo.RangeRespGrid31(3), expinfo.RangeRespGrid31(4) ,3);
% 
% elseif givenAnswer == 32
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid32(1), expinfo.RangeRespGrid32(2), expinfo.RangeRespGrid32(3), expinfo.RangeRespGrid32(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid32(1), expinfo.RangeRespGrid32(4), expinfo.RangeRespGrid32(3), expinfo.RangeRespGrid32(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid32(1), expinfo.RangeRespGrid32(2), expinfo.RangeRespGrid32(1), expinfo.RangeRespGrid32(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid32(3),  expinfo.RangeRespGrid32(2),expinfo.RangeRespGrid32(3), expinfo.RangeRespGrid32(4) ,3);
% 
% elseif givenAnswer == 33
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid33(1), expinfo.RangeRespGrid33(2), expinfo.RangeRespGrid33(3), expinfo.RangeRespGrid33(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid33(1), expinfo.RangeRespGrid33(4), expinfo.RangeRespGrid33(3), expinfo.RangeRespGrid33(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid33(1), expinfo.RangeRespGrid33(2), expinfo.RangeRespGrid33(1), expinfo.RangeRespGrid33(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid33(3), expinfo.RangeRespGrid33(2), expinfo.RangeRespGrid33(3),  expinfo.RangeRespGrid33(4) ,3);
% 
% elseif givenAnswer == 34
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid34(1), expinfo.RangeRespGrid34(2), expinfo.RangeRespGrid34(3), expinfo.RangeRespGrid34(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid34(1), expinfo.RangeRespGrid34(4), expinfo.RangeRespGrid34(3), expinfo.RangeRespGrid34(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid34(1), expinfo.RangeRespGrid34(2), expinfo.RangeRespGrid34(1), expinfo.RangeRespGrid34(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid34(3), expinfo.RangeRespGrid34(2),expinfo.RangeRespGrid34(3), expinfo.RangeRespGrid34(4) ,3);
% 
% elseif givenAnswer == 35
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid35(1), expinfo.RangeRespGrid35(2), expinfo.RangeRespGrid35(3), expinfo.RangeRespGrid35(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid35(1), expinfo.RangeRespGrid35(4), expinfo.RangeRespGrid35(3), expinfo.RangeRespGrid35(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid35(1), expinfo.RangeRespGrid35(2), expinfo.RangeRespGrid35(1), expinfo.RangeRespGrid35(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid35(3),  expinfo.RangeRespGrid35(2),expinfo.RangeRespGrid35(3), expinfo.RangeRespGrid35(4) ,3);
% 
% elseif givenAnswer == 36
% %Box9
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid36(1), expinfo.RangeRespGrid36(2), expinfo.RangeRespGrid36(3), expinfo.RangeRespGrid36(2) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid36(1), expinfo.RangeRespGrid36(4), expinfo.RangeRespGrid36(3), expinfo.RangeRespGrid36(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid36(1), expinfo.RangeRespGrid36(2), expinfo.RangeRespGrid36(1), expinfo.RangeRespGrid36(4) ,3);
% Screen('DrawLine', expinfo.window ,expinfo.Colors.gray , expinfo.RangeRespGrid36(3),  expinfo.RangeRespGrid36(2),expinfo.RangeRespGrid36(3), expinfo.RangeRespGrid36(4) ,3);

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

