starship init fish | source

function fish_greeting
    colorscript -r
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
alias myscripts='cd ~/MyScripts/'
alias mytest='cd ~/MyTestingProjects/'
alias rusttest='cd ~/MyTestingProjects/rust_testings/'
alias jstest='cd ~/MyTestingProjects/javascript_testings/'
alias javatest='cd ~/MyTestingProjects/java_testings/'
alias mypj='cd ~/MyProjects/'
alias dots='cd ~/MyCinnamonDots/'
alias phpdir='cd /var/www/html/'
alias brave='brave-browser'
alias calendar='calcurse'

# Set up fzf key bindings
fzf --fish | source

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --color header:italic
  --header 'find the command'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'eza --icons --tree --color=always {}'"

export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#set -x STARSHIP_FISH_PRIVATE_MODE $fish_private_mode

set -Ux FZF_DEFAULT_OPTS '--color=fg:#ebdbb2,bg:#1d2021,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f'

#function __starship_is_private_hook --on-variable fish_private_mode
#    set -x STARSHIP_FISH_PRIVATE_MODE $fish_private_mode
#end

set -gx ANDROID_HOME ~/Android/Sdk
set -gx EDITOR nvim
set -gx TERM xterm-kitty

set -Ux fish_user_paths ~/.config/composer/vendor/bin $fish_user_paths
