#!/bin/sh

BUILD_ID=$1

ARTIFACT_LIST_URL="https://dev.azure.com/ALttPO/alttpo/_apis/build/builds/${BUILD_ID}/artifacts?api-version=4.1"

SERVER_URL="$(curl -s "$ARTIFACT_LIST_URL" | jq -r '.value[] | select(.name | test("^alttpo-server-linux")) | .resource.downloadUrl')"

curl -s "$SERVER_URL" > server.zip
unzip -j server.zip '*/alttp-server'
rm server.zip
