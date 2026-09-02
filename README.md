# 粵語通 · realtime-talk

Realtime Cantonese → Japanese speech translator. Single HTML file, no build.

- **Speech recognition**: Web Speech API (`yue-Hant-HK` with fallback to `zh-HK`, `zh-yue`, `yue`, `zh-CN`).
- **Translation**: Google's public unauthenticated translate endpoint (`zh-TW` → `ja`). No API key.
- **Host**: GitHub Pages — needs its own origin so Safari/Chrome will grant microphone access.

## Live URL

Once GitHub Pages is enabled (Settings → Pages → Source: **GitHub Actions**):

    https://sanae-takasu.github.io/realtime-talk/

Open in iPhone Safari or desktop Chrome, tap the mic, speak Cantonese.

## Local dev

    python3 -m http.server 8080
    # open http://localhost:8080

`file://` won't work — Web Speech API requires a `https://` or `http://localhost` origin.

## Notes

- Google Translate's Cantonese support is imperfect (no dedicated `yue` code — we use traditional Chinese `zh-TW`). Colloquial particles like 咗/嘅/喺度 may not always translate idiomatically. Swap in a paid LLM API for better quality.
- Web Speech API on Android Chrome usually lacks a Cantonese model. iPhone Safari and desktop Chrome are the reliable targets.
