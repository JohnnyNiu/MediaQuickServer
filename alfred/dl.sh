#!/usr/bin/env bash
set -x

[ -z "$(which jq)" ] && echo 'Please install jq cli' && exit 1;
[ -z "$(which yq)" ] && echo 'Please install yq cli' && exit 1;

[ -z "$(lsof -i:7899)" ] &&\
 echo "Need start Media Quick Server(https://github.com/JohnnyNiu/MediaQuickServer)" &&\
 (cd ~/Dev/personal/MediaQuickServer && java -jar target/media-quick-server-1.4.0.jar&)
dy_meta_file="$HOME/tmp/dy_meta_file.txt"

touch $dy_meta_file
## Use copy the link

echo "share: $(pbpaste)" > ${dy_meta_file}

videoMetaResp=$(curl -s --location --request POST 'http://localhost:7899/media/quick/v1/media/parse' \
--header 'Content-Type: text/plain' --data-raw "$(pbpaste)")

#Do not copy verbose response
#echo ${videoMetaResp} | jq .body.data | yq e -P >> ${dy_meta_file}

videoUrl=$(echo ${videoMetaResp} | jq -r '.body.data.media.urls[0]')

echo $videoUrl
rm ~/tmp/tmp-dy-video.mp4

curl -kL -A "Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/81.0" \
"$videoUrl" -o ~/tmp/tmp-dy-video.mp4