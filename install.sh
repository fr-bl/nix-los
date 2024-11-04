#!/usr/bin/env bash
source ./vars.sh

resolve_url() {
	curl -w "%{url_effective}\n" -I -L -s -S "$1" -o /dev/null;
}

if [ ! -f "$NIXPATH" ]; then
	NIXURL=$(resolve_url $NIXURL)
	mkdir -p "$NIXDIR"
	curl --output "$NIXPATH" "$NIXURL"
	chmod +x "$NIXPATH"
fi
export PATH="$PATH:$NIXDIR"

./config.sh
