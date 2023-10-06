[sample,fs] = audioread("a3-8.mp3");

[chord1, chord2, chord3] = pitchShift(sample);

soundsc(chord1, fs)
pause(1)
soundsc(chord2, fs)
pause(1)
soundsc(chord3, fs)

pause(1)

soundsc(chord1 + chord2 + chord3, fs)