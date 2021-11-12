set -e
set -x


brew install vlc
brew install maccy
brew install firefox
#brew install chromium
brew install visual-studio-code
brew install duti

set_default() {
    duti -s "${1:-"UNKNOWN_APP_ID"}" ".${2:-"UNKNOWN-EXT"}" all
    errcode=$?
    if [ $errcode -eq 0 ]; then echo "[OK ] Set defaul app for '${2}' to '${1}'";
    else echo "[ERR] Set default app for '${2}' to '${1}': Errocode = $errcode"; return $errcode;
    fi
}

# Find AppID: osascript -e 'id of app "VLC"'
VIDEO_APP=org.videolan.vlc
AUDIO_APP=org.videolan.vlc
CODE_APP=com.microsoft.VSCode

# Video
set_default "${VIDEO_APP}" avi
set_default "${VIDEO_APP}" mp4
set_default "${VIDEO_APP}" mpeg
set_default "${VIDEO_APP}" flv
set_default "${VIDEO_APP}" mkv
set_default "${VIDEO_APP}" webm
set_default "${VIDEO_APP}" wmv

# Media
set_default "${AUDIO_APP}" mp3
set_default "${AUDIO_APP}" ogg
set_default "${AUDIO_APP}" wav
set_default "${AUDIO_APP}" m3u
set_default "${AUDIO_APP}" pls

#Code
set_default "${CODE_APP}" asm
set_default "${CODE_APP}" c
set_default "${CODE_APP}" cc
set_default "${CODE_APP}" conf
set_default "${CODE_APP}" cpp
set_default "${CODE_APP}" css
set_default "${CODE_APP}" csv
set_default "${CODE_APP}" go
set_default "${CODE_APP}" h
set_default "${CODE_APP}" java
set_default "${CODE_APP}" js
set_default "${CODE_APP}" json
set_default "${CODE_APP}" kt
set_default "${CODE_APP}" less
set_default "${CODE_APP}" log
set_default "${CODE_APP}" php
set_default "${CODE_APP}" plist
set_default "${CODE_APP}" proto
set_default "${CODE_APP}" py
set_default "${CODE_APP}" rtf
set_default "${CODE_APP}" sass
set_default "${CODE_APP}" sh
set_default "${CODE_APP}" sql
set_default "${CODE_APP}" toml
set_default "${CODE_APP}" ts
set_default "${CODE_APP}" txt
set_default "${CODE_APP}" xml
set_default "${CODE_APP}" yaml
set_default "${CODE_APP}" yml

