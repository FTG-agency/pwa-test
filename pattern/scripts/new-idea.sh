#!/usr/bin/env bash
set -euo pipefail
ROOT="/Users/leopav/Library/Mobile Documents/iCloud~md~obsidian/Documents/private-management"
TEMPLATE="$ROOT/idea-template"
DEST_ROOT="$ROOT/ideas"
if [ $# -lt 1 ]; then
  echo "usage: $0 idea-slug [--with-date]" >&2
  exit 1
fi
slug="$1"
date_prefix=""
if [ "${2-}" = "--with-date" ]; then
  date_prefix="$(date +%F)-"
fi
dest="$DEST_ROOT/${date_prefix}${slug}"
mkdir -p "$DEST_ROOT"
cp -R "$TEMPLATE" "$dest"
echo "Created $dest"
# Опционально открываем черновик идеи (macOS)
open "$dest/raw-idea.md" 2>/dev/null || true
