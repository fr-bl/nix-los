#!/usr/bin/env bash

resolve_url() {
	curl -w "%{url_effective}\n" -I -L -s -S "$1" -o /dev/null;
}

source ./vars.sh
if [ ! -f "$NIXPATH" ]; then
	NIXURL=$(resolve_url $NIXURL)
	mkdir -p "$NIXDIR"
	curl --output "$NIXPATH" "$NIXURL"
	chmod +x "$NIXPATH"
fi
export PATH="$PATH:$NIXDIR"
