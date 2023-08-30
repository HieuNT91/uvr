#!/bin/bash

# Specify the input directory containing WAV files
input_directory="wav_raw"

# Specify the output directory where trimmed WAV files will be saved
output_directory="trimmed"


# Check if the input directory exists
if [ -d "$input_directory" ]; then
    # Check if the output directory exists, create if not
    mkdir -p "$output_directory"
    
    # Loop through each WAV file in the input directory and trim silence
    for wavfile in "$input_directory"/*.wav; do
        if [ -f "$wavfile" ]; then
            # Generate the output WAV filename
            output_wavfile="$output_directory/$(basename "$wavfile")"
            
            # Trim silence using sox
            sox "$wavfile" "$output_wavfile" silence -l 1 0.3 2% -1 2.0 2%
            
            echo "Trimmed silence from: $(basename "$wavfile")"
        fi
    done
else
    echo "Input directory not found: $input_directory"
fi