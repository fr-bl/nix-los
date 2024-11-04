#!/usr/bin/env bash
SOURCE_DIR=./nix-los
git clone --depth 1 https://github.com/fr-bl/nix-los "$SOURCE_DIR"

chmod +x "$SOURCE_DIR"/*.sh
./"$SOURCE_DIR"/shell.sh
