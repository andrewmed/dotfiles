set +e
set -x

brew tap mutagen-io/mutagen
brew tap umputun/apps

brew install agent-browser ansible cmake delve docker docker-buildx docker-compose duti fd fzf gh git-delta go gperf herdr jq lima nmap node ollama pandoc python@3.10 qpdf ripgrep shellcheck tabiew tmux tree ttyd uv wget websocat wireguard-tools zoxide zsh-autosuggestions
brew install mutagen-io/mutagen/mutagen
brew install umputun/apps/fya umputun/apps/mpt umputun/apps/ralphex umputun/apps/revdiff

brew install --cask umputun/apps/agterm android-platform-tools audacity brave-browser claude-code codex disk-inventory-x google-drive grok-build handy knockknock maccy openmtp revmux the-unarchiver tor-browser utm vlc zed
#brew install microsoft-remote-desktop

#brew install visual-studio-code


set +x
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
CODE_APP=dev.zed.Zed

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

CODE_APP=dev.zed.Zed
for ext in astro cjs cs dart diff fish gql graphql hcl htm html jsx mjs patch rb rs scss svelte swift tf tfvars tsx vue xml yaml yml; do set_default "${CODE_APP}" "${ext}"; done
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
set_default "${CODE_APP}" md
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
