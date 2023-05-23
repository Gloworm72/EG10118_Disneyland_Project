function PieChart(app)
% This program creates a pie chart intended to be used in a matlab app

% Authors: Jack Blake, Andrew Cogndon
% April 21, 2023

%% Load in Useful Data

% Visits to each attraction during each month of each year
attractionVisits = load('attractionPerMonth.mat');

month = app.PieMonthDropDown.Value;
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

    year = str2double(app.PieYearDropDown.Value) - 2006;
if ~((month < 8 && year == 1) || (month > 8 && year == 10))
    % Get rid of error label
    app.PieLabel.Text = ' ';
    % Reference data
    load('projectDataReference.mat')
    
    
    attNames = referenceList.poiName(:);
    attNames(2) = [];
    
    % Initialize a vector to hold the number of people at each attraction for
    % one month of one year
    CONC = zeros(30,1);
    % Create concentrations of people for a month
    for i = 1:length(CONC)
        CONC(i) = attractionVisits.attractionArray(month,year,i);
    end
    
    % Sort the attraction concentrations in descending order
    [sortedConc,idx]= sort(CONC,'descend');
    
    % Create vectors to hold the top 10 attraction conc. and names
    top10Conc = sortedConc(1:10);
    top10Names = attNames(idx(1:10));
    
    % Calculate the total concentration for all attractions outside of top 10
    otherConc = sum(sortedConc(11:end));
    
    % Add to top 10 concentrations
    top10Conc(11) = otherConc;
    top10Names{11} = 'Other';
    
    %% Create Pie Chart
    
    pie(app.PieUIAxes,top10Conc,top10Names);
    title(app.PieUIAxes,'Disneyland Rides')
else
app.PieLabel.Text = 'There is no data before August of 2007 or after August of 2016. Please input a new time period.';
end


