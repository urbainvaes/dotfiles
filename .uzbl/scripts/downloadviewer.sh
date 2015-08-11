#!/bin/sh
case "$1" in
*.pdf*) zathura "$1" & ;;
*.jpg*|*.png*|*.jpeg*) feh "$1" & ;;
*.txt*|*README*|*.pl*|*.sh*|*.py*|*.hs*|*.hl*) urxvt -e vim "$1" & ;;
*.mov*|*.avi*|*.mpeg*|*.mpg*|*.flv*|*.wmv*|*.mp4*) mplayer "$1" & ;;
esac
