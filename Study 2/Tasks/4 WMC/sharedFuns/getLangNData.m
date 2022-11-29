function [langPersDatStruct] = getLangNData(langlist)

language = 'Sprache';
value = 0;
langStruct = struct('language',language,'value',value);
scrsz = get(0,'ScreenSize');
langNDataFigure = figure('Name','Language Selection');

%Set up figure
set(langNDataFigure, 'NumberTitle','off');
set(langNDataFigure, 'Position',[scrsz(3)*3/8 scrsz(4)/5 scrsz(3)/4 scrsz(4)*3/5]);  %[scrsz(3)/3 scrsz(4)/3 scrsz(3)/4 scrsz(4)/(2*.78)]); %[scrsz(3)/3 scrsz(4)/3 scrsz(3)/4 scrsz(4)/2];

% Get the Color of the figure window
colorOfFigureWindow = get(langNDataFigure,'Color');

%read default language (value: 1)
dl_filename = strcat('.\sharedFuns\defaultLang.csv');
defaultlang = csvread(dl_filename);

% ************************************************************
% Sprachen Auswahl
% ************************************************************

% Language Group
langroup = uibuttongroup(langNDataFigure,'Visible','on','Unit','normalized','Position',[.05 .68 .9 .27],'Title','Sprache'); %[.05 .6 .9 .35]
set(langroup,'BackgroundColor',colorOfFigureWindow);
% Language Pop-Up Menu
languageSelectPopUp = uicontrol(langroup,'Style','popupmenu',...
        'String',{langlist},'Value',defaultlang(1),...
        'Unit','normalized','Position',[.05 .32 .28 .1]);
    set(languageSelectPopUp,'Callback',@languageSelect_Callback); 
val = get(languageSelectPopUp,'Value'); 
string_list = get(languageSelectPopUp,'String');
lang = string_list(val);
% Language Link Button
linkTextButton = uicontrol(langroup,'Style','pushbutton',...
        'Unit','normalized','Position',[.38 .1 .57 .32],...
        'BackgroundColor',colorOfFigureWindow);
      labelTop = '<HTML><center>No support for your language?';
      labelBot = '<HTML><center><FONT color="blue">How to implement a new language</FONT></center></HTML>';
    set(linkTextButton, 'string', [labelTop, '<br>',labelBot]);
    set(linkTextButton,'Callback',@howTo_Callback);
% Language Intro Text
labelTextBox = uicontrol(langroup,'style','text');
set(labelTextBox,'String',{'Language, Sprache: ',' ','Choose your language below!  Wählen Sie Ihre Sprache unten!'});
set(labelTextBox,'HorizontalAlignment', 'left');
set(labelTextBox,'Unit','normalized','Position',[.05 .5 .9 .45]);    %   [5 scrsz(4)/2-20 scrsz(3)/3-40 150]);
set(labelTextBox,'BackgroundColor',colorOfFigureWindow);  
% Current Language Indicator
selectedLanguageReminder = uicontrol(langroup,'Style','text',...
        'String', lang,...
        'Unit','normalized','Position',[.38 .8 .57 .15],...
        'HorizontalAlignment','left',...
        'BackgroundColor',colorOfFigureWindow);     
   
%langStruct.language = lang;
%langStruct.value = val;
% write chosen language to default language textfile
csvwrite(dl_filename,val);

% *******************************************
% Module / Experimente Auswahl
% *******************************************
% module group
modgroup = uibuttongroup(langNDataFigure,'Visible','on','Unit','normalized','Position',[.05 .5 .9 .15],'Title','Module');
set(modgroup,'BackgroundColor',colorOfFigureWindow);

