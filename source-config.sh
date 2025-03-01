#!/bin/bash

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.config/nvim"

echo "Syncing Nvim configuration from '$SOURCE_DIR' to '$TARGET_DIR'..."

rm -rf "$TARGET_DIR"/*
cp -R "$SOURCE_DIR"/* "$TARGET_DIR"/

echo "Sync completed!"

