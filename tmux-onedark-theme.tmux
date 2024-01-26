#!/usr/bin/env bash

onedark_black="#282c34"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_dark_yellow="#d19a66"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_green="#98c379"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"

set "message-style" "fg=$onedark_blue,bg=$onedark_black"
set "message-command-style" "fg=$onedark_black,bg=$onedark_blue"

set "mode-style" "fg=$onedark_black,bg=$onedark_dark_yellow"

set "copy-mode-match-style" "fg=$onedark_black,bg=$onedark_yellow"
set "copy-mode-current-match-style" "fg=$onedark_black,bg=$onedark_dark_yellow"

set "status-style" "none"
set "status-left-style" "none"
set "status-right-style" "none"

setw "window-status-style" "fg=$onedark_black,bg=$onedark_black"
setw "window-status-activity-style" "fg=$onedark_black,bg=$onedark_black"

setw "window-status-separator" ""

set "window-style" "none"
set "window-active-style" "none"

set "pane-border-style" "fg=$onedark_white"
set "pane-active-border-style" "fg=$onedark_yellow"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_black"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%d/%m/%Y")

set "status-right" "#[fg=$onedark_white,bg=$onedark_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$onedark_visual_grey,bg=$onedark_black]#[fg=$onedark_visual_grey,bg=$onedark_visual_grey]#[fg=$onedark_white, bg=$onedark_visual_grey]${status_widgets} #[fg=$onedark_green,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=$onedark_black,bg=$onedark_green,bold] #h #[fg=$onedark_yellow, bg=$onedark_green]#[fg=$onedark_red,bg=$onedark_yellow]"
set "status-left" "#[fg=$onedark_black,bg=$onedark_green,bold] #S #{prefix_highlight}#[fg=$onedark_green,bg=$onedark_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$onedark_black,bg=$onedark_black,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=$onedark_black] #I  #W#{?window_zoomed_flag,+,} #[fg=$onedark_black,bg=$onedark_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$onedark_black,bg=$onedark_visual_grey,nobold,nounderscore,noitalics]#[fg=$onedark_white,bg=$onedark_visual_grey,nobold] #I  #W#{?window_zoomed_flag,+,} #[fg=$onedark_visual_grey,bg=$onedark_black,nobold,nounderscore,noitalics]"
