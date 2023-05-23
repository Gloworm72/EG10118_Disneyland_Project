% HeatMapDataClean.m
% This program organizes data for the heat map

% This file saves the files totalVisitsPerMonth.mat,
% attractionPerMonth.mat, and attractionPercentPerMonth.mat which are 
% referenced by the HeatMap.m function and the PieChart.m function in our
% app. It is intended to be executed after dataReader.m is executed but 
% before the app is executed, but we have also provided the outputs from
% this file in the Google drive.

% Authors: Jack Blake, Andrew Cogndon
% March 28, 2023

% Clear Workspace
clear

% Clear Command Window
clc

%% Load in data

load('projectData.mat');

load('projectDataReference.mat')

%% Average data points for months within years

% Find size of data
[numRow,numCol] = size(mainData);
[numRefRow,numRefCol] = size(referenceList);

% Initialize array for months and year (2007 - 2016)
arrayYearMonths = zeros(12,10);

% Initialize array for each attraction for each month of each year
% (Month,Year,Attraction POI)
attractionArray = zeros(12,10,31);

% Use for loop and if statements to update both arrays
for irow = 1:numRow
    for iYear = 2007:2016
        if year(mainData.takenUnix(irow)) == iYear
           for iMonth = 1:12
               if month(mainData.takenUnix(irow)) == iMonth
                   arrayYearMonths(iMonth,iYear-2006) = arrayYearMonths(iMonth,iYear-2006) + 1;
                   for iAtr = 1:numRefRow
                       if strcmp(mainData.poiID{irow},referenceList.poiName{iAtr})
                           attractionArray(iMonth,iYear-2006,iAtr) = attractionArray(iMonth,iYear-2006,iAtr) + 1;
                       end
                   end
               end
           end
        end
    end
end

%% Find percentage of visitors at each attraction for each month

% Initialize array to turn values in the attractionArray into percentage of
% visitors at that attraction for that month
attractionPercentArray = zeros(12,10,31);
% Use for loop to find percentage of visotors at each attraction for each
% month
for iMonth = 1:12
    for iYear = 1:10
        for iAtr = 1:numRefRow
            attractionPercentArray(iMonth,iYear,iAtr) = attractionArray(iMonth,iYear,iAtr)/arrayYearMonths(iMonth,iYear);
        end
    end
end

% Delete the second attraction (since it's empty)
attractionPercentArray(:,:,2) = [];
attractionArray(:,:,2) = [];

% Store new arrays
save('totalVisitsPerMonth.mat','arrayYearMonths')
save('attractionPerMonth.mat','attractionArray')
save('attractionPercentPerMonth.mat','attractionPercentArray')


    
