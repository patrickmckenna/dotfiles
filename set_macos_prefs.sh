#!/bin/bash

# various settings for MacOS

set -e

# --- software updates ---

echo " - verify all application software is current"
sudo softwareupdate -i -a

echo " - enable auto-update"
sudo softwareupdate --schedule on

echo " - check for updates daily"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1



# --- general security --- 

echo " - disable AirDrop"
defaults write com.apple.NetworkBrowser disableAirDrop -bool YES

echo " - disable Remote Apple Events"
sudo systemsetup -setremoteappleevents off

echo " - disable Remote Login"
sudo systemsetup -f -setremotelogin off

echo " - disable Internet Sharing"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.nat NAT -dict-add Enabled -int 0

echo " - disable Screen Sharing"
launchctl unload -w /System/Library/LaunchDaemons/com.apple.screensharing.plist

echo " - disable Printer Sharing"
cupsctl --no-share-printers

echo " - disable Wake on Network Access"
sudo systemsetup -setwakeonnetworkaccess off

echo " - disable File Sharing"
launchctl unload -w /System/Library/LaunchDaemons/com.apple.AppleFileServer.plist && \
launchctl unload -w /System/Library/LaunchDaemons/com.apple.smbd.plist

echo " - disable Remote Management"
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -deactivate -stop

echo " - disable Captive Portal"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false

echo " - destroy File Vault Key when going to standby"
sudo pmset -a destroyfvkeyonstandby 1

echo " - enable Gatekeeper"
sudo spctl --master-enable

echo " - enable Firewall"
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

echo " - enable Firewall Stealth Mode"
/usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on

echo " - disable signed apps from being auto-permitted to listen through firewall"
sudo defaults write /Library/Preferences/com.apple.alf allowsignedenabled -bool false

echo " - require an administrator password to access system-wide preferences"
security authorizationdb read system.preferences > /tmp/system.preferences.plist && \
/usr/libexec/PlistBuddy -c "Set :shared false" /tmp/system.preferences.plist && \
security authorizationdb write system.preferences < /tmp/system.preferences.plist

echo " - enable logging"
sudo defaults write /Library/Preferences/com.apple.alf loggingenabled -bool true

echo " - require p/w after screen saver starts, following a 5 second delay"
defaults write com.apple.screensaver askForPassword -int 1 && \
defaults write com.apple.screensaver askForPasswordDelay -int 5

echo " - put display to sleep after 15 min"
sudo pmset displaysleep 15

echo " - enable hibernation mode (no memory power on sleep)"
sudo pmset -a hibernatemode 25



# --- app-specific preferences ---

echo " - show Mail attachments as icons (i.e. disable previews)"
defaults write com.apple.mail disableInlineAttachmentViewing -bool true

echo " - disable automatic loading of remote content by Mail"
defaults write com.apple.mail-shared disableURLLoading -bool true

echo " - enable Develop menu and Web Inspector in Safari"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

echo " - stop Time Machine from auto-prompting one to use a newly-detected drive as backup target"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo " - show all file extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo " - show ~/Library"
chflags nohidden ~/Library

echo " - show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

echo " - set current folder as default search scope"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo " - quit Printer after job completes"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo " - expand Print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true && \
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
