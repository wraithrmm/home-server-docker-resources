#!/bin/bash
set -e

#verify that environment variables have been passed to this container. set the default value if not.
ENABLE_HOTWORD_SERVICE=${ENABLE_HOTWORD_SERVICE:-yes}

#go back to root directory
cd /

#start Snips hotword service
if [ $ENABLE_HOTWORD_SERVICE == yes ]; then
	snips-hotword 2> /var/log/snips-hotword.log & 
	snips_hotword_pid=$!
fi

#start the snips audio server without playback and microphone
snips-audio-server 2> /var/log/snips-audio-server.log &
snips_audio_server_pid=$!

wait "$snips_hotword_pid" "$snips_audio_server_pid"

