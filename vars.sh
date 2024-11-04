#!/usr/bin/env bash


NIXURL="https://hydra.nixos.org/job/nix/maintenance-2.14/buildStatic.x86_64-linux/latest/download-by-type/file/binary-dist";
NIXPATH=$HOME/bin/nix;
NIXDIR=$(dirname "$NIXPATH")
NIXCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nix"
