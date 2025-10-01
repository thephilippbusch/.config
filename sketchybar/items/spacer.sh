#!/bin/bash

# Adds aerospace workspaces to sketchybar
sketchybar --add event aerospace_workspace_change

sketchybar --add item spacer left \
           --subscribe spacer aerospace_workspace_change \
           --set spacer click_script="sketchybar -m --set \$NAME popup.drawing=toggle" \
                        label="$(aerospace list-workspaces --focused)" \
                        label.padding_left=0 \
                        icon.padding_right=0 \
                        popup.background.color=$BAR_COLOR \
                        script="$PLUGIN_DIR/spacer.sh"

for sid in $(aerospace list-workspaces --monitor all --empty no); do
    sketchybar --add item space.$sid popup.spacer left \
               --set space.$sid \
                     background.color=$ACCENT_COLOR \
                     background.drawing=off \
                     label="$sid" \
                     label.color=$WHITE \
                     label.highlight_color=$BAR_COLOR \
                     label.highlight=off \
                     label.padding_left=10 \
                     icon.drawing=off \
                     click_script="aerospace workspace $sid;
                                   sketchybar -m --set spacer popup.drawing=off" \
                     script="$PLUGIN_DIR/aerospace.sh $sid"
done
