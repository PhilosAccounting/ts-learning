% Programming Fundamentals Using MATLAB, Michael Weeks Copyright 2020
% 
% note_play.m
%
% Generate sine waves with 1 second's worth of data
% for notes from 220 Hz up to 440 Hz.
% 
% Play a given string specifying the notes, 
% using lower-case for the note, and upper-case for the 
% sharp. The following notes are represented below.
%   A A# B C C# D D# E F F# G G# 
%   a A  b c C  d D  e f F  g G
%
% If the input is wrong, map it to a note anyway.
% E.g. without E-sharp, there should not be 'E' in the input,
% so make it play the same note as 'e'.
% Outside 'a' through 'G', map the note to A in the next octave.
% 
%
%
% Usage: 
%    note_play('C');
%    note_play('aAbcCdDefFgG');
%    note_play('CabbCeF');
%
function note_play(notes2play)

% Default is 8192 samples per second
% Alternatively, use sound(s,8192)
fs = 8192;

% notes from A to A (next octave)
% A4 is 440 Hz, middle-C is 261.6
% A A# B C C# D D# E F F# G G# A
% 
notes = [220, 233, 247, 262, 277, 294, 311, ...
    330, 349, 370, 392, 415, 440];

% Pre-allocate the memory.
allnotes = zeros(length(notes), fs);
% Make a matrix where each row is 1 second of sound for a note
% defined by the 'notes' array.
% For each note, store the data in a row's matrix.
for k=1:length(notes)
     % store this note
     % 0.5 is used to keep the sound from being loud
    allnotes(k, 1:fs) = 0.5*sin(2*pi*(0:(fs-1))*notes(k)/fs);
end

% Play each note in the string.
% E.g. 'aAbcCdDefFgG'
for k = 1:length(notes2play)
    % Map each letter of the string to a row number for the note.
    % Since some sharps do not exist (like B), map them to non-sharp.
    switch (notes2play(k)) 
        case 'a'
            n = 1;
        case 'A'
            n = 2;
        case 'b'
        case 'B'
            n = 3;
        case 'c'
            n = 4;
        case 'C'
            n = 5;
        case 'd'
            n = 6;
        case 'D'
            n = 7;
        case 'e'
        case 'E'
            n = 8;
        case 'f'
            n = 9;
        case 'F'
            n = 10;
        case 'g'
            n = 11;
        case 'G'
            n = 12;
        otherwise
            % This is the A note in the next octave
            n = 13;
    end
    % Play this note.
    sound(allnotes(n,1:fs), fs);
    % Wait only half a second, to overlap notes.
    pause(0.5);
end


