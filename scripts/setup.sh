#!/usr/bin/env bash

resolve-url() {
	curl -w "%{url_effective}\n" -I -L -s -S "$1" -o /dev/null;
}

install-nix() {
	NIXURL=$(resolve-url $NIXURL)
	mkdir -p "$NIXDIR"
	curl --output "$NIXPATH" "$NIXURL"
	chmod +x "$NIXPATH"
}

source ./vars.sh
if [ ! -f "$NIXPATH" ]; then install-nix; fi
export PATH="$PATH:$NIXDIR"
