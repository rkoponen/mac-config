#!/usr/bin/env bash
set -e

echo "Applying macOS system defaults..."

# -------------------------------------------------------------------
# Dock & UI Animations
# -------------------------------------------------------------------
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove autohide delay (Dock reveals immediately upon hover)
defaults write com.apple.dock autohide-delay -float 0

# Remove slide animation (instant appearance)
defaults write com.apple.dock autohide-time-modifier -float 0.15

# -------------------------------------------------------------------
# Keyboard & Input
# -------------------------------------------------------------------
# Fast key repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# Disable press-and-hold accent popup for all editors & apps
defaults write -g ApplePressAndHoldEnabled -bool false

# -------------------------------------------------------------------
# Screenshots
# -------------------------------------------------------------------

# Disable window drop shadow in window screenshots (Cmd + Shift + 4, Space)
defaults write com.apple.screencapture disable-shadow -bool true

# Default format: PNG
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture target -string "file"

# -------------------------------------------------------------------
# Apply Changes
# -------------------------------------------------------------------
echo "Restarting affected system apps..."

for app in "Dock" "Finder" "SystemUIServer" "screencaptureui"; do
  killall "${app}" >/dev/null 2>&1 || true
done

echo "macOS defaults applied successfully!"
