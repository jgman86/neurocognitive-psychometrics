function [langStruct] = selectLanguage(langlist)

language = 'Sprache';
value = 0;
langStruct = struct('language',language,'value',value);
scrsz = get(0,'ScreenSize');
languageSelectionFigure = figure('Name','Language Selection');
%Set up figure
set(languageSelectionFigure, 'NumberTitle','off');
set(languageSelectionFigure, 'Position',[scrsz(3)/3 100 scrsz(3)/3 scrsz(4)-200]);
%set(gcf,'menubar','none','units','normalized');
%uimenu('label','Close Window','callback','close');

% Get the Color of the figure window
colorOfFigureWindow = get(languageSelectionFigure,'Color');

labelTextBox = uicontrol(languageSelectionFigure,'style','text');
%Set up text box
set(labelTextBox,'String',{' ',' ',' ','Choose your language from the dropdown menu below!',' ',...
    'Wählen Sie die gewünschte Sprache im untenstehenden Menü!',' ','Ni hao!'});
% set(labelTextBox,'Position',[30 200 scrsz(3)/3-2*30 150]);
set(labelTextBox,'Position',[25 scrsz(4)-200-150 scrsz(3)/3-50 150]);
set(labelTextBox,'BackgroundColor',colorOfFigureWindow);

%read default language (value: 1)
dl_filename = strcat('.\sharedFuns\defaultLang.csv');
defaultlang = csvread(dl_filename);

%
languageSelectPopUp = uicontrol(languageSelectionFigure,'Style','popupmenu',...
        'String',{langlist},'Value',defaultlang(1),...
        'Position',[scrsz(3)/(3*2)-65 scrsz(4)-200-150-50 130 20]);
    set(languageSelectPopUp,'Callback',@languageSelect_Callback); 
val = get(languageSelectPopUp,'Value'); 
string_list = get(languageSelectPopUp,'String');
lang = string_list(val);


linkTextButton = uicontrol(languageSelectionFigure,'Style','pushbutton',...
        'Position',[scrsz(3)/(3*2)-125 scrsz(4)-200-150-50-200 250 100],...
        'BackgroundColor',colorOfFigureWindow);
      labelTop = '<HTML><center>No support for your language?';
      labelBot = '<HTML><center><FONT color="blue">How to implement a new language</FONT></center></HTML>';
    set(linkTextButton, 'string', [labelTop, '<br>', '<br>',labelBot]);
    set(linkTextButton,'Callback',@howTo_Callback);



confirmButton = uicontrol(languageSelectionFigure,'Style','pushbutton',...
        'String','OK',...
        'Position',[scrsz(3)/(3*2)-45 35 90 30]);
    set(confirmButton,'Callback','close');

selectedLanguageReminder = uicontrol(languageSelectionFigure,'Style','text',...
        'String', lang,...
        'ForegroundColor', [.5 .5 .5],...
        'Position',[scrsz(3)/3-120 1 120 20],...
        'BackgroundColor',colorOfFigureWindow);
       
uiwait()
   
langStruct.language = lang;
langStruct.value = val;
% write chosen language to default language textfile
csvwrite(dl_filename,val);

% -----------------------------------------------------------------------
% Executes when selecting a language
    function languageSelect_Callback(hObject, eventdata)
        val = get(hObject,'Value');
        string_list = get(hObject,'String');
        lang = string_list(val);
        set(selectedLanguageReminder,'String', lang);
    end 

    function howTo_Callback(hObject, eventdata)
         set(hObject,'Enable','inactive');
         web ../WMCBattery/HowToAddNewLanguage.html
         %web WMCBattery/HowToAddNewLanguage.html -browser
    end 

% % Executes when clicking the OK button
%     function [langStruct] = confirmButton_Callback(hObject, langStruct, eventdata)     
%         %language = langStruct.language;
%         %value = langStruct.value;
%         %display "FunctionOutput";
%         close 
%     end

end
