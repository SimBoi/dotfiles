source /usr/share/cachyos-fish-config/cachyos-config.fish

# default apps
export EDITOR=code

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

# -------------------------------------------------------------------
# open-with: pick an app with rofi/dmenu and optionally set as default
# -------------------------------------------------------------------
function open-with
    for file in $argv
        set mime (file --mime-type -b $file)
        set chosen (bash ~/.config/rofi/choose-desktop.sh "$mime")

        if test -n "$chosen"
            # ask user if they want to set as default
            set answer (printf "Yes\nNo" | rofi -dmenu -p "Set $chosen as default for $mime?")
            if test "$answer" = "Yes"
                xdg-mime default "$chosen.desktop" "$mime"
            end

            gtk-launch $chosen $file &
        else
            echo "No app selected for $file"
        end
    end
end

# -------------------------------------------------------------------
# open: default open function
# tries default app, falls back to open-with
# -------------------------------------------------------------------
function open
    for file in $argv
        # URLs: use xdg-open
        if string match -r '^[a-zA-Z]+://' $file
            setsid xdg-open $file >/dev/null 2>&1 < /dev/null &
        else
            # local file: check default handler
            set mime (file --mime-type -b $file)
            set handler (xdg-mime query default $mime | string replace -r '\.desktop$' '')
            if test -n "$handler"
                gtk-launch $handler $file &
            else
                # fallback to open-with
                open-with $file
            end
        end
    end
end
