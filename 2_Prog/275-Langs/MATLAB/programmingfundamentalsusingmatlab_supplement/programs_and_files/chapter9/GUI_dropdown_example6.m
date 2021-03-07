% Programming Fundamentals Using MATLAB, Michael Weeks Copyright 2020
% 
%
% GUI_dropdown_example6.m
%
% Show an example with a drop-down menu, working with a callback function.
% The callback is a function defined within this function.
% This example DOES WORK.
%
%
function GUI_dropdown_example6

disp('This example does work.');

fig_handle = figure();

current_choice = 'red';
mystr = 'hello';

handle1 = uicontrol('Style', 'popup', ...
    'String', 'red|green|blue', ...
    'Position', [250 200 100 50], ...
    'Callback', {@GUI_dropdown_CB6, mystr});


%
% GUI_dropdown_CB6.m
%
% This is the callback function for GUI_dropdown_example6.m.
%
%

    function GUI_dropdown_CB6(obj1, obj2, myparam)
        
        
        disp('hello from GUI_dropdown_CB6');
        disp(myparam);
        
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
        % Remember the current_choice value
        % We could do assignin, but we don't need to...
        % assignin('base', 'current_choice', current_choice);
    end  % GUI_dropdown_CB6
end  % GUI_dropdown_example6

