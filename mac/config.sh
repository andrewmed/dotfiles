#!/usr/bin/env bash
set -x
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSToolbarTitleViewRolloverDelay -float 0
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
# defaults write kCFPreferencesAnyApplication TSMLanguageIndicatorEnabled 0
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticTextCompletionEnabled -bool false
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 3
defaults write -g com.apple.keyboard.fnState -bool true
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write com.apple.CrashReporter DialogType none
defaults write com.apple.LaunchServices LSQuarantine -bool false
#defaults write -g WebKitDeveloperExtras -bool true
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
defaults write com.apple.TextEdit RichText -bool false
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock workspaces-edge-delay -float 0
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES
defaults write com.apple.dock wvous-bl-corner -int 4 # Desktop
# defaults write com.apple.dock wvous-bl-modifier -int 0
# defaults write com.apple.dock wvous-tr-corner -int 13
# defaults write com.apple.dock wvous-tr-modifier -int 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXDefaultSearchScope SCcf
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string clmv
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
defaults write -g AppleShowAllExtensions -bool true
#defaults write com.apple.dock "show-recents" -bool "false" && killall Dock
defaults write com.apple.mail ConversationViewSortDescending -bool true
defaults write com.apple.mail SendFormat Plain
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write -g com.apple.trackpad.forceClick -bool false

#defaults write com.apple.screencapture show-thumbnail -bool FALSE
#chflags nohidden ~/Library
# Disable timemachine
sudo tmutil disable

# Stop Responding to Key Presses itunes
# Disabled: fails on modern macOS due to SIP protecting /System paths
# launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

NAME="${1:-$(scutil --get ComputerName 2>/dev/null)}"
if [ -n "$NAME" ]; then
  # Sanitize: strip non-alnum, collapse hyphens
  SANITIZED=$(printf '%s' "$NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g; s/--*/-/g; s/^-//; s/-$//')
  LOCAL_HOST_NAME=$(printf '%s' "$SANITIZED" | cut -c1-63 | sed 's/-$//')
  NETBIOS_NAME=$(printf '%s' "$SANITIZED" | cut -c1-15 | sed 's/-$//')
  if [ -n "$LOCAL_HOST_NAME" ]; then
    osascript -e 'tell application "System Preferences" to quit'
    sudo spctl developer-mode enable-terminal
    sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$NETBIOS_NAME"
    #sudo nvram StartupMute=%01
    sudo scutil --set ComputerName "$NAME"
    sudo scutil --set LocalHostName "$LOCAL_HOST_NAME"
  else
    echo "WARNING: Could not derive a valid hostname from '$NAME', skipping hostname config" >&2
  fi
else
  echo "WARNING: No hostname provided and ComputerName not set, skipping hostname config" >&2
fi

# /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs
# /Library/Preferences/SystemConfiguration/preferences.plist
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Strongest
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=KeepLooking
# set mtu lower
#
#
# Old-style plist literals have no number type, so `defaults write -array` would store
# "enabled" as a string and the Spotlight settings pane fails to render. -json gives
# real integers. SearchResults is the key macOS reads; orderedItems only sets the order.
spotlight_plist=~/Library/Preferences/com.apple.Spotlight.plist

plutil -replace orderedItems -json '[
  {"enabled":1,"name":"APPLICATIONS"},
  {"enabled":1,"name":"SYSTEM_PREFS"},
  {"enabled":0,"name":"MENU_SPOTLIGHT_SUGGESTIONS"},
  {"enabled":0,"name":"MENU_CONVERSION"},
  {"enabled":0,"name":"MENU_EXPRESSION"},
  {"enabled":0,"name":"MENU_DEFINITION"},
  {"enabled":0,"name":"DOCUMENTS"},
  {"enabled":0,"name":"DIRECTORIES"},
  {"enabled":0,"name":"PRESENTATIONS"},
  {"enabled":0,"name":"SPREADSHEETS"},
  {"enabled":0,"name":"PDF"},
  {"enabled":0,"name":"MESSAGES"},
  {"enabled":0,"name":"CONTACT"},
  {"enabled":0,"name":"EVENT_TODO"},
  {"enabled":0,"name":"IMAGES"},
  {"enabled":0,"name":"BOOKMARKS"},
  {"enabled":0,"name":"MUSIC"},
  {"enabled":0,"name":"MOVIES"},
  {"enabled":0,"name":"FONTS"},
  {"enabled":0,"name":"SOURCE"},
  {"enabled":0,"name":"MENU_OTHER"},
  {"enabled":0,"name":"TIPS"}
]' "$spotlight_plist"

plutil -replace SearchResults -json '{
  "APPLICATIONS":1, "SYSTEM_PREFS":1,
  "MENU_SPOTLIGHT_SUGGESTIONS":0, "MENU_CONVERSION":0, "MENU_EXPRESSION":0,
  "MENU_DEFINITION":0, "MENU_OTHER":0,
  "DOCUMENTS":0, "DIRECTORIES":0, "PRESENTATIONS":0, "SPREADSHEETS":0, "PDF":0,
  "MESSAGES":0, "CONTACT":0, "EVENT_TODO":0, "EVENTS":0, "IMAGES":0,
  "BOOKMARKS":0, "MUSIC":0, "MOVIES":0, "FONTS":0, "SOURCE":0,
  "HISTORY":0, "TIPS":0
}' "$spotlight_plist"

# plutil edits the file behind cfprefsd, which would otherwise flush its cache back over it
killall cfprefsd
killall Spotlight


sudo tee /etc/pam.d/sudo_local > /dev/null <<EOF
auth       sufficient     pam_tid.so
EOF
