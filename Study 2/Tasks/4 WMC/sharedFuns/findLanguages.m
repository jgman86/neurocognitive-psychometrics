function [langlist] = findLanguages()
%LANGUAGEDIR Summary of this function goes here
%   Detailed explanation goes here
    iDir = strcat('.\LANGUAGES\');
   langlist = ls(iDir);
   langlist(1:2,:)=[];
end

