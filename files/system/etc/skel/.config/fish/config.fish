# Fish configuration for Swayzzite

# Starship prompt
if command -q starship
    starship init fish | source
end

# User binaries
set -gx PATH $HOME/.local/bin $PATH

# Auto-start tmux (only if not already in tmux)
if status --is-interactive
and not set -q TMUX
    tmux -u new-session -A -s main
end
