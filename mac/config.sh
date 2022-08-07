set -e
set -x

osascript -e 'tell application "System Preferences" to quit'

NAME=mac # FIXME
sudo scutil --set ComputerName $NAME
sudo scutil --set LocalHostName $NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $NAME

#dsenableroot 
sudo mdutil -a -i off
#sudo nvram BootAudio=%00

sudo spctl --master-disable
#sudo systemsetup -setcomputersleep Never

pwpolicy -u andy -setpolicy "maxFailedLoginAttempts=5"

# defaults write  com.apple.frameworks.diskimages skip-verify -bool true
# defaults write  com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write  com.apple.frameworks.diskimages skip-verify-remote -bool true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false
defaults write -g NSScrollAnimationEnabled -bool false
defaults write -g NSScrollViewRubberbanding -bool false
defaults write -g NSToolbarFullScreenAnimationDuration -float 0
defaults write -g NSToolbarTitleViewRolloverDelay -float 0
defaults write -g NSWindowResizeTime -float 0.001
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.CrashReporter DialogType none	
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock springboard-hide-duration -float 0
defaults write com.apple.dock springboard-page-duration -float 0
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock workspaces-edge-delay -float 0
defaults write com.apple.dock workspaces-swoosh-animation-off -bool YES	
# defaults write com.apple.dock wvous-bl-corner -int 4
# defaults write com.apple.dock wvous-tr-corner -int 10
# defaults write com.apple.dt.Xcode BuildSystemScheduleInherentlyParallelCommandsExclusively -bool YES
# defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
defaults write com.apple.finder AnimateInfoPanes -bool false
defaults Write com.apple.finder AnimateSnapToGrid -bool false
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXEnableSlowAnimation -bool false
defaults write com.apple.finder QLEnableSlowMotion -bool false
defaults write com.apple.finder ShowStatusBar -bool true
# defaults write com.apple.iphonesimulator AllowFullscreenMode -bool YES
defaults write com.apple.LaunchServices LSQuarantine -bool false
# defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
defaults write com.apple.Mail DisableReplyAnimations -bool true
defaults write com.apple.Mail DisableSendAnimations -bool true
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.1
defaults write com.apple.Safari WebKitResourceTimedLayoutDelay 0.1
defaults write com.apple.screencapture location "~/Downloads"
# defaults write com.apple.Terminal FocusFollowsMouse -string YES
defaults write com.apple.TextEdit RichText -bool false
defaults write com.apple.universalaccess reduceTransparency -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
DevToolsSecurity -enable
# launchctl unload -w /System/Library/LaunchDaemons/com.apple.bluetoothReporter.plist 
# launchctl unload -w /System/Library/LaunchDaemons/com.apple.bluetoothd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.AirPlayUIAgent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.alf.useragent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.AMPLibraryAgent.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.amsaccountsd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.amsengagementd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ap.adprivacyd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ap.adservicesd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.appleseed.seedusaged.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.assessmentagent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.assistant_service.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.assistantd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.avatarsd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.cloudphotod.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.contacts.donation-agent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.coreparsec.silhouette.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.coreservices.useractivityd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.corespeechd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.corespotlightd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.diagnosticextensionsd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.diagnostics_agent.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.dmd.agent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.familycircled.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.familycontrols.useragent.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.familynotificationd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.followupd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.FollowUpUI.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.gamed.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.helpd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.homed.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.icloud.findmydeviced.findmydevice-user-agent.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.icloud.fmfd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.knowledge-agent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.macos.studentd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaanalysisd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.mediaremoteagent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.networkserviceproxy-osx.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.parentalcontrols.check.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.parsec-fbf.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.parsecd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.photoanalysisd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.photolibraryd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.progressd.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportCrash.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportGPURestart.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ReportPanic.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.reversetemplated.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.routined.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.Safari.SafeBrowsing.Service.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.SafeEjectGPUAgent.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.ScreenTimeAgent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.SocialPushAgent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.speech.synthesisserver.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.spindump_agent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.suggestd.plist 
# launchctl unload -w /System/Library/LaunchAgents/com.apple.symptomsd-diag.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.sysdiagnose_agent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.UsageTrackingAgent.plist
# launchctl unload -w /System/Library/LaunchAgents/com.apple.WiFiVelocityAgent.plist 
# sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop
# sudo defaults write /Library/Preferences/com.apple.driver.AppleIRController DeviceEnabled -int 0
# sudo defaults write /Library/Preferences/com.apple.security.revocation.plist CRLStyle None
# sudo defaults write /Library/Preferences/com.apple.security.revocation.plist OCSPStyle None
# sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array-add "-NoMulticastAdvertisements"
# sudo defaults write com.apple.security.revocation.plist CRLStyle None
# sudo defaults write com.apple.security.revocation.plist OCSPStyle None
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.AirPlayXPCHelper.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.analyticsd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.appleseed.fbahelperd.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.applessdstatistics.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.aslmanager.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.awdd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.backupd-helper.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.backupd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.coreduetd.osx.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.coresymbolicationd.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.CrashReporterSupportHelper.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.diagnosticd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.dprivacyd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.DumpGPURestart.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.DumpPanic.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.emond.aslmanager.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.emond.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.endpointsecurity.endpointsecurityd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.familycontrols.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.findmymac.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.findmymacmessenger.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.GameController.gamecontrollerd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.icloud.findmydeviced.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.icloud.searchpartyd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.InstallerDiagnostics.installerdiagd.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.InstallerDiagnostics.installerdiagwatcher.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.jetsamproperties.Mac.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.logd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.managedconfiguration.teslad.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mediaremoted.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mobileassetd.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.PerfPowerServices.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ReportCrash.Root.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.ReportMemoryException.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.revisiond.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.rtcreportingd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.SafeEjectGPUStartupDaemon.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.sandboxd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.spindump.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.SubmitDiagInfo.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.symptomsd-diag.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.symptomsd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.sysdiagnose.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.syslogd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.systemstats.analysis.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.systemstats.daily.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.systemstats.microstackshot_periodic.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.tailspind.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.watchdogd.plist 
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.wifianalyticsd.plist
# sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.wifivelocityd.plist 
