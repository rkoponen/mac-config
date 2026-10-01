cat << 'EOF' > ~/mac-config/macos.sh
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

# Disable press-and-hold accent popup for VS Code / Cursor Vim mode
defaults write -g ApplePressAndHoldEnabled -bool false

# -------------------------------------------------------------------
# Apply Changes
# -------------------------------------------------------------------
killall Dock Finder 2>/dev/null || true

echo "macOS defaults applied successfully!"
EOF

chmod +x ~/mac-config/macos.sh
