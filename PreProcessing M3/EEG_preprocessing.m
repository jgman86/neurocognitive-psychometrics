eeglab

%%
PATH_MAIN = 'F:\EEG Pilotirerung M3/';

PATH_RAW_DATA = [PATH_MAIN, 'rawdata/'];
PATH_ICWEIGHTS = [PATH_MAIN, 'icweights/'];
PATH_AUTOCLEANED = [PATH_MAIN, 'autocleaned/'];
PATH_CHANREJECT = [PATH_MAIN, 'badchannels/'];
PATH_EPOCHREJECT = [PATH_MAIN, 'badepochs/'];
PATH_BADICS = [PATH_MAIN, 'badics/'];

% define basic parameters

n_subs = 6;

%% ======================= PART1: PREPROCESS DATA ===================================================================================================

for i = 6:n_subs
    
    
    
    if i < 10
        datafile = ['M3_Verbal_000' num2str(i) '.vhdr'];
    elseif i >= 10 && i < 100
        datafile = ['M3_Verbal_00' num2str(i) '.vhdr'];
    elseif i >= 100
        datafile = ['M3_Verbal_0' num2str(i) '.vhdr'];
    end
    
    if i == 6
        datafile = ['M3_Verbal_000' num2str(i) '_2.vhdr'];
    end
    
    if isfile([PATH_RAW_DATA datafile]) == 1
        
        % load data
        EEG =  pop_loadbv(PATH_RAW_DATA, datafile, [], []);
        
        EEG.eog_chans = [31 62 63]; % nochmal checken
        EEG.eog_chans_n = length(EEG.eog_chans);
        
        % Define stimulus events
        cue_events = {'S 41', 'S 42','S 43', 'S 44'};
        serial_position_events = {'S 20', 'S 21', 'S 22', 'S 23', 'S 24', 'S 25', 'S 26', 'S 27', 'S 28', 'S 29'};
        corr_secondary_task_events = {'S 71'};
        IIP_event = {'S 81'};
        IOP_event = {'S 82'};
        DIP_event = {'S 83'};
        DIOP_event = {'S 84'};
        NLP_event = {'S 85'};
%         ret_event = {'S 32'};
%         fix_event = {'S 31'};
        
        % Find indices
%         stimidx = find(ismember({EEG.event.type}, fix_event));
        
        
       % Find indices
      stimidx = find(ismember({EEG.event.type}, cue_events));        
        
        % Code events into event file
        for e = 1 : length(stimidx)
            if ismember(EEG.event(stimidx(e)+2).type, corr_secondary_task_events) && ...
                    (EEG.event(stimidx(e)+2).latency - EEG.event(stimidx(e)+1).latency >= 150)
                
                % code memory vs. distractor cue
                if ismember(EEG.event(stimidx(e)).type, cue_events(1:2))
                    EEG.event(stimidx(e)).cue_type = 'cue_dist';
                elseif ismember(EEG.event(stimidx(e)).type, cue_events(3:4))
                    EEG.event(stimidx(e)).cue_type = 'cue_mem';
                end
                
                % code serial position
                if ismember(EEG.event(stimidx(e)-2).type, serial_position_events(1))
                    EEG.event(stimidx(e)).serial_position = 1;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(2))
                    EEG.event(stimidx(e)).serial_position = 2;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(3))
                    EEG.event(stimidx(e)).serial_position = 3;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(4))
                    EEG.event(stimidx(e)).serial_position = 4;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(5))
                    EEG.event(stimidx(e)).serial_position = 5;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(6))
                    EEG.event(stimidx(e)).serial_position = 6;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(7))
                    EEG.event(stimidx(e)).serial_position = 7;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(8))
                    EEG.event(stimidx(e)).serial_position = 8;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(9))
                    EEG.event(stimidx(e)).serial_position = 9;
                elseif ismember(EEG.event(stimidx(e)-2).type, serial_position_events(10))
                    EEG.event(stimidx(e)).serial_position = 10;
                end
                
               EEG.event(stimidx(e)).type = 'cue';
                
                % code recall response (commented for now, to-do for future
                % Jan and Anna-Lena)
