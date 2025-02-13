#!/usr/bin/env bash

# Ensure script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

# Backup important files
echo "Creating backup of important log files..."
backup_file=~/Desktop/System_Backup_$(date +"%Y%m%d_%H%M%S").tar.gz
sudo tar -czvf "$backup_file" /Library/Logs/ /private/var/log/ ~/Library/Logs/ &>/dev/null
echo "Backup saved to $backup_file"

# Empty Trash
echo 'Empty the Trash on all mounted volumes and the main HDD…'
sudo rm -rfv /Volumes/*/.Trashes/* &>/dev/null || echo "Could not clear Trash on some volumes"
sudo rm -rfv ~/.Trash/* &>/dev/null || echo "Could not clear Trash for current user"

# Clear system log files
echo 'Clear System Log Files…'
sudo rm -rv /private/var/log/asl/*.asl &>/dev/null
sudo rm -rv /Library/Logs/DiagnosticReports/* &>/dev/null
rm -rv ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/* &>/dev/null
rm -rv ~/Library/Logs/CoreSimulator/* &>/dev/null

# Clear Adobe cache files
echo 'Clear Adobe Cache Files…'
[ -d "~/Library/Application Support/Adobe/Common/Media Cache Files" ] && rm -rv ~/Library/Application\ Support/Adobe/Common/Media\ Cache\ Files/* &>/dev/null

# Cleanup iOS applications
echo 'Cleanup iOS Applications…'
[ -d "~/Music/iTunes/iTunes Media/Mobile Applications" ] && rm -rv ~/Music/iTunes/iTunes\ Media/Mobile\ Applications/* &>/dev/null

# Remove iOS device backups
echo 'Remove iOS Device Backups…'
rm -rv ~/Library/Application\ Support/MobileSync/Backup/* &>/dev/null

# Cleanup XCode Derived Data and Archives
echo 'Cleanup XCode Derived Data and Archives…'
rm -rv ~/Library/Developer/Xcode/DerivedData/* &>/dev/null
rm -rv ~/Library/Developer/Xcode/Archives/* &>/dev/null

# Cleanup Homebrew cache
echo 'Cleanup Homebrew Cache…'
brew cleanup -s &>/dev/null
rm -rv /Library/Caches/Homebrew/* &>/dev/null

# Cleanup old versions of Ruby gems
echo 'Cleanup old versions of gems…'
gem cleanup &>/dev/null

# Use macOS storage management for cleanup
echo 'Running macOS storage cleanup…'
storage cleanup &>/dev/null

# Optional: Purge inactive memory
read -p "Do you want to purge inactive memory? (Y/n): " purge_response
if [[ "$purge_response" =~ ^[Yy]$ || -z "$purge_response" ]]; then
    echo 'Purging inactive memory…'
    sudo purge
else
    echo 'Skipping memory purge.'
fi

# Optional: Re-index Spotlight
read -p "Do you want to re-index Spotlight? (Y/n): " spotlight_response
if [[ "$spotlight_response" =~ ^[Yy]$ || -z "$spotlight_response" ]]; then
    echo 'Erasing and re-indexing Spotlight data…'
    sudo mdutil -Ea &>/dev/null
else
    echo 'Skipping Spotlight re-index.'
fi

# Run periodic macOS maintenance scripts
# echo 'Run macOS maintenance scripts…'
# sudo periodic daily weekly monthly

# periodic is deprecated in macOS 15
# Use the following instead:
echo 'Running manual system maintenance tasks…'
sudo rm -rf /private/tmp/*
sudo rm -rf /var/tmp/*
sudo rm -rf /var/log/*
sudo rm -rf /Library/Logs/*
# System Integrity Protection (SIP) prevents users from modifying these files:
# sudo rm -rf /System/Library/Caches/*
# sudo rm -rf /Library/Caches/*
# sudo rm -rf ~/Library/Caches/*

# Clear system and Safari caches
echo 'Clear system and Safari caches…'
rm -rv ~/Library/Caches/* &>/dev/null
rm -rv ~/Library/Safari/LocalStorage/* &>/dev/null

clear && echo 'System maintenance complete!'

echo 'Space after cleanup:'
df -h /
