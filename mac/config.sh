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
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g WebAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticTextCompletionEnabled -bool false

defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 3

# defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
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
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
#defaults write com.apple.dock "show-recents" -bool "false" && killall Dock
defaults write com.apple.mail ConversationViewSortDescending -bool true
defaults write com.apple.mail SendFormat Plain
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults write -g com.apple.trackpad.forceClick -bool false

#defaults write com.apple.screencapture show-thumbnail -bool FALSE
#chflags nohidden ~/Library
# Disable timemachine
sudo tmutil disable

# Stop Responding to Key Presses itunes
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

NAME=air # FIXME
osascript -e 'tell application "System Preferences" to quit'
spctl developer-mode enable-terminal
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $NAME
#sudo nvram StartupMute=%01

#Spotlight
#sudo mdutil -i off -d /Volumes
#sudo mdutil -a -i off

sudo scutil --set ComputerName $NAME
sudo scutil --set LocalHostName $NAME

# /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs
# /Library/Preferences/SystemConfiguration/preferences.plist
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinMode=Strongest
#sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport prefs JoinModeFallback=KeepLooking
# set mtu lower