%                 if EEG.event.serial_position ==  1 && ismember(EEG.event(stimidx(e)+60).type, IIP_event)
%                     EEG.event.recall = 'IIP';
%                 elseif EEG.event.serial_position ==  1 && ismember(EEG.event(stimidx(e)+60).type, DIP_event)
%                     EEG.event.recall = 'DIP';
%                 elseif EEG.event.serial_position ==  1 && ismember(EEG.event(stimidx(e)+60).type, DIOP_event)
%                     EEG.event.recall = 'DIOP';
%                 elseif EEG.event.serial_position ==  1 && ismember(EEG.event(stimidx(e)+60).type, IOP_event)
%                     EEG.event.recall = 'IOP';
%                 elseif EEG.event.serial_position ==  1 && ismember(EEG.event(stimidx(e)+60).type, NPL_event)
%                     EEG.event.recall = 'NPL';
%                 end
            end
        end
        
        % create ICA dataset
        ICA = EEG;
        
        % copy original chanlocs
        chanlocs_orginal = EEG.chanlocs;
        
        % resample
        EEG = pop_resample(EEG, 500);
        ICA = pop_resample(ICA, 200);
        
        % Bandpass filter data (ERPlab toolbox function)
        EEG = pop_basicfilter(EEG, [1 : EEG.nbchan], 'Cutoff', [0.1, 40], 'Design', 'butter', 'Filter', 'bandpass', 'Order', 2, 'RemoveDC', 'on', 'Boundary', 'boundary');
        ICA = pop_basicfilter(ICA, [1 : EEG.nbchan], 'Cutoff', 1, 'Design', 'butter', 'Filter', 'highpass', 'Order', 2, 'RemoveDC', 'on', 'Boundary', 'boundary');
        
        % Bad channel detection EEG  on base of filltering
        [EEG, i1] = pop_rejchan(EEG, 'elec', [1 : EEG.eog_chans(1)-1 EEG.eog_chans(1)+1:(EEG.nbchan-EEG.eog_chans_n+1)], 'threshold', 10, 'norm', 'on', 'measure', 'kurt'); % ALS: check if channels are coded according to EOG position
        [EEG, i2] = pop_rejchan(EEG, 'elec', [1 : EEG.eog_chans(1)-1 EEG.eog_chans(1)+1:(EEG.nbchan-EEG.eog_chans_n+1)], 'threshold', 5, 'norm', 'on', 'measure', 'prob'); % ALS: check if channels are coded according to EOG position
        rejected_channels = horzcat(i1, i2);
        EEG.rejected_channels = horzcat(i1, i2);
        EEG.chans_rejected_n = length(horzcat(i1, i2));
        
        csvwrite([PATH_CHANREJECT 'BadChannels_EEG_' num2str(i) '.csv' ],  rejected_channels)
        
        
        % Bad channel detection ICA on base of filltering
        [ICA, i3] = pop_rejchan(ICA, 'elec', [1 : ICA.eog_chans(1)-1 ICA.eog_chans(1)+1:(EEG.nbchan-EEG.eog_chans_n+1)], 'threshold', 10, 'norm', 'on', 'measure', 'kurt'); % ALS: check if channels are coded according to EOG position
        [ICA, i4] = pop_rejchan(ICA, 'elec', [1 : ICA.eog_chans(1)-1 ICA.eog_chans(1)+1:(EEG.nbchan-EEG.eog_chans_n+1)], 'threshold', 5, 'norm', 'on', 'measure', 'prob');  % ALS: check if channels are coded according to EOG position
        rejected_channels = horzcat(i3, i4);
        ICA.rejected_channels = horzcat(i3, i4);
        ICA.chans_rejected_n = length(horzcat(i3, i4));
        
        csvwrite([PATH_CHANREJECT 'BadChannels_ICA_' num2str(i) '.csv' ],  rejected_channels)
        
        % Interpolate data channels
        EEG = pop_interp(EEG, chanlocs_orginal, 'spherical');
        ICA = pop_interp(ICA, chanlocs_orginal, 'spherical');
        
        % re-reference data
        
        EEG = pop_chanedit(EEG, 'append',EEG.nbchan,'changefield',{EEG.nbchan+1 'labels' 'Cz'},'changefield',{EEG.nbchan+1 'sph_theta' '0'},'changefield',{EEG.nbchan+1 'sph_phi' '90'},'changefield',{EEG.nbchan+1 'sph_radius' '85'},'convert',{'sph2all'});
        EEG = pop_chanedit(EEG, 'setref',{'1:63' 'Cz'});
        
        ICA = pop_chanedit(ICA, 'append',ICA.nbchan,'changefield',{ICA.nbchan+1 'labels' 'Cz'},'changefield',{ICA.nbchan+1 'sph_theta' '0'},'changefield',{ICA.nbchan+1 'sph_phi' '90'},'changefield',{ICA.nbchan+1 'sph_radius' '85'},'convert',{'sph2all'});
        ICA = pop_chanedit(ICA, 'setref',{'1:63' 'Cz'});
        
         %average reference
        EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'sph_radius',{85},'sph_theta',{0},'sph_phi',{90},'theta',{0},'radius',{0},'X',{5.2047e-15},'Y',{0},'Z',{85},'type',{''},'ref',{'Cz'},'urchan',{[]},'datachan',{0},'sph_theta_besa',{0},'sph_phi_besa',{90}));
        ICA = pop_reref( ICA, [],'refloc',struct('labels',{'Cz'},'sph_radius',{85},'sph_theta',{0},'sph_phi',{90},'theta',{0},'radius',{0},'X',{5.2047e-15},'Y',{0},'Z',{85},'type',{''},'ref',{'Cz'},'urchan',{[]},'datachan',{0},'sph_theta_besa',{0},'sph_phi_besa',{90}));
        
        % check data rank
        dataRank = sum(eig(cov(double(ICA.data'))) > 1E-6);
        
        % Epoch both datasets
        EEG = pop_epoch(EEG, {'cue'}, [-1, 3], 'newname', [subject '_cueseg'], 'epochinfo', 'yes');
        ICA = pop_epoch(ICA, {'cue'},[-1, 3], 'newname', [subject '_cueseg'], 'epochinfo', 'yes');
        
        % Detect artifacted epochs ICA
        
        ICA_segs_orginal_n = size(ICA.data, 3);
        thresh = 1000;
        prob = 5;
        maxr = 5;
        [ICA, rejected_segments_ICA] = pop_autorej(ICA, 'nogui', 'on', 'threshold',thresh, 'electrodes', [1 : ICA.eog_chans(1)-1 ICA.eog_chans(1)+1:(EEG.nbchan-EEG.eog_chans_n+1), EEG.nbchan],'startprob', prob, 'maxrej', maxr, 'eegplot','off');
        
        %csvwrite([PATH_EPOCHREJECT 'BadSegmentsEEG_' num2str(i) '.csv' ],  rejected_segments_EEG)
        csvwrite([PATH_EPOCHREJECT 'BadSegmentsICA_' num2str(i) '.csv' ],  rejected_segments_ICA)
    end
