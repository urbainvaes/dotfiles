export ZDOTDIR=$HOME/.zsh

# Guix stuff
export PATH="$HOME/bin:$HOME/.guix-profile/bin:$HOME/.guix-profile/sbin:$HOME/bin:/usr/lib/surfraw${PATH:+:}$PATH"
export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale
export GUIX_PACKAGE_PATH=$HOME/Dropbox/projects/guix-packages
export GUILE_LOAD_PATH=$HOME/.guix-profile/share/guile/site/2.2:$GUILE_LOAD_PATH
export GUILE_LOAD_COMPILED_PATH=$HOME/.guix-profile/lib/guile/2.2/site-ccache:$GUILE_LOAD_COMPILED_PATH
export CPATH="/home/urbain/.guix-profile/include${CPATH:+:}$CPATH"
export LIBRARY_PATH="/home/urbain/.guix-profile/lib${LIBRARY_PATH:+:}$LIBRARY_PATH"
