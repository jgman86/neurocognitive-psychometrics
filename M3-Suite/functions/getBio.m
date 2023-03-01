%% This function helps to digitalize biographical information about the participants of an experiment.
% Written by JG

function expinfo = getBio(expinfo)
% Open prompt with Input fields. If additional input is needed, adjust
% promt and file input.
prompt = {'Name','Vorname','Alter:','Geschlecht (m/w):','Studienfach:', 'Links- oder Rechtshänder:','Haben Sie das Experiment gewissenhaft bearbeitet (es ensteht kein Nachteil für Sie)','E-Mail (freiwillige Angabe)'};
title = 'Biografische Informationen';
dims = [1 50];
answer = inputdlg(prompt,title,dims);
expinfo.subjectbio.Number = expinfo.subject;
expinfo.subjectbio.Name = answer{1}; 
expinfo.subjectbio.FirstName = answer{2}; 
expinfo.subjectbio.Age = str2double(answer{3});
expinfo.subjectbio.Sex = answer{4};
expinfo.subjectbio.Occupation = answer{5};
expinfo.subjectbio.Hand = answer{6};
expinfo.subjectbio.conscientiousness = answer{7};
expinfo.subjectbio.Contact = answer{8};

% Open bio file and write subject info in the next line
fid = fopen(expinfo.bFile,'a'); 
fprintf(fid, '%d %s ', expinfo.subjectbio.Number,',');
fprintf(fid, '%s %s  ', expinfo.subjectbio.Name,',');
fprintf(fid, '%s %s ', expinfo.subjectbio.FirstName,',');
fprintf(fid, '%d %s ', expinfo.subjectbio.Age,',');
fprintf(fid, '%c %s ', expinfo.subjectbio.Sex,',');
fprintf(fid, '%s %s  ', expinfo.subjectbio.Occupation,',');
fprintf(fid, '%s %s ', expinfo.subjectbio.Hand,',');
fprintf(fid, '%s %s ', expinfo.subjectbio.conscientiousness,',');
fprintf(fid, '%s %s ', expinfo.subjectbio.Contact,',');
fprintf (fid, '\n');
fclose(fid);
end