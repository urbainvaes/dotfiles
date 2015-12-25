#!/usr/bin/env bash
DEFAULT_SEARCH=startpage
string=$1
cmd=$2
set -- $string
is_elvi=$(surfraw -elvi | grep -c "^$1\s")
nbr_words=$(echo "$string" | wc -w)
if [ "$nbr_words" -eq 1 ] && [ "$is_elvi" -eq 0 ] && ([[ "$string" == *.* ]] || [[ "$string" == *:* ]])
then
    url="$1"
elif [ $is_elvi -eq 1 ]
then
    url="$(surfraw -print $string)"
else
    url="$(surfraw -print $DEFAULT_SEARCH $string)"
fi
echo "$cmd $url" > $UZBL_FIFO
