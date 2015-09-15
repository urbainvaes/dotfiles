#!/bin/bash

# Default search engine. If we really are at a loss, use this
DEFAULT_SEARCH=google

# The location of the surfraw bookmark file
BOOKMARKS="$HOME/.surfraw.bookmarks"

# Colors for dmenu
COLORS=" -nb #303030 -nf khaki -sb #CCFFAA -sf #303030"

# Prompt for dmenu
PROMPT="Open"

# Use surfraw to search for the words
function search()
{
    # Does surfraw know what to do with it?
    url=`surfraw -print $@`

    # If not, then use the default search engine
    if [ $? -ne 0 ]
    then
        url=`surfraw -print $DEFAULT_SEARCH $@`
    fi

    echo $url
}

# We assume that this is a URL
function goto()
{
    case "$1" in
        *:*) echo $1 ;;
        *) echo "http://$1" ;;
    esac
}

# Use dmenu to navigate through possible choices
function present_menu()
{
    elvi=`surfraw -elvi | cut -f 1 | tail --lines=+2`
    if [ -r "$BOOKMARKS" ]
    then
        bookmarks=" `cut -f 1 -d ' ' "$BOOKMARKS" 2>/dev/null`"
    else
        bookmarks=""
    fi

    echo "${elvi}${bookmarks}" | tr ' ' '\n' | sort | dmenu -p "$PROMPT" -i $COLORS
}

present_menu | \
    ( read car cdr
test -z "$car" && exit 1
( test -z "$cdr" && echo $car | fgrep -c '.
:' > /dev/null && goto $car ) || search "$car $cdr" )
