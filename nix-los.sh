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

configure-nix() {
    mkdir -p "$NIXCONFIG"
    echo "experimental-features = nix-command flakes" >> "$NIXCONFIG"/nix.conf
}

NIXURL="https://hydra.nixos.org/job/nix/maintenance-2.14/buildStatic.x86_64-linux/latest/download-by-type/file/binary-dist";
NIXPATH=$HOME/bin/nix;
NIXDIR=$(dirname "$NIXPATH")
NIXCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nix"

if [ ! -f "$NIXPATH" ]; then install-nix; fi
export PATH="$PATH:$NIXDIR"
configure-nix