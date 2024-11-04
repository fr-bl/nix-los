#!/usr/bin/env bash
source ./vars.sh

mkdir -p "$NIXCONFIG"
cp ./config/* "$NIXCONFIG"
