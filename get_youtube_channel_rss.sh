#!/bin/sh

# $1 -- YouTube channel address

CHANNEL_PAGE_SOURCE=/tmp/youtube_channel_page_source

wget -q -O $CHANNEL_PAGE_SOURCE $1
echo -n "https://www.youtube.com/feeds/videos.xml?channel_id="
cat "$CHANNEL_PAGE_SOURCE" | grep canonical | awk -F\" '{print $4}' | awk -F / '{print $5}'