% Programming Fundamentals Using MATLAB, Michael Weeks Copyright 2020
% 
figHandle = figure;
buttonHandle = uicontrol(figHandle, 'Style', 'pushbutton', ...
    'String', 'Close', ...
    'Position', [40 40 50 20], ...
    'Callback', 'ex_closeCB');
