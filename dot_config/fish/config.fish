source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# opencode
fish_add_path /home/waljr/.opencode/bin

# starship prompt (kurulu değilse sessizce atlanır)
if command -q starship
    starship init fish | source
end
