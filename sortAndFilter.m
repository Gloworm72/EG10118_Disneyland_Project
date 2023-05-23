function [myCell] = sortAndFilter(myCell,nOutputs)
% This function bubble sorts a 2xM cell array in descending order according
% to the first row, keeping the columns intact and grouping the Nth element
% as the cumulative total of the unused values, where N is the value of
% nOutputs

% INPUTS - myCell: a 2xM cell array with numeric values in the first row
%          nOutputs: represents the number of columns N that will be in the output cell array

% OUTPUTS - myCell: a 2xN cell array that includes N-1 columns of the
%           input myCell in descending order according to row 1, and in the
%           Nth column a cumulative total of unused values from the input
%           myCell

% Authors: Jack Blake, Andrew Cogndon
% April 24, 2023

% This file was created using the bubble sorting instructor example as a
% starting point

%% Sorting from largest to smallest
% Create a logical variable that will continue to run the WHILE loop until
% the cell array is actually sorted.
    done = false;
    Nv = length(myCell);
% Use a while loop to continue to repeat the bubble sorting algorithm until
% there is a round where no numbers are swapped. If this is the case, then
% the values in the vector are all sorted
    while ~done
    % Initialize the nubmer of swaps to be zero.
        nswaps = 0;
    % Use a FOR loop to cycle through each column in the cell array (not
    % including the last column since we will be comparing each column to
    % the next column).
        for k = 1:Nv-1
            % Compare the column to the next one. Swap if the second one is
            % larger
            if myCell{1,k+1} > myCell{1,k}
                % temporarily store the next column
                tempFreq = myCell{1,k+1};
                tempAttraction = myCell{2,k+1};
                % move the current column to the next column
                myCell{1,k+1} = myCell{1,k};
                myCell{2,k+1} = myCell{2,k};
                % set the current column to the temporary variables
                myCell{1,k} = tempFreq;
                myCell{2,k} = tempAttraction;
                nswaps = nswaps + 1;
            end
        end
        % If there is a round that doesn't have any swaps, then the sorting
        % is done
        if nswaps == 0
        % Change the value of done
        done = true;
        end
    end
%% Condensing array to desired number of columns
    % Initialize a cumulative variable
    other = 0;
    % Start counting after last column to keep, adding up all the values
    for i = nOutputs:Nv
        other = other + myCell{1,i};
    end
    % Reassign cumulative variable to the last column
    myCell{1,nOutputs} = other;
    myCell{2,nOutputs} = 'other';
    % Delete all other rows
    myCell(:,nOutputs+1:Nv) = [];
end