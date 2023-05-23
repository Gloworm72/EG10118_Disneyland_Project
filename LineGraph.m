function LineGraph(app)
%% This program creates a line graph intended to be used in a matlab app

% Authors: Jack Blake, Andrew Cogndon
% April 24, 2023

% Close figures
close all
%% Load data and retrieve app information

% Load in filtered data
load('projectData.mat')
[Nx,~] = size(mainData);

% Initialize x and y vectors for line graph
year = 2007:2016;
frequency = zeros(1,10);

% Read selected attraction from app
userAttraction = app.AttractionNameDropDown.Value;

%% Populate y vector with data from the user's selected attraction

for iRow = 1:Nx
    if strcmp(userAttraction,mainData.poiID(iRow))
        switch mainData.takenUnix.Year(iRow)
            case 2007
                frequency(1) = frequency(1)+1;
            case 2008
                frequency(2) = frequency(2)+1;
            case 2009
                frequency(3) = frequency(3)+1;
            case 2010
                frequency(4) = frequency(4)+1;
            case 2011
                frequency(5) = frequency(5)+1;
            case 2012
                frequency(6) = frequency(6)+1;
            case 2013
                frequency(7) = frequency(7)+1;
            case 2014
                frequency(8) = frequency(8)+1;
            case 2015
                frequency(9) = frequency(9)+1;
            case 2016
                frequency(10) = frequency(10)+1;
        end
    end
end

%% Plot line graph into app

plot(app.LineGraphUIAxes,year,frequency,'r--o')
xlabel(app.LineGraphUIAxes,'Year')
ylabel(app.LineGraphUIAxes,'Number of Visits')
grid(app.LineGraphUIAxes,'on')
title(app.LineGraphUIAxes,"Visits to " + userAttraction + " by year")
