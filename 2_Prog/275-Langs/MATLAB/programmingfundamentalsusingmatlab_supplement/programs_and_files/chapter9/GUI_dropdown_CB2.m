% Programming Fundamentals Using MATLAB, Michael Weeks Copyright 2020
% 
%
% GUI_dropdown_CB2.m
%
% This is the callback function for GUI_dropdown_example2.m.
%
%

function GUI_dropdown_CB2(obj1, obj2, myparam)

global current_choice

disp(myparam);

% Get the newly selected value 
Value = get(obj1, 'Value')

% Remember what the choice was last time.
old_choice = current_choice;
% Find out what the choice is now.
if (Value == 1)
    current_choice = 'red';
elseif (Value == 2)
    current_choice = 'green';
else
    current_choice = 'blue';
end
disp(sprintf('Switching from %s to %s', old_choice, current_choice));
