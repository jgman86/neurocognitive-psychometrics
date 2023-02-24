classdef StartUp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        Menu                       matlab.ui.container.Menu
        SavetoFileMenu             matlab.ui.container.Menu
        ExitMenu                   matlab.ui.container.Menu
        OptionsPanel               matlab.ui.container.Panel
        StimTypeDropDown           matlab.ui.control.DropDown
        StimTypeDropDownLabel      matlab.ui.control.Label
        ShortExperimentCheckBox    matlab.ui.control.CheckBox
        RunPracticeTrialsCheckBox  matlab.ui.control.CheckBox
        TrialTypeDropDown          matlab.ui.control.DropDown
        TrialTypeDropDownLabel     matlab.ui.control.Label
        LanguageDropDown           matlab.ui.control.DropDown
        LanguageDropDownLabel      matlab.ui.control.Label
        SessionEditField           matlab.ui.control.NumericEditField
        SessionEditFieldLabel      matlab.ui.control.Label
        SubjectEditField           matlab.ui.control.NumericEditField
        SubjectEditFieldLabel      matlab.ui.control.Label
        CancelButton               matlab.ui.control.Button
        OkButton                   matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function: OkButton, UIFigure
        function UIFigureCloseRequest(app, event)
         
           
            delete(app)
           
        end

      % Value changed function: SubjectEditField
        function SubjectEditFieldValueChanged(app, event)
            value_subject = app.SubjectEditField.Value;

            global expinfo;
            expinfo.subject = value_subject;

        end

        % Value changed function: SessionEditField
        function SessionEditFieldValueChanged(app, event)
            value_session = app.SessionEditField.Value;

            global expinfo;
            expinfo.session = value_session;

        end

        % Value changed function: TrialTypeDropDown
        function TrialTypeDropDownValueChanged(app, event)
            value_TrialType = app.TrialTypeDropDown.Value;

            global expinfo;
            expinfo.TrialType = value_TrialType;

        end

        % Value changed function: LanguageDropDown
        function LanguageDropDownValueChanged(app, event)
            value_lan = app.LanguageDropDown.Value;

            global expinfo;
            expinfo.language = value_lan;

        end

        % Value changed function: LanguageDropDown_2
        function StimTypeDropDownValueChanged(app, event)
            value_stimtype = app.StimTypeDropdown.Value;

            global expinfo;
            expinfo.StimType = value_stimtype;

        end

        % Value changed function: RunPracticeTrialsCheckBox
        function RunPracticeTrialsCheckBoxValueChanged(app, event)
            value_prac = app.RunPracticeTrialsCheckBox.Value;

            global expinfo;
            expinfo.doPractice = value_prac;

        end

        % Value changed function: ShortExperimentCheckBox
        function ShortExperimentCheckBoxValueChanged(app, event)
            value_short = app.ShortExperimentCheckBox.Value;

            global expinfo;
            expinfo.isShort = value_short;

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 429 449];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.CloseRequestFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);

            % Create Menu
            app.Menu = uimenu(app.UIFigure);
            app.Menu.Text = 'Menu';

            % Create SavetoFileMenu
            app.SavetoFileMenu = uimenu(app.Menu);
            app.SavetoFileMenu.Text = 'Save to File';

            % Create ExitMenu
            app.ExitMenu = uimenu(app.Menu);
            app.ExitMenu.Text = 'Exit';

            % Create OkButton
            app.OkButton = uibutton(app.UIFigure, 'push');
            app.OkButton.ButtonPushedFcn = createCallbackFcn(app, @UIFigureCloseRequest, true);
            app.OkButton.Position = [36 19 88 25];
            app.OkButton.Text = 'Ok';

            % Create CancelButton
            app.CancelButton = uibutton(app.UIFigure, 'push');
            app.CancelButton.Position = [304 20 100 22];
            app.CancelButton.Text = 'Cancel';

            % Create SubjectEditFieldLabel
            app.SubjectEditFieldLabel = uilabel(app.UIFigure);
            app.SubjectEditFieldLabel.HorizontalAlignment = 'right';
            app.SubjectEditFieldLabel.Position = [36 370 55 22];
            app.SubjectEditFieldLabel.Text = 'Subject';

            % Create SubjectEditField
            app.SubjectEditField = uieditfield(app.UIFigure, 'numeric');
            app.SubjectEditField.ValueChangedFcn = createCallbackFcn(app, @SubjectEditFieldValueChanged, true);
            app.SubjectEditField.Position = [106 368 83 26];

            % Create SessionEditFieldLabel
            app.SessionEditFieldLabel = uilabel(app.UIFigure);
            app.SessionEditFieldLabel.HorizontalAlignment = 'right';
            app.SessionEditFieldLabel.Position = [37 319 55 22];
            app.SessionEditFieldLabel.Text = 'Session';

            % Create SessionEditField
            app.SessionEditField = uieditfield(app.UIFigure, 'numeric');
            app.SessionEditField.ValueChangedFcn = createCallbackFcn(app, @SessionEditFieldValueChanged, true);
            app.SessionEditField.Position = [107 317 82 26];

            % Create OptionsPanel
            app.OptionsPanel = uipanel(app.UIFigure);
            app.OptionsPanel.Title = 'Options';
            app.OptionsPanel.Position = [38 65 367 200];

            % Create LanguageDropDownLabel
            app.LanguageDropDownLabel = uilabel(app.OptionsPanel);
            app.LanguageDropDownLabel.HorizontalAlignment = 'right';
            app.LanguageDropDownLabel.Position = [14 106 65 22];
            app.LanguageDropDownLabel.Text = 'Language';

            % Create LanguageDropDown
            app.LanguageDropDown = uidropdown(app.OptionsPanel);
            app.LanguageDropDown.Items = {'German', 'English', ''};
            app.LanguageDropDown.ValueChangedFcn = createCallbackFcn(app, @LanguageDropDownValueChanged, true);
            app.LanguageDropDown.Tooltip = {'Select Desired Language'};
            app.LanguageDropDown.Position = [94 106 146 21];
            app.LanguageDropDown.Value = 'German';

            % Create TrialTypeDropDownLabel
            app.TrialTypeDropDownLabel = uilabel(app.OptionsPanel);
            app.TrialTypeDropDownLabel.HorizontalAlignment = 'right';
            app.TrialTypeDropDownLabel.Position = [13 142 65 22];
            app.TrialTypeDropDownLabel.Text = 'Trial Type';

            % Create TrialTypeDropDown
            app.TrialTypeDropDown = uidropdown(app.OptionsPanel);
            app.TrialTypeDropDown.Items = {'Pre Cue', 'Post Cue', 'Mixed Trials', ''};
            app.TrialTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @TrialTypeDropDownValueChanged, true);
            app.TrialTypeDropDown.Tooltip = {'Select Cue Condition'};
            app.TrialTypeDropDown.Placeholder = 'Select Cue Condition';
            app.TrialTypeDropDown.Position = [93 142 147 20];
            app.TrialTypeDropDown.Value = 'Pre Cue';

            % Create RunPracticeTrialsCheckBox
            app.RunPracticeTrialsCheckBox = uicheckbox(app.OptionsPanel);
            app.RunPracticeTrialsCheckBox.ValueChangedFcn = createCallbackFcn(app, @RunPracticeTrialsCheckBoxValueChanged, true);
            app.RunPracticeTrialsCheckBox.Text = 'Run Practice Trials';
            app.RunPracticeTrialsCheckBox.Position = [14 16 123 22];

            % Create ShortExperimentCheckBox
            app.ShortExperimentCheckBox = uicheckbox(app.OptionsPanel);
            app.ShortExperimentCheckBox.ValueChangedFcn = createCallbackFcn(app, @ShortExperimentCheckBoxValueChanged, true);
            app.ShortExperimentCheckBox.Text = 'Short Experiment';
            app.ShortExperimentCheckBox.Position = [151 16 115 22];

            % Create StimTypeDropDownLabel
            app.StimTypeDropDownLabel = uilabel(app.OptionsPanel);
            app.StimTypeDropDownLabel.HorizontalAlignment = 'right';
            app.StimTypeDropDownLabel.Position = [-1 72 81 22];
            app.StimTypeDropDownLabel.Text = 'Stimulus Type';

            % Create StimTypeDropDown
            app.StimTypeDropDown = uidropdown(app.OptionsPanel);
            app.StimTypeDropDown.Items = {'Verbal', 'Numerical', ''};
            app.StimTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @StimTypeDropDownValueChanged, true);
            app.StimTypeDropDown.Tooltip = {'Select Stimulus Domain'};
            app.StimTypeDropDown.Position = [95 72 146 21];
            app.StimTypeDropDown.Value = 'Verbal';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = app1

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end