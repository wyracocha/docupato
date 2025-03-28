#!/bin/bash
CONTENT=$($PWD/scripts/requests.sh | jq .output[0].content[0].text)
echo -e $CONTENT > /tmp/out.txt
# removing code separators
sed '1,1d' /tmp/out.txt  >> /tmp/out2.txt
sed '$d' /tmp/out2.txt  >> out.txt
# building image from .mmd
podman run --rm -u $(id -u):$(id -g) -v $PWD:/data:z --userns keep-id ghcr.io/mermaid-js/mermaid-cli/mermaid-cli -i out.mmd
