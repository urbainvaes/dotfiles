#!/bin/bash
cd ~/Downloads                                   # change this line to determine where the file is saved
python2 youtube-dl -o %\(title\)s.%\(ext\)s "$1" # -o output template is optional
# play with mplayer after download
savename=`python2 youtube-dl -o %\(title\)s.%\(ext\)s --get-filename "$1"`
mplayer -really-quiet "$savename"
ratpoison -c "echo [ytdl-uzbl] $1 done."         # change this line to change how you are notified of a
                                                 # completed download
