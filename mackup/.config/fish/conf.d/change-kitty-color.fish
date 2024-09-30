#!/usr/bin/env fish

if test $SHLVL -eq 1 -a $TERM = "xterm-kitty"
    # Get current system appearance
    set system_appearance (defaults read -g AppleInterfaceStyle 2>/dev/null)
    if test $status -eq 0
        # Command succeeded, use the result
        # echo "System appearance is $system_appearance"
    else
        # Command failed, assume light appearance
        set system_appearance "Light"
    end

    # Set path to themes folder
    set themes_folder "$HOME/.config/kitty/themes"

    # Set kitty color based on system appearance
    if test $system_appearance = "Dark"
        kitten themes "Everforest Dark Medium"
        # kitty @ set-colors -a -c "$themes_folder/Everforest Dark Medium.conf"
    else
        kitten themes "Everforest Light Medium"
        # kitty @ set-colors -a -c "$themes_folder/Everforest Light Medium.conf"
    end
end
