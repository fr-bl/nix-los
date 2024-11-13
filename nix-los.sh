#!/usr/bin/env bash

DIR="$(dirname "$(readlink -f "$0")")"
(cd "$DIR"/scripts && chmod +x ./*.sh && ./shell.sh)
