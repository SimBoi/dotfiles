#!/usr/bin/env bash

apps_dir=(
  /usr/share/applications
  ~/.local/share/applications
)

declare -A map

selected=$( 
    for dir in "${apps_dir[@]}"; do
        [ -d "$dir" ] || continue
        while IFS= read -r file; do
            desktop_id=$(basename "$file" .desktop)
            name=$(grep -m1 '^Name=' "$file" | cut -d= -f2-)
            icon=$(grep -m1 '^Icon=' "$file" | cut -d= -f2-)
            [ -n "$name" ] || continue
            echo -e "$name [$desktop_id]\0icon\x1f$icon"
        done < <(find "$dir" -type f -name "*.desktop")
    done | rofi -dmenu -i -p "Choose app ~ " -show-icons
)

desktop_id=$(echo "$selected" | sed 's/.*\[\(.*\)\]/\1/')
echo "$desktop_id"
