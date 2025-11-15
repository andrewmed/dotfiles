set +e
set -x

brew install maccy
brew install brave-browser
brew install zed
brew install gh
brew install jq
brew install go
brew install v2ray
brew install mutagen-io/mutagen/mutagen
brew install ripgrep fd
brew install tree wget zsh-autosuggestions
brew install vlc
brew install disk-inventory-x
#brew install microsoft-remote-desktop
#brew install firefox
#brew install chromium
#brew install visual-studio-code
brew install duti
brew install knockknock
brew install lima
#brew install dockutil
#brew install google-chrome librewolf
brew install docker
brew install docker-buildx docker-compose
brew install telegram
brew install handy
brew install google-drive


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
#CODE_APP=com.microsoft.VSCode

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

# from appstore: purepaste
#
# defaults write com.apple.spotlight orderedItems -array \
    # '{"enabled" = 1;"name" = "APPLICATIONS";}' \
    # '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
    # '{"enabled" = 0;"name" = "DIRECTORIES";}' \
    # '{"enabled" = 0;"name" = "PDF";}' \
    # '{"enabled" = 0;"name" = "FONTS";}' \
    # '{"enabled" = 0;"name" = "DOCUMENTS";}' \
    # '{"enabled" = 0;"name" = "MESSAGES";}' \
    # '{"enabled" = 0;"name" = "CONTACT";}' \
    # '{"enabled" = 0;"name" = "EVENT_TODO";}' \
    # '{"enabled" = 0;"name" = "IMAGES";}' \
    # '{"enabled" = 0;"name" = "BOOKMARKS";}' \
    # '{"enabled" = 0;"name" = "MUSIC";}' \
    # '{"enabled" = 0;"name" = "MOVIES";}' \
    # '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
    # '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
    # '{"enabled" = 0;"name" = "SOURCE";}' \
    # '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
    # '{"enabled" = 0;"name" = "MENU_OTHER";}' \
    # '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
    # '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
    # '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
    # '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
