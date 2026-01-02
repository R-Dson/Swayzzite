#!/usr/bin/env bash
# First-login GTK theme setup script for Swayzzite
# Runs once per user, then creates a marker file

set -oue pipefail

MARKER_FILE="$HOME/.config/swayzzite-gtk-setup-done"
CONFIG_DIR="$HOME/.config"

# Exit if already configured
if [ -f "$MARKER_FILE" ]; then
    exit 0
fi

# Wait for user home to be fully available
sleep 2

# Create GTK config directories
mkdir -p "$CONFIG_DIR/gtk-3.0"
mkdir -p "$CONFIG_DIR/gtk-4.0"

# Configure GTK3
cat > "$CONFIG_DIR/gtk-3.0/settings.ini" << 'EOF'
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Adwaita
gtk-font-name=IBM Plex Sans 11
gtk-monospace-font-name=FiraCode Nerd Font 11
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_BOTH
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xft-rgba=rgb
EOF

# Configure GTK4
cat > "$CONFIG_DIR/gtk-4.0/settings.ini" << 'EOF'
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Adwaita
gtk-font-name=IBM Plex Sans 11
gtk-monospace-font-name=FiraCode Nerd Font 11
gtk-cursor-theme-name=Adwaita
EOF

# Use nwg-look to apply settings if available
if command -v nwg-look >/dev/null 2>&1; then
    # Export nwg-look settings (runs and exits with -x flag)
    nwg-look -x 2>/dev/null || true
fi

# Create xsettingsd config for GTK2 applications
mkdir -p "$CONFIG_DIR/xsettingsd"
cat > "$CONFIG_DIR/xsettingsd/xsettingsd.conf" << 'EOF'
Net/ThemeName "Adwaita-dark"
Net/IconThemeName "Adwaita"
Gtk/FontName "IBM Plex Sans 11"
Gtk/MonospaceFontName "FiraCode Nerd Font 11"
Gtk/CursorThemeName "Adwaita"
EOF

# Mark as done
touch "$MARKER_FILE"

# Log completion
logger "Swayzzite: GTK theme configuration completed for user $USER"
