% read Semantischer Atlas, create word lists differing in concreteness and
% imageability, controlling for word length and word frequency
function [Highwords, Lowwords] = makewordlists(nwords, dfreq,dlength, expinfo)

stimfile = [expinfo.StimFolder 'semat_xl.xlsx'];
[numxls,charxls]=xlsread(stimfile);

wordclass = numxls(:,1); %1 = noun, 2 = adjective, 3 = verb
imag = numxls(wordclass==1,11);
concrete = numxls(wordclass==1,12);
meaning = numxls(wordclass==1,13);
freq = numxls(wordclass==1,14);
lgt = numxls(wordclass==1,15);
word = charxls(wordclass==1,2);

% nwords = 100; %desired number of words per list
% dfreq = 0.2;  %maximal difference between lists in mean frequency
% dlength = 0.5; %maximal difference between lists in mean length

imagc = imag + concrete;
[sorted, sortkey] = sort(imagc); %sorted is the sorted vector of imagec, sortkey is the index for getting all other vectors sorted in the same way

ok = 0;
highstart = length(imagc)-nwords-5;
lowend = 1+nwords+5;
giveup = 0;
while ok == 0
    
    Highkey = sortkey(highstart:800);  %selects candidate set of high-imagc words
    Lowkey = sortkey(1:lowend);        %same for low-imagc words
    highkey = sortkey(800-nwords:800);   %selects an initial subset of nwords high-imagc words
    lowkey = sortkey(1:nwords+1);        %same for low-imagc words
    %         Highlength = lgt(Highkey);
    %         Lowlength = lgt(Lowkey);
    %         Highfreq = freq(Highkey);
    %         Lowfreq = freq(Lowkey);
    
    for trial = 1:50
        Dfreq = mean(freq(highkey)) - mean(freq(lowkey));
        Dlgt = mean(lgt(highkey)) - mean(lgt(lowkey));
        if abs(Dfreq) < dfreq && abs(Dlgt) < dlength
            ok = 1;
            HK = highkey;
            LK = lowkey;
            break
        end
        if Dfreq > 0   %if mean frequency is higher in high than low -> replace max-freq in highkey and min-freq in lowkey
            elimfreqkey = find(freq(highkey) == max(freq(highkey)),1); %key into "highkey" for entry to eliminate
            %inclfreqkey = find(freq(Highkey) == min(freq(Highkey)),1); %key into "Highkey" for entry to include
            select = randperm(length(Highkey)-length(highkey));  %selects new word towards beginning of Highkey, in the overhead region
            inclfreqkey = select(1);
            temphighkey = highkey;
            temphighkey(elimfreqkey) = Highkey(inclfreqkey); %replacement
            if length(unique(temphighkey))==length(highkey), highkey = temphighkey; end %only if replacement does not create doublettes, do it
            elimfreqkey = find(freq(lowkey) == min(freq(lowkey)),1); %key into "lowkey" for entry to eliminate
            %inclfreqkey = find(freq(Lowkey) == max(freq(Lowkey)),1); %key into "Lowkey" for entry to include
            select = randperm(length(Lowkey)-length(lowkey));
            inclfreqkey = length(Lowkey)-(select(1)-1); %selects new word towards end of Lowkey, in the overhead region
            templowkey = lowkey;
            templowkey(elimfreqkey) = Lowkey(inclfreqkey); %replacement
            if length(unique(templowkey))==length(lowkey), lowkey = templowkey; end %only if replacement does not create doublettes, do it
        end
        if Dfreq < 0   %if mean frequency is lower in high than in low -> opposite
            elimfreqkey = find(freq(highkey) == min(freq(highkey)),1); %key into "highkey" for entry to eliminate
            %inclfreqkey = find(freq(Highkey) == max(freq(Highkey)),1); %key into "Highkey" for entry to include
            select = randperm(length(Highkey)-length(highkey));
            inclfreqkey = select(1);
            temphighkey = highkey;
            temphighkey(elimfreqkey) = Highkey(inclfreqkey); %replacement
            if length(unique(temphighkey))==length(highkey), highkey = temphighkey; end %only if replacement does not create doublettes, do it
            elimfreqkey = find(freq(lowkey) == max(freq(lowkey)),1); %key into "lowkey" for entry to eliminate
            %inclfreqkey = find(freq(Lowkey) == min(freq(Lowkey)),1); %key into "Lowkey" for entry to include
            select = randperm(length(Lowkey)-length(lowkey));
            inclfreqkey = length(Lowkey)-(select(1)-1);
            templowkey = lowkey;
            templowkey(elimfreqkey) = Lowkey(inclfreqkey); %replacement
            if length(unique(templowkey))==length(lowkey), lowkey = templowkey; end %only if replacement does not create doublettes, do it
        end
        if Dlgt > 0   %if mean length is higher in high than low -> replace max-lgt in highkey and min-lgt in lowkey
            elimlgtkey = find(lgt(highkey) == max(lgt(highkey)),1); %key into "highkey" for entry to eliminate
            %incllgtkey = find(lgt(Highkey) == min(lgt(Highkey)),1); %key into "Highkey" for entry to include
            select = randperm(length(Highkey)-length(highkey));
            incllgtkey = select(1);
            temphighkey = highkey;
            temphighkey(elimlgtkey) = Highkey(incllgtkey); %replacement
            if length(unique(temphighkey))==length(highkey), highkey = temphighkey; end %only if replacement does not create doublettes, do it
            elimlgtkey = find(lgt(lowkey) == min(lgt(lowkey)),1); %key into "lowkey" for entry to eliminate
            %incllgtkey = find(lgt(Lowkey) == max(lgt(Lowkey)),1); %key into "Lowkey" for entry to include
            select = randperm(length(Lowkey)-length(lowkey));
            incllgtkey = length(Lowkey)-(select(1)-1);
            templowkey = lowkey;
            templowkey(elimlgtkey) = Lowkey(incllgtkey); %replacement
            if length(unique(templowkey))==length(lowkey), lowkey = templowkey; end %only if replacement does not create doublettes, do it
        end
        if Dlgt < 0   %if mean length is lower in high than in low -> opposite
            elimlgtkey = find(lgt(highkey) == min(lgt(highkey)),1); %key into "highkey" for entry to eliminate
            %incllgtkey = find(lgt(Highkey) == max(lgt(Highkey)),1); %key into "Highkey" for entry to include
            select = randperm(length(Highkey)-length(highkey));
            incllgtkey = select(1);
            temphighkey = highkey;
            temphighkey(elimlgtkey) = Highkey(incllgtkey); %replacement
            if length(unique(temphighkey))==length(highkey), highkey = temphighkey;
            end %only if replacement does not create doublettes, do it
            elimlgtkey = find(lgt(lowkey) == max(lgt(lowkey)),1); %key into "lowkey" for entry to eliminate
            %incllgtkey = find(lgt(Lowkey) == min(lgt(Lowkey)),1); %key into "Lowkey" for entry to include
            select = randperm(length(Lowkey)-length(lowkey));
            incllgtkey = length(Lowkey)-(select(1)-1);
            templowkey = lowkey;
            templowkey(elimlgtkey) = Lowkey(incllgtkey); %replacement
            if length(unique(templowkey))==length(lowkey), 
                lowkey = templowkey; 
            end %only if replacement does not create doublettes, do it
        end
    end
    highstart = highstart - 5;
    lowend = lowend + 5;
    
    %     for trial = 1:500
    %         shuffle = randperm(800-highstart);
    %         highkey = Highkey(shuffle(1:nwords));  %selects random subset of nwords items from subset
    %         shuffle = randperm(lowend-1);
    %         lowkey = Lowkey(shuffle(1:nwords));
    %         Dfreq = abs(mean(freq(highkey)) - mean(freq(lowkey)));
    %         Dlength = abs(mean(lgt(highkey)) - mean(lgt(lowkey)));
    %         if Dfreq < dfreq && Dlength < dlength,
    %             ok = 1;
    %             HK = highkey;
    %             LK = lowkey;
    %         end
    %     end
    %     highstart = highstart-2; %includes 2 more words
    %     lowend = lowend+2;
    
    if highstart < 400 || lowend > 400, giveup = 1; ok = 1; end %when the ends cross over, quit and give up
    
