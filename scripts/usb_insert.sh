#!/bin/bash
SOUND_FILE="/home/cheecho/.sounds/linuxmint/plug.oga"

# Check if the sound file exists
if [ -f "$SOUND_FILE" ]; then
    pw-play "$SOUND_FILE"
else
    echo "Sound file not found: $SOUND_FILE"
fi
