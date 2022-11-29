function [persDatStruct] = enterPersonalData()


%persDatStruct = struct('sex', sex,'year',year, 'subject', subject);
scrsz = get(0,'ScreenSize');

personalDataFigure = figure('Name','Personendaten');
set(personalDataFigure, 'NumberTitle','off');
set(personalDataFigure, 'Position',[scrsz(3)/3 scrsz(4)/3 scrsz(3)/6 scrsz(4)/3]);
%set(gcf,'menubar','none','units','normalized');
%uimenu('label','Close Window','callback','close');

years = [1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939,...
    1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949,...
    1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959,...
    1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969,...
    1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979,...
    1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989,...
    1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,...
    2000];

% Get the Color of the figure window
colorOfFigureWindow = get(personalDataFigure,'Color');

sexNyear = uibuttongroup(personalDataFigure,'Visible','on','Position',[.1 .7 .8 .25],'Title','Jahrgang & Geschlecht');
sexTextBox = uicontrol(sexNyear,'style','text',...
    'String','Geschlecht:',...
    'Unit','normalized','Position',[.1 .7 .4 .2]);
set(sexTextBox,'BackgroundColor',colorOfFigureWindow);
maleRadio = uicontrol(sexNyear,'Style','radiobutton',...
         'String','M',...
         'Value',1,...
         'Unit','normalized','Position',[.55 .7 .2 .2],...
         'Parent',sexNyear,'HandleVisibility','off');
     set(maleRadio,'BackgroundColor',colorOfFigureWindow);
femRadio = uicontrol(sexNyear,'Style','radiobutton',...
         'String','F',...
         'Value',0,...
         'Unit','normalized','Position',[.75 .7 .2 .2],...
         'Parent',sexNyear,'HandleVisibility','off');
     set(femRadio,'BackgroundColor',colorOfFigureWindow);
set(sexNyear,'BackgroundColor',colorOfFigureWindow);
set(sexNyear,'SelectionChangeFcn',@sexNyear_Callback);
set(sexNyear,'SelectedObject',[]);  % No selection
set(sexNyear,'Visible','on');

yearTextBox = uicontrol(sexNyear,'style','text',...
    'String','Jahrgang:',...
    'Unit','normalized','Position',[.1 .3 .4 .2]);
set(yearTextBox,'BackgroundColor',colorOfFigureWindow);
yearsPopUp = uicontrol(sexNyear,'Style','popupmenu',...
        'String',{years},...
        'Unit','normalized','Position',[.55 .3 .32 .2]);
    set(yearsPopUp,'BackgroundColor',colorOfFigureWindow);
    set(yearsPopUp,'Callback',@yearsPopUp_Callback); 
    year = get(yearsPopUp,'Value'); 

    
subj = uibuttongroup(personalDataFigure,'Visible','on','Position',[.1 .5 .8 .15],'Title','Bedingungen');
subjectTextBox = uicontrol(subj,'style','text',...
    'String','Vp-Nummer:',...
    'Unit','normalized','Position',[.1 .25 .4 .6]);
set(subjectTextBox,'BackgroundColor',colorOfFigureWindow);
subjectField = uicontrol(subj,'Style','edit',...
    'Unit','normalized','Position',[.55 .25 .32 .6]);
set(subjectField,'BackgroundColor',[1 1 1]);
    set(subjectField,'Callback',@subjectField_Callback); 
% subject = str2mat(get(subjectField,'Value')); 
set(subj,'BackgroundColor',colorOfFigureWindow);
    
confirmButton = uicontrol(personalDataFigure,'Style','pushbutton',...
        'String','OK',...
        'Position',[scrsz(3)/(3*4)-45 35 90 30]);
    set(confirmButton,'Callback','close');
%     set(confirmButton,'Callback',@confirmButton_Callback);

uiwait();
   
   
persDatStruct.sex = sex;
persDatStruct.year = year;
persDatStruct.subject = subject;

% write chosen language to default language textfile

% -----------------------------------------------------------------------
    function sexNyear_Callback(hObject,~)
        sex = get(get(hObject,'SelectedObject'),'String');
    end

    function yearsPopUp_Callback(hObject, ~)
        year_val = get(hObject,'Value');
        year = years(year_val);        
    end 

    function subjectField_Callback(hObject, ~)
        subject = get(hObject,'String');
    end 

%     function confirmButton_Callback(hObject, eventdata)     
%         close(personalDataFigure);
%     end

end
