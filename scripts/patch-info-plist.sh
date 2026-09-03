#!/usr/bin/env bash
# Idempotently add mic + speech-recognition usage descriptions to iOS Info.plist.
# iOS crashes any app that touches these APIs without a usage string, and
# @capacitor-community/speech-recognition doesn't inject them itself.
set -euo pipefail

PLIST="ios/App/App/Info.plist"
[ -f "$PLIST" ] || { echo "no Info.plist at $PLIST — run 'npx cap add ios' first"; exit 0; }

MIC_MSG="広東語の音声を認識するためにマイクを使います"
SPEECH_MSG="広東語を書き起こすために音声認識を使います"

add_or_set() {
  local key="$1" val="$2"
  if /usr/libexec/PlistBuddy -c "Print :$key" "$PLIST" >/dev/null 2>&1; then
    /usr/libexec/PlistBuddy -c "Set :$key '$val'" "$PLIST"
    echo "  updated $key"
  else
    /usr/libexec/PlistBuddy -c "Add :$key string '$val'" "$PLIST"
    echo "  added $key"
  fi
}

echo "patching $PLIST"
add_or_set NSMicrophoneUsageDescription       "$MIC_MSG"
add_or_set NSSpeechRecognitionUsageDescription "$SPEECH_MSG"
