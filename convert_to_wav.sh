#!/bin/bash

# Specify the directory containing the MP3 files
input_directory="raw"

# Specify the directory where you want to save the converted WAV files
output_directory="wav_raw"

# Check if the input directory exists
if [ -d "$input_directory" ]; then
    # Check if the output directory exists, create if not
    mkdir -p "$output_directory"
    
    # Loop through each MP3 file in the input directory and convert to WAV
    for mp3file in "$input_directory"/*.mp3; do
        if [ -f "$mp3file" ]; then
            # Generate the output WAV filename
            output_wavfile="$output_directory/$(basename "${mp3file%.mp3}.wav")"
            
            # Convert the MP3 to WAV using ffmpeg
            ffmpeg -i "$mp3file" "$output_wavfile"
            
            echo "Converted: $(basename "$mp3file") to $(basename "$output_wavfile")"
        fi
    done
else
    echo "Input directory not found: $input_directory"
fi