end
giveup;
Frq = [freq(HK), freq(LK)];
Lgt = [lgt(HK), lgt(LK)];
Img = [imag(HK), imag(LK)];
Conc = [concrete(HK), concrete(LK)];
mean(Frq);
mean(Lgt);
mean(Img);
mean(Conc);
Lowwords = word(LK);
Highwords = word(HK);

for w = 1:size(Lowwords,1)
    for lh = 1:2
        if lh==1, word = Lowwords{w}; else word = Highwords{w};
        end
        Word = 'x';
        b = 1; %letter location in old word
        B = 1; %letter placement in new word
        while b <= length(word)
            Word(B) = word(b); %default
            if b < length(word)
                if word(b) == 'A' && word(b+1) == 'E', Word(B) = 'Ä'; b=b+1; 
                end
                if word(b) == 'O' && word(b+1) == 'E', Word(B) = 'Ö'; b=b+1; 
                end
                if word(b) == 'U' && word(b+1) == 'E', Word(B) = 'Ü'; b=b+1; 
                end
            end
            b=b+1;
            B=B+1;
        end
        if strcmp(Word,'TREÜ'), Word = 'TREUE'; 
        end
        if strcmp(Word,'DAÜR'), Word = 'DAUER';
        end
        if strcmp(Word, 'MORGENGRAÜN'), Word = 'MORGENGRAUEN';
        end
        Word = lower(Word);
        Word(1) = upper(Word(1));
        if lh==1, Lowwords{w} = Word; else Highwords{w} = Word;
        
        end
       
        if strcmp(Word, 'Fortdaür')
            
            eliminate = w; 
        
        end
    end
end
%Lowwords(eliminate) = [];

save Wordsets Highwords Lowwords HK LK Frq Lgt Img Conc
end