% modTextBox = uicontrol(modgroup,'style','text',...
%     'String','Geschlecht:',...
%     'HorizontalAlignment', 'right','Unit','normalized','Position',[.05 .62 .28 .2]);
% set(modTextBox,'BackgroundColor',colorOfFigureWindow);
memoryUp = uicontrol(modgroup,'Style','checkbox',...
         'String','Memory Updating',...
         'Value',1,...
         'Unit','normalized','Position',[.05 .74 .45 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(memoryUp,'BackgroundColor',colorOfFigureWindow);
     set(memoryUp,'Callback',@memoryUp_Callback);
     memup = get(memoryUp,'Value'); 
operationSp = uicontrol(modgroup,'Style','checkbox',...
         'String','Operation Span',...
         'Value',1,...
         'Unit','normalized','Position',[.05 .51 .45 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(operationSp,'BackgroundColor',colorOfFigureWindow);
     set(operationSp,'Callback',@operationSp_Callback);
     opsp = get(operationSp,'Value'); 
sentenceSp = uicontrol(modgroup,'Style','checkbox',...
         'String','Sentence Span',...
         'Value',1,...
         'Unit','normalized','Position',[.05 .28 .45 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(sentenceSp,'BackgroundColor',colorOfFigureWindow);
     set(sentenceSp,'Callback',@sentenceSp_Callback);     
     sentsp = get(sentenceSp,'Value'); 
spatialSTM = uicontrol(modgroup,'Style','checkbox',...
         'String','Spatial Short Time Memory',...
         'Value',1,...
         'Unit','normalized','Position',[.05 .05 .45 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(spatialSTM,'BackgroundColor',colorOfFigureWindow);
     set(spatialSTM,'Callback',@spatialSTM_Callback); 
     spatstm = get(spatialSTM,'Value'); 
taskSw = uicontrol(modgroup,'Style','checkbox',...
         'String','Task Switch',...
         'Value',0,...
         'Unit','normalized','Position',[.55 .51 .4 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(taskSw,'BackgroundColor',colorOfFigureWindow);
     set(taskSw,'Callback',@taskSw_Callback);
     tasksw = get(taskSw,'Value'); 
wordRec = uicontrol(modgroup,'Style','checkbox',...
         'String','Word Recognition',...
         'Value',0,...
         'Unit','normalized','Position',[.55 .28 .4 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(wordRec,'BackgroundColor',colorOfFigureWindow);
     set(wordRec,'Callback',@wordRec_Callback);     
     wordrec = get(wordRec,'Value'); 
taskSwContr = uicontrol(modgroup,'Style','checkbox',...
         'String','Choice RT',...
         'Value',0,...
         'Unit','normalized','Position',[.55 .74 .4 .2],...
         'Parent',modgroup,'HandleVisibility','off');
     set(taskSwContr,'BackgroundColor',colorOfFigureWindow);
     set(taskSwContr,'Callback',@taskSwContr_Callback);
     taskswc = get(taskSwContr,'Value'); 


% *******************************************
% Jahrgang & Geschlecht
% *******************************************
years = [1930, 1931, 1932, 1933, 1934, 1935, 1936, 1937, 1938, 1939,...
    1940, 1941, 1942, 1943, 1944, 1945, 1946, 1947, 1948, 1949,...
    1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959,...
    1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969,...
    1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979,...
    1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989,...
    1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999,...
    2000];

% Jahrgang/Geschlecht Gruppe
sexNyear = uibuttongroup(langNDataFigure,'Visible','on','Unit','normalized','Position',[.05 .28 .9 .19],'Title','Jahrgang & Geschlecht'); %[.05 .33 .9 .2]
% Geschlecht TextBox
sexTextBox = uicontrol(sexNyear,'style','text',...
    'String','Geschlecht:',...
    'HorizontalAlignment', 'right','Unit','normalized','Position',[.05 .62 .28 .2]);
set(sexTextBox,'BackgroundColor',colorOfFigureWindow);
maleRadio = uicontrol(sexNyear,'Style','radiobutton',...
         'String','M',...
         'Value',1,...
         'Unit','normalized','Position',[.38 .65 .2 .2],...
         'Parent',sexNyear,'HandleVisibility','off');
     set(maleRadio,'BackgroundColor',colorOfFigureWindow);
femRadio = uicontrol(sexNyear,'Style','radiobutton',...
         'String','F',...
         'Value',0,...
         'Unit','normalized','Position',[.5 .65 .2 .2],...
         'Parent',sexNyear,'HandleVisibility','off');
     set(femRadio,'BackgroundColor',colorOfFigureWindow);
set(sexNyear,'BackgroundColor',colorOfFigureWindow);
set(sexNyear,'SelectionChangeFcn',@sexNyear_Callback);
set(sexNyear,'SelectedObject',[]);  % No selection
set(sexNyear,'Visible','on');
% Jahrgang TextBox
yearTextBox = uicontrol(sexNyear,'style','text',...
    'String','Jahrgang:',...
    'HorizontalAlignment', 'right','Unit','normalized','Position',[.05 .3 .28 .2]);
set(yearTextBox,'BackgroundColor',colorOfFigureWindow);
yearsPopUp = uicontrol(sexNyear,'Style','popupmenu',...
        'String',{years},...
        'Unit','normalized','Position',[.38 .3 .25 .2]);
    set(yearsPopUp,'BackgroundColor',colorOfFigureWindow);
    set(yearsPopUp,'Callback',@yearsPopUp_Callback); 
    year = get(yearsPopUp,'Value'); 

% ******************************************************
% VP Nummer
% ******************************************************

% Vp-Nummer Gruppe    
subj = uibuttongroup(langNDataFigure,'Visible','on','Unit','normalized','Position',[.05 .16 .9 .09],'Title','Bedingungen'); %[.05 .18 .9 .12]
subjectTextBox = uicontrol(subj,'style','text',...
    'String','Vp-Nummer:',...
    'HorizontalAlignment', 'right','Unit','normalized','Position',[.05 .18 .28 .5]);
set(subjectTextBox,'BackgroundColor',colorOfFigureWindow);
subjectField = uicontrol(subj,'Style','edit',...
    'Unit','normalized','Position',[.38 .2 .25 .5]);
set(subjectField,'BackgroundColor',[1 1 1]);
    set(subjectField,'Callback',@subjectField_Callback); 
% subject = str2mat(get(subjectField,'Value')); 
set(subj,'BackgroundColor',colorOfFigureWindow);

% ***********************************
% OK
% ***********************************
    
confirmButton = uicontrol(langNDataFigure,'Style','pushbutton',...
        'String','OK',...
        'Unit','normalized','Position',[.42 .05 .16 .05]); % [.42 .05 .16 .06]
    set(confirmButton,'Callback','close');
%     set(confirmButton,'Callback',@confirmButton_Callback);

% *********************************************

uiwait();
   
   
langPersDatStruct.sex = sex;
langPersDatStruct.year = year;
langPersDatStruct.subject = subject;
langPersDatStruct.language = lang;

langPersDatStruct.memup = memup;
langPersDatStruct.opsp = opsp;
langPersDatStruct.sentsp = sentsp;
langPersDatStruct.spatstm = spatstm;
langPersDatStruct.tasksw = tasksw;
langPersDatStruct.wordrec = wordrec;
langPersDatStruct.taskswc = taskswc;

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

    function memoryUp_Callback(~, ~)
        if memup == 1
            memup = 0;
        elseif memup == 0
            memup = 1;
        end
    end

    function operationSp_Callback(~, ~)
        if opsp == 1
            opsp = 0;
        elseif opsp == 0
            opsp = 1;
        end
    end

    function sentenceSp_Callback(~, ~)
        if sentsp == 1
            sentsp = 0;
        elseif sentsp == 0
            sentsp = 1;
        end
    end

    function spatialSTM_Callback(~, ~)
        if spatstm == 1
            spatstm = 0;
        elseif spatstm == 0
            spatstm = 1;
        end
    end

    function taskSw_Callback(~, ~)
        if tasksw == 1
            tasksw = 0;
        elseif tasksw == 0
            tasksw = 1;
        end
    end

    function wordRec_Callback(~, ~)
        if wordrec == 1
            wordrec = 0;
        elseif wordrec == 0
            wordrec = 1;
        end
    end

    function taskSwContr_Callback(~, ~)
        if taskswc == 1
            taskswc = 0;
        elseif taskswc == 0
            taskswc = 1;
        end
    end

% -----------------------------------------------------------------------
% Executes when selecting a language
    function languageSelect_Callback(hObject, ~)
        val = get(hObject,'Value');
        string_list = get(hObject,'String');
        lang = string_list(val);
        set(selectedLanguageReminder,'String', lang);
    end 

    function howTo_Callback(hObject, ~)
         
         set(hObject,'Enable','inactive');
         % web [cd .. /WMCBattery/HowToAddNewLanguage.html]
         web(['file:///' which('HowToAddNewLanguage.html')]) 
         %web WMCBattery/HowToAddNewLanguage.html -browser
    end 

% % Executes when clicking the OK button
%     function [langStruct] = confirmButton_Callback(hObject, langStruct, eventdata)     
%         %language = langStruct.language;
%         %value = langStruct.value;
%         %display "FunctionOutput";
%         close 
%     end

%     function confirmButton_Callback(hObject, eventdata)     
%         close(personalDataFigure);
%     end

end
