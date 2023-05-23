function barGraph(app)
%% This program creates a bar graph intended to be used in a matlab app

% Authors: Jack Blake, Andrew Cogndon
% April 24, 2023

% Close figures
close all
%% Load data and retrieve app information

% Load in filtered data
load('AttractionOrderCell.mat')

% Read user's parameters from app
orderNumber = app.AttractionOrderEditField.Value;
nBars = app.NumberofBarsShownEditField.Value;

%% Initialize vector of values to graph

attractionFrequency = zeros(2,31);
nX = length(attractionNumber{orderNumber});

%% Count how many times each attraction appears in user selected cell
for iRow = 1:nX
    switch attractionNumber{orderNumber}{iRow}
        case 'Gadget''s Go Coaster'
            attractionFrequency(1,1) = attractionFrequency(1,1)+1;
        case 'Astro Orbitor'
            attractionFrequency(1,2) = attractionFrequency(1,2)+1;
        case 'Mad Tea Party'
            attractionFrequency(1,3) = attractionFrequency(1,3)+1;
        case 'Dumbo the Flying Elephant'
            attractionFrequency(1,4) = attractionFrequency(1,4)+1;
        case 'Mr. Toad''s Wild Ride'
            attractionFrequency(1,5) = attractionFrequency(1,5)+1;
        case 'Snow White''s Scary Adventures'
            attractionFrequency(1,6) = attractionFrequency(1,6)+1;
        case 'King Arthur Carrousel'
            attractionFrequency(1,7) = attractionFrequency(1,7)+1;
        case 'Peter Pan''s Flight'
            attractionFrequency(1,8) = attractionFrequency(1,8)+1;
        case 'Pinocchio''s Daring Journey'
            attractionFrequency(1,9) = attractionFrequency(1,9)+1;
        case 'Alice in Wonderland'
            attractionFrequency(1,10) = attractionFrequency(1,10)+1;
        case 'Casey Jr. Circus Train'
            attractionFrequency(1,11) = attractionFrequency(1,11)+1;
        case 'Matterhorn Bobsleds'
            attractionFrequency(1,12) = attractionFrequency(1,12)+1;
        case 'Roger Rabbit''s Car Toon Spin'
            attractionFrequency(1,13) = attractionFrequency(1,13)+1;
        case 'The Many Adventures of Winnie the Pooh'
            attractionFrequency(1,14) = attractionFrequency(1,14)+1;
        case 'Autopia'
            attractionFrequency(1,15) = attractionFrequency(1,15)+1;
        case 'Buzz Lightyear Astro Blasters'
            attractionFrequency(1,16) = attractionFrequency(1,16)+1;
        case 'Hyperspace Mountain'
            attractionFrequency(1,17) = attractionFrequency(1,17)+1;
        case 'Jungle Cruise'
            attractionFrequency(1,18) = attractionFrequency(1,18)+1;
        case 'Tarzan''s Treehouse'
            attractionFrequency(1,19) = attractionFrequency(1,19)+1;
        case 'Haunted Mansion'
            attractionFrequency(1,20) = attractionFrequency(1,20)+1;
        case 'Storybook Land Canal Boats'
            attractionFrequency(1,21) = attractionFrequency(1,21)+1;
        case 'Davy Crockett''s Explorer Canoes'
            attractionFrequency(1,22) = attractionFrequency(1,22)+1;
        case 'Indiana Jones Adventure'
            attractionFrequency(1,23) = attractionFrequency(1,23)+1;
        case 'Finding Nemo Submarine Voyage'
            attractionFrequency(1,24) = attractionFrequency(1,24)+1;
        case 'It''s A Small World'
            attractionFrequency(1,25) = attractionFrequency(1,25)+1;
        case 'Sleeping Beauty Castle Walkthrough'
            attractionFrequency(1,26) = attractionFrequency(1,26)+1;
        case 'Star Tours'
            attractionFrequency(1,27) = attractionFrequency(1,27)+1;
        case 'Main Street Cinema'
            attractionFrequency(1,28) = attractionFrequency(1,28)+1;
        case 'Pirates of the Caribbean'
            attractionFrequency(1,29) = attractionFrequency(1,29)+1;
        case 'Mark Twain Riverboat'
            attractionFrequency(1,30) = attractionFrequency(1,30)+1;
        case 'Fantasmic!'
            attractionFrequency(1,31) = attractionFrequency(1,31)+1;
    end
end

%% Formatting and sorting
% Convert to cell array so strings can be added
attractionFrequency = num2cell(attractionFrequency);

% Add attraction names in corresponding columns
attractionFrequency{2,1} = 'Gadget''s Go Coaster';
attractionFrequency{2,2} = 'Astro Orbitor';
attractionFrequency{2,3} = 'Mad Tea Party';
attractionFrequency{2,4} = 'Dumbo the Flying Elephant';
attractionFrequency{2,5} = 'Mr. Toad''s Wild Ride';
attractionFrequency{2,6} = 'Snow White''s Scary Adventures';
attractionFrequency{2,7} = 'King Arthur Carrousel';
attractionFrequency{2,8} = 'Peter Pan''s Flight';
attractionFrequency{2,9} = 'Pinocchio''s Daring Journey';
attractionFrequency{2,10} = 'Alice in Wonderland';
attractionFrequency{2,11} = 'Casey Jr. Circus Train';
attractionFrequency{2,12} = 'Matterhorn Bobsleds';
attractionFrequency{2,13} = 'Roger Rabbit''s Car Toon Spin';
attractionFrequency{2,14} = 'The Many Adventures of Winnie the Pooh';
attractionFrequency{2,15} = 'Autopia';
attractionFrequency{2,16} = 'Buzz Lightyear Astro Blasters';
attractionFrequency{2,17} = 'Hyperspace Mountain';
attractionFrequency{2,18} = 'Jungle Cruise';
attractionFrequency{2,19} = 'Tarzan''s Treehouse';
attractionFrequency{2,20} = 'Haunted Mansion';
attractionFrequency{2,21} = 'Storybook Land Canal Boats';
attractionFrequency{2,22} = 'Davy Crockett''s Explorer Canoes';
attractionFrequency{2,23} = 'Indiana Jones Adventure';
attractionFrequency{2,24} = 'Finding Nemo Submarine Voyage';
attractionFrequency{2,25} = 'It''s A Small World';
attractionFrequency{2,26} = 'Sleeping Beauty Castle Walkthrough';
attractionFrequency{2,27} = 'Star Tours';
attractionFrequency{2,28} = 'Main Street Cinema';
attractionFrequency{2,29} = 'Pirates of the Caribbean';
attractionFrequency{2,30} = 'Mark Twain Riverboat';
attractionFrequency{2,31} = 'Fantasmic!';

% User defined function to show only the number of bars requested by the user
sortFrequency = sortAndFilter(attractionFrequency,nBars);

%% Graphing in app

% Extract first row from cell array
x = sortFrequency(1,:);
% Change to vector so x can be read by bar()
x = cell2mat(x);

% Plot bar graph
bar(app.BarGraphUIAxes,x)
set(app.BarGraphUIAxes,'xticklabel',sortFrequency(2,:))
title(app.BarGraphUIAxes,"Attraction number " + orderNumber + " in guests' sequence")
xlabel(app.BarGraphUIAxes,"Attractions")
ylabel(app.BarGraphUIAxes,"Number of Visits")