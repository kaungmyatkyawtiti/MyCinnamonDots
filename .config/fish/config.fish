# Init Starship prompt
starship init fish | source
# init Zoxide
zoxide init fish | source

# Greeting script
function fish_greeting
    colorscript -r
end

# Yazi function to update PWD
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Set universal environment variables
set -Ux FZF_DEFAULT_OPTS \
    '--color=fg:#ebdbb2,bg:#1d2021,hl:#b16286' \
    '--color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b' \
    '--color=info:#d65d0e,prompt:#458588,pointer:#fe8019' \
    '--color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

set -Ux fish_user_paths ~/.config/composer/vendor/bin $fish_user_paths
set -Ux JAVA_HOME /usr/lib/jvm/java-24-openjdk
set -Ux MAVEN_OPTS "--enable-native-access=ALL-UNNAMED"

# Set global environment variables
#set -gx ANDROID_HOME ~/Android/Sdk
set -gx EDITOR nvim
set -gx TERM xterm-kitty

# Set FZF behavior
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -gx FZF_CTRL_T_OPTS '
  --walker-skip .git,node_modules,target
  --preview "bat -n --color=always {}"
  --bind "ctrl-/:change-preview-window(down|hidden|)"'

set -gx FZF_CTRL_R_OPTS '
  --color header:italic
  --header "find the command"'

set -gx FZF_ALT_C_OPTS '
  --walker-skip .git,node_modules,target
  --preview "eza --icons --tree --color=always {}"'

# FZF key bindings
fzf --fish | source

# Aliases
alias ls='eza -1 -F --icons'
alias g='git'
alias fetch='fastfetch'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias kicat='kitten icat'
alias py='python3'
alias tock='tock -c -s -C 211,134,155'
alias t='tmux'
alias lg='lazygit'
alias cd..='cd ../'
alias myhelpers='cd ~/MyHelpers/'
alias mytest='cd ~/MyTestingProjects/'
alias rusttest='cd ~/MyTestingProjects/rust_testings/'
alias jstest='cd ~/MyTestingProjects/javascript_testings/'
alias javatest='cd ~/MyTestingProjects/java_testings/'
alias mypj='cd ~/MyProjects/'
alias mydots='cd ~/MyCinnamonDots/'
alias phpdir='cd /var/www/html/'
alias brave='brave-browser'
alias calendar='calcurse'
alias less='less -NRX'
alias gitfiles='cd ~/MyGitFiles/'
alias rain='terminal-rain --rain-color white --lightning-color yellow'

# Optional: for interactive-specific commands
if status is-interactive
    # Interactive session setup
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Created by `pipx` on 2025-07-13 08:42:29
set PATH $PATH /home/nott_eucalyptus/.local/bin
fish_vi_key_bindings

# pnpm
set -gx PNPM_HOME "/home/nott_eucalyptus/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
