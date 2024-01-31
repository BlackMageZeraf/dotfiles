set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "eza -F --icons"
alias l ls
alias la "ls -a"
alias ll "ls -l"
alias lla "ll -a"
alias gitac "git add . && git commit -m"
alias grep rg
alias upgradepc "sudo apt update && sudo apt upgrade -y && cargo-install-update install-update --all && flatpak update && sudo snap refresh"
alias discord "flatpak run com.discordapp.Discord"

command -qv nvim && alias vim nvim
command -qv batcat && alias cat batcat

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# run following commands in terminal to set the theme
# fish_config theme save "Catppuccin Frappe"
# fish_config theme save "Catppuccin Latte"
# fish_config theme save "Catppuccin Macchiato"
# fish_config theme save "Catppuccin Mocha"

source ~/.asdf/asdf.fish

zoxide init fish | source
starship init fish | source
