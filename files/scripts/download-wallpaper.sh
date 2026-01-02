#!/usr/bin/env bash
# Download default wallpaper for Swayzzite

set -oue pipefail

WALLPAPER_URL="https://raw.githubusercontent.com/hajosattila/dotfiles/refs/heads/main/wallpaper.png"
WALLPAPER_DEST="/usr/share/backgrounds/default.png"

echo "Downloading wallpaper from $WALLPAPER_URL..."
curl -fsSL -o "$WALLPAPER_DEST" "$WALLPAPER_URL"
echo "Wallpaper saved to $WALLPAPER_DEST"
