#!/bin/bash

IMAGE_SRC=$1
URL=https://westus.api.cognitive.microsoft.com/vision/v1.0/describe
API_KEY={KEY}

if [ -e "$IMAGE_SRC" ]
then
    echo Generating caption...
    curl -Ss --request POST --header "Ocp-Apim-Subscription-Key: $API_KEY" \
    --header "Content-Type: application/octet-stream" \
    --data-binary "@$IMAGE_SRC" $URL | \
    python3 -c "import sys, json; print(json.load(sys.stdin)['description']['captions'][0]['text'])"
else
    echo "Error: File does not exist: $IMAGE_SRC"
fi
