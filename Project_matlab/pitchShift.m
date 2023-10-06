% Credit to
% https://people.ece.cornell.edu/land/courses/ece5760/FinalProjects/s2017/jmt329_swc63_gzm3/jmt329_swc63_gzm3/PitchShifter/index.html 

% Modified by Ronnel Walton and Connor Watz

function [chord1, chord2, chord3] = pitchShift(chord_in)
    % ringbuffer size
    B = 1024;
    chord1 = 0.5*chord_in;
    ringbuffer1 = zeros(B,1);
    ringbuffer2 = zeros(B,1);
    ringbuffer3 = zeros(B,1);
    ringbuffer4 = zeros(B,1);
    s_avg       = zeros(length(chord_in), 1);
    s_no_cross  = zeros(length(chord_in), 1);
    chord2      = zeros(length(chord_in), 1);
    chord3      = zeros(length(chord_in), 1);
    
    delta1 = 2^(-5/12); % changes pitch (by changing read-out increments)
    delta2 = 2^(-8/12);

    idx1 = 0;
    idx2 = 0;
    idx3 = 0;
    idx4 = 0;
    for tt=1:length(chord_in)
        
        % write to ringbuffer1 
        w_addr1 = mod(tt,B)+1;
        ringbuffer1(w_addr1) = chord_in(tt);
        
        % write to ringbuffer2
        w_addr2 = mod(tt+round(B/2),B)+1;
        ringbuffer2(w_addr2) = chord_in(tt);   
        
        % read from ringbuffer1
        idx1 = idx1 + delta1;
        r_addr1 = mod(round(idx1)-1,B)+1;
       
        % read from ringbuffer2
        idx2 = idx2 + delta1;
        r_addr2 = mod(round(idx2)-1,B)+1;  
        
        
        % write to ringbuffer3 
        w_addr3 = mod(tt,B)+1;
        ringbuffer3(w_addr3) = chord_in(tt);
        
        % write to ringbuffer4
        w_addr4 = mod(tt+round(B/2),B)+1;
        ringbuffer4(w_addr4) = chord_in(tt);   
        
        % read from ringbuffer3
        idx3 = idx3 + delta2;
        r_addr3 = mod(round(idx3)-1,B)+1;
       
        % read from ringbuffer4
        idx4 = idx4 + delta2;
        r_addr4 = mod(round(idx4)-1,B)+1;  
        
        % Options for reading out:
        
        % avg cross fading
        s_avg(tt,1) = 0.5*(ringbuffer1(r_addr1,1) + ringbuffer2(r_addr2,1));
        
        chord2(tt,1) = 0.25*(ringbuffer1(r_addr1,1) + ringbuffer2(r_addr2,1));
        
        chord3(tt,1) = 0.25*(ringbuffer3(r_addr3,1) + ringbuffer4(r_addr4,1));
        
        % no cross fading
        s_no_cross(tt,1) = ringbuffer1(r_addr1,1);
    end
end
