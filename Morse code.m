function pulse_seq = morse_encoder(message)
    load('morse.mat', 'Alpha', 'Morse');
    message = upper(message);
    pulse_seq = [];
    morse_str = '';
    
    for i = 1:length(message)
        char_idx = find(Alpha == message(i));
        if isempty(char_idx)
            continue;
        end
        morse_code = Morse{char_idx};
        morse_str = [morse_str, morse_code, ' '];
        
        char_seq = [];
        for j = 1:length(morse_code)
            if morse_code(j) == '.'
                char_seq = [char_seq, 1, 0];
            elseif morse_code(j) == '-'
                char_seq = [char_seq, 1, 1, 1, 0];
            end
        end
        char_seq(end) = []; 
        pulse_seq = [pulse_seq, char_seq, 0, 0, 0];
    end
    pulse_seq(end-2:end) = [];
    
    if nargout == 0
        disp(strtrim(morse_str));
    end
end

function morse_beep(pulse_seq, tone_freq, dot_duration, sampling_freq)
    samples_per_dot = round(dot_duration * sampling_freq);
    t = (0:samples_per_dot-1) / sampling_freq;
    tone = cos(2 * pi * tone_freq * t);
    silence = zeros(size(t));
    
    signal = [];
    for i = 1:length(pulse_seq)
        if pulse_seq(i) == 1
            signal = [signal, tone];
        else
            signal = [signal, silence];
        end
    end
    
    plot(signal);
    sound(signal, sampling_freq);
end

% Main script to encode and generate sound
message = 'Im here';
dot_duration = 0.06;
tone_freq = 750;
sampling_freq = 8000;
pulse_seq = morse_encoder(message);
morse_beep(pulse_seq, tone_freq, dot_duration, sampling_freq);

% Repeat with a different sampling frequency
sampling_freq = 4000;
morse_beep(pulse_seq, tone_freq, dot_duration, sampling_freq);
