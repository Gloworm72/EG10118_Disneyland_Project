%% dataReader.m
% Imports data from the excel file Disneyland_Data.xlsx and processes the
% data by removing duplicate data, converting from unix timestamps, and
% replacing poiID with the strings found in the reference sheet

% This file saves the files projectDataReference.mat and projectData.mat,
% which are referenced by the functions in our app. It is intended to be
% executed before the app is executed, but we have also provided the
% outputs from this file in the Google drive.


%  Authors: Jack Blake, Andrew Cogndon
%  March 28, 2023

%  Clear Workspace
clear

%  Clear Command Window
clc

%% Load data using readtable

mainData = readtable('Disneyland_Data.xlsx','sheet','userVisits-disland-allPOI');
referenceList = readtable('Disneyland_Data.xlsx','sheet','POI-disland');
% Creates a table (acts like a structure)

%% Convert unix to normal time and sort from oldest to newest

% Converts to the datetime data type
mainData.takenUnix = datetime(mainData.takenUnix,'ConvertFrom','posixtime');
% Sort by sequence ID
mainData = sortrows(mainData,"seqID","ascend");

%% Delete duplicate data (multiple pictures taken by the same person at the same time and location)

% Find size of data
[numRow,~] = size(mainData);
% Set maximum time difference between pictures to count as seperate visits
maxDuration = duration(8,0,0);
% Convert column from table to cells in order to swap double with chars
mainData.poiID = num2cell(mainData.poiID);

%Initialize starting row
iRow = 1;
% Perform while loop to check if the next row is the same ride and same
% userID, while also being taken in less time apart from each other than
% the max time apart set above. If so, it deletes that next row, and
% subtracts 1 row from the total rows for the data. If the conditional was
% not true, then it simply increases iRow by one to evaluate the next pair
% of rows.
while iRow < numRow
    if isequal(mainData.nsid{iRow}, mainData.nsid{iRow+1}) && (isequal(mainData.poiID{iRow},mainData.poiID{iRow+1}) && ((mainData.takenUnix(iRow+1) - mainData.takenUnix(iRow)) < (maxDuration)))
        mainData(iRow+1,:) = [];
        numRow = numRow-1;
    else
        iRow = iRow + 1;
    end
end



%% Swap POI Number for Attraction Name

% Find size of data
[numRow,~] = size(mainData);

% Use for loop and switch statement to go through every data point and
% check its value
for iRow = 1:numRow
    switch mainData.poiID{iRow}
        case 1
            mainData.poiID{iRow} = 'Gadget''s Go Coaster';
        case 2
            mainData.poiID{iRow} = 'Astro Orbitor';
        case 3
            mainData.poiID{iRow} = 'Mad Tea Party';
        case 4
            mainData.poiID{iRow} = 'Dumbo the Flying Elephant';
        case 5
            mainData.poiID{iRow} = 'Mr. Toad''s Wild Ride';
        case 6
            mainData.poiID{iRow} = 'Snow White''s Scary Adventures';
        case 7
            mainData.poiID{iRow} = 'King Arthur Carrousel';
        case 8
            mainData.poiID{iRow} = 'Peter Pan''s Flight';
        case 9
            mainData.poiID{iRow} = 'Pinocchio''s Daring Journey';
        case 10
            mainData.poiID{iRow} = 'Alice in Wonderland';
        case 11
            mainData.poiID{iRow} = 'Casey Jr. Circus Train';
        case 12
            mainData.poiID{iRow} = 'Matterhorn Bobsleds';
        case 13
            mainData.poiID{iRow} = 'Roger Rabbit''s Car Toon Spin';
        case 14
            mainData.poiID{iRow} = 'The Many Adventures of Winnie the Pooh';
        case 15
            mainData.poiID{iRow} = 'Autopia';
        case 16
            mainData.poiID{iRow} = 'Buzz Lightyear Astro Blasters';
        case 17
            mainData.poiID{iRow} = 'Hyperspace Mountain';
        case 18
            mainData.poiID{iRow} = 'Jungle Cruise';
        case 19
            mainData.poiID{iRow} = 'Tarzan''s Treehouse';
        case 20
            mainData.poiID{iRow} = 'Haunted Mansion';
        case 21
            mainData.poiID{iRow} = 'Storybook Land Canal Boats';
        case 22
            mainData.poiID{iRow} = 'Davy Crockett''s Explorer Canoes';
        case 23
            mainData.poiID{iRow} = 'Indiana Jones Adventure';
        case 24
            mainData.poiID{iRow} = 'Finding Nemo Submarine Voyage';
        case 25
            mainData.poiID{iRow} = 'It''s A Small World';
        case 26
            mainData.poiID{iRow} = 'Sleeping Beauty Castle Walkthrough';
        case 27
            mainData.poiID{iRow} = 'Star Tours';
        case 28
            mainData.poiID{iRow} = 'Main Street Cinema';
        case 29
            mainData.poiID{iRow} = 'Pirates of the Caribbean';
        case 30
            mainData.poiID{iRow} = 'Mark Twain Riverboat';
        case 31
            mainData.poiID{iRow} = 'Fantasmic!';
    end
end

% Sort again by increasing time
mainData = sortrows(mainData,"takenUnix","ascend");

% Save data as .mat file
save('projectData.mat','mainData')
save('projectDataReference','referenceList')
