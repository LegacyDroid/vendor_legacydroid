#!/bin/bash
# LegacyDroid SimpMusic build-time fetch (host tool, run by Android.mk).
# Downloads the latest release APK only when the release tag changed,
# so incremental builds are cheap while every full build is current.
set -e

OUT="$1"
STAMP="$2"
API="https://api.github.com/repos/maxrave-dev/SimpMusic/releases/latest"
DL="https://github.com/maxrave-dev/SimpMusic/releases/latest/download/SimpMusic-foss-universal-release.apk"

TAG="$(curl -fsS "$API" | grep -o '"tag_name": *"[^"]*"' | head -1 | sed 's/.*"\(.*\)"/\1/')"
if [ -z "$TAG" ]; then
    echo "simpmusic_fetch: could not determine latest release tag" >&2
    exit 1
fi

if [ -f "$STAMP" ] && [ "$(cat "$STAMP")" = "$TAG" ] && [ -f "$OUT" ]; then
    echo "simpmusic_fetch: already at $TAG"
    exit 0
fi

mkdir -p "$(dirname "$OUT")"
curl -fL --retry 3 -o "$OUT" "$DL"
echo "$TAG" > "$STAMP"
echo "simpmusic_fetch: fetched $TAG"
