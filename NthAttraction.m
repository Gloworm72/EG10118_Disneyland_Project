%% NthAttraction.m

% This file creates a cell array of attraction names broken down by where
% they appear in guests' order sequence, defined by the seqID column in our
% table

% This file saves the file attractionOrderCell.mat, which is referenced by 
% the barGraph.m function in our app. It is intended to be executed after
%  dataReader.m is executed but before the app is executed, but we have
% also provided the outputs from this file in the Google drive.

%  Authors: Jack Blake, Andrew Cogndon
%  March 28, 2023

clear
clc

%% Load and sort data
load("projectData.mat")

sortData = sortrows(mainData,'seqID','ascend');
[Nx,~] = size(sortData);

%% Create cell array broken down by sequence number
attractionNumber = {};
% Fill each cell with a list of each user's nth attraction visited, where n
% is the index in the cell array
for iCounter = 1:20
    counter = iCounter;
    attractionNumber(iCounter) = {[]};
    for iRow = 1:Nx-1
        if counter == 1
            attractionNumber{iCounter} = [attractionNumber{iCounter}, sortData.poiID(iRow)];
        end
        counter = counter-1;
        if sortData.seqID(iRow+1) ~= sortData.seqID(iRow)
            counter = iCounter;
        end
   end
end

% Must manually add last attraction to cell array since for loop relies on
% comparing each value to the next value, which is impossible for the last
% one
attractionNumber{3}(2851) = sortData.poiID(Nx);

%% Save to export to barGraph.m
save('AttractionOrderCell','attractionNumber')