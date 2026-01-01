# Sway Desktop Environment Setup

## Overview

This image includes a complete Sway desktop environment setup on top of Bazzite DX NVIDIA. All configuration is automated - from package installation to GTK themes.

## First Login

On first login, GTK themes will be **automatically configured**:
- **Theme**: Adwaita-dark
- **Icons**: Adwaita
- **Font**: JetBrains Mono
- **Cursor**: Adwaita

The setup script runs once and creates a marker file at `~/.config/swayzzite-gtk-setup-done`. If you want to re-run the theme setup, simply delete this file and log out/in.

## Session Selection

At the GDM login screen, you can choose:
- **Bazzite** (default gaming session with KDE)
- **Sway** (tiling window manager - your custom setup)

Both sessions coexist without conflicts. Simply select your preferred session each time you log in.

## Keybindings

The modifier key is **Super/Windows key** (Mod4).

### Application Launchers
| Keybinding | Action |
|------------|--------|
| `Mod+Enter` | Launch terminal (foot) |
| `Mod+d` | Application launcher (tofi) |

### Window Management
| Keybinding | Action |
|------------|--------|
| `Mod+Shift+q` | Close focused window |
| `Mod+h/j/k/l` or `Mod+Arrow keys` | Move focus |
| `Mod+Shift+h/j/k/l` | Move window |
| `Mod+1-0` | Switch to workspace 1-10 |
| `Mod+Shift+1-0` | Move window to workspace |
| `Mod+f` | Toggle fullscreen |
| `Mod+Shift+space` | Toggle floating mode |
| `Mod+r` | Enter resize mode |

### Special Features
| Keybinding | Action |
|------------|--------|
| `Mod+Ctrl+v` | Open clipboard history (cliphist + tofi) |
| `Print` | Screenshot with selection (grim/slurp/swappy) |
| `Mod+Escape` | Lock screen (hyprlock) |
| `Mod+a` | Focus parent container |

### Media Keys
- Volume controls (raise/lower/mute)
- Brightness controls
- Media playback (play/pause/next/previous)

## Startup Services

The following services start **automatically** when you log into Sway:

| Service | Purpose |
|---------|---------|
| `swww-daemon` | Wallpaper management |
| `swaync` | Notification center |
| `cliphist` | Clipboard history manager |
| `gammastep-indicator` | Blue light filter (configure lat/long in sway/config) |
| `polkit-gnome` | Authentication agent for sudo prompts |
| `kanshi` | Display auto-configuration |
| `waybar` | Status bar |

## Configuration Files

### User Configurations (copied from /etc/skel)
These are in your home directory and you can customize them:
- `~/.config/sway/config` - Sway WM config
- `~/.config/waybar/config` - Status bar config
- `~/.config/waybar/style.css` - Status bar styling
- `~/.config/tofi/config` - Launcher config
- `~/.config/hypr/hypridle.conf` - Idle/lock timer
- `~/.config/hypr/hyprlock.conf` - Lock screen config
- `~/.config/swaync/config.json` - Notification center config
- `~/.config/swaync/style.css` - Notification center styling

### System Reference (read-only)
These provide system-wide defaults:
- `/etc/sway/config` - System-wide Sway config
- `/etc/waybar/config` - System-wide Waybar config
- `/etc/waybar/style.css` - System-wide Waybar styling

## Customization

### Reloading Sway Configuration
After editing `~/.config/sway/config`:
```
Mod+Shift+c
```

### Setting Wallpaper
```bash
swww img /path/to/image.jpg
```

### GTK Themes
Run the GTK theme configuration tool:
```bash
nwg-look
```

### Gammastep (Blue Light Filter)
Edit your Sway config and update the lat/long coordinates:
```bash
# Find this line in ~/.config/sway/config
exec gammastep-indicator -l 59.3:18.0 -t 5700:3600 &
#                            ^^^^^^ ^^^^^^
#                            Lat    Long
```

### Kanshi (Display Auto-Configuration)
Create `~/.config/kanshi/config` to define your display profiles:
```ini
profile laptop {
    output eDP-1 enable scale 2
}

profile docked {
    output eDP-1 enable
    output HDMI-A-1 enable scale 2
}
```

## Color Scheme

All applications use the **Solarized Dark** color scheme:
- Background: `#002b36`
- Foreground: `#839496`
- Primary (green): `#859900`
- Secondary (blue): `#268bd2`
- Accent (yellow): `#b58900`
- Alert (red): `#dc322f`

## COPR Repositories

This image includes packages from these COPR repositories:
- **atim/starship** - Modern shell prompt
- **solopasha/hyprland** - Hyprland and utilities (hyprlock, hypridle)
- **pgdev/ghostty** - Modern terminal emulator
- **erikreider/SwayNC** - Notification center
- **sentriz/cliphist** - Clipboard history manager

## Troubleshooting

### Sway doesn't appear in GDM
Check that the session file exists:
```bash
ls /usr/share/wayland-sessions/sway.desktop
```

### GTK themes aren't applied
Re-run the setup script:
```bash
rm ~/.config/swayzzite-gtk-setup-done
# Log out and log back in
```

### Clipboard history isn't working
Check that the services are running:
```bash
ps aux | grep wl-paste
ps aux | grep cliphist
```

### Wallpaper isn't showing
Check that swww-daemon is running:
```bash
ps aux | grep swww-daemon
# If not running, start it:
swww-daemon &
```

### Notifications aren't appearing
Check that swaync is running:
```bash
ps aux | grep swaync
# If not running, start it:
swaync &
```

### Lock screen doesn't work
Check that hyprlock is installed and accessible:
```bash
which hyprlock
# Test manually:
hyprlock
```

## Package List

### Core & Terminal
- sway, foot, ghostty, starship, micro

### UI & Widgets
- waybar, eww, tofi, SwayNC, nwg-look

### File Managers
- yazi (terminal), dolphin (GUI), kio-extras

### Utilities & Screen
- hyprlock, hypridle, kanshi, wdisplays, wlr-randr
- swww (wallpaper), brightnessctl, imv, waypipe
- gammastep (blue light filter)

### Screenshots & Clipboard
- grim, slurp, swappy, wl-clipboard, wl-clip-persist, cliphist

### System Essentials
- xdg-desktop-portal-wlr, polkit-gnome
- jetbrains-mono-fonts, google-noto-sans-fonts, google-noto-emoji-fonts

## Support

For issues specific to:
- **Sway**: https://github.com/swaywm/sway
- **BlueBuild**: https://github.com/blue-build/cli
- **Bazzite**: https://universal-blue.org/documentation/bazzite/
- **This image**: Check your repository's issues page
