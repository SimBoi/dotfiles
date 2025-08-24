source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

fzf --fish | source
zoxide init fish | source
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
thefuck --alias | source

alias cat=bat
alias cd=z
alias ssh-server='ssh debian@simboi.com -p 16922'

# uv
fish_add_path "/home/sim/.local/share/../bin"
