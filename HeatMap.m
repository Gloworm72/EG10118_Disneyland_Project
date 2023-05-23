function HeatMap(app)

% This program creates a heat map intended to be used in a matlab app

% Authors: Jack Blake, Andrew Cogndon
% April 17, 2023

% Close figures
close all

%% Load in Useful Data

% Visits to each attraction during each month of each year
attractionVisits = load('attractionPerMonth.mat');

month = app.MonthDropDown.Value;
switch month
    case 'January'
        month = 1;
    case 'February'
        month = 2;
    case 'March'
        month = 3;
    case 'April'
        month = 4;
    case 'May'
        month = 5;
    case 'June'
        month = 6;
    case 'July'
        month = 7;
    case 'August'
        month = 8;
    case 'September'
        month = 9;
    case 'October'
        month = 10;
    case 'November'
        month = 11;
    case 'December'
        month = 12;
end
year = str2double(app.YearDropDown.Value) - 2006;

% Make sure input is in correct time range
if ~((month < 8 && year == 1) || (month > 8 && year == 10))
    % Get rid of error label
    app.Label.Text = ' ';
    % Reference data
    load('projectDataReference.mat')
    
    % Set Latitude and Longitude of Attraction Locations
    
    % Latitude
    LAT = referenceList.lat(:);
    % Need to remove second row of data
    LAT(2) = [];
    % Longitude
    LON = referenceList.long(:);
    % Need to remove second row of data
    LON(2) = [];
    
    % Initialize a vector to hold the number of people at each attraction for
    % one month of one year
    CONC = zeros(30,1);
    % Create concentrations of people for a month
    for i = 1:length(CONC)
        CONC(i) = attractionVisits.attractionArray(month,year,i);
    end
    
    %% Different Color Bubbles Based on Magnitude
    
    % Create a color map
    color_map = [...
        1.0000    1.0000    0.0000; ... % bright yellow
        1.0000    0.9490    0.0000; ... % 
        1.0000    0.8980    0.0000; ... %
        1.0000    0.8471    0.0000; ... %
        1.0000    0.7961    0.0000; ... %
        1.0000    0.7451    0.0000; ... %
        1.0000    0.6941    0.0000; ... %
        1.0000    0.6431    0.0000; ... %
        1.0000    0.5922    0.0000; ... %
        1.0000    0.5412    0.0000; ... %
        1.0000    0.4902    0.0000; ... %
        1.0000    0.4392    0.0000; ... %
        1.0000    0.3882    0.0000; ... %
        1.0000    0.3373    0.0000; ... %
        1.0000    0.2863    0.0000; ... %
        1.0000    0.2353    0.0000; ... %
        1.0000    0.1843    0.0000; ... %
        1.0000    0.1333    0.0000; ... %
        1.0000    0.0824    0.0000; ... %
        1.0000    0.0314    0.0000; ... %
        0.9608    0.0000    0.0000; ... %
        0.9020    0.0000    0.0000; ... %
        0.8431    0.0000    0.0000; ... %
        0.7843    0.0000    0.0000; ... %
        0.7255    0.0000    0.0000; ... %
        0.6667    0.0000    0.0000; ... %
        0.6078    0.0000    0.0000; ... %
        0.5490    0.0000    0.0000; ... % bright red
        ];
    
    
    
    
    
    %% Mark Each Attraction Location as a Bubble
    
    fig = figure;
    
    % Set the figure to open in fullscreen
    set(fig, 'WindowState', 'maximized');
    % Use the geobubble function
    Plot = geobubble(LAT,LON,CONC,'BubbleColorList',color_map,'ColorData',categorical(CONC),'Basemap','satellite');
    Plot.Title = 'Disneyland Heat Map';
    Plot.BubbleWidthRange = [15 75];
    Plot.ColorLegendTitle = 'Concentration of People';
    Plot.SizeLegendTitle = 'Max Concentration Recorded';
else
    app.Label.Text = 'There is no data before August of 2007 or after August of 2016. Please input a new time period.';
end


