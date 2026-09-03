# 粵語通 · realtime-talk

Realtime Cantonese → Japanese speech translator.

- **Web**: single-file HTML at `index.html`. Uses Web Speech API + Google Translate. Hosted on GitHub Pages.
- **iOS app**: Capacitor wrapper. Uses Apple's SFSpeechRecognizer directly (`@capacitor-community/speech-recognition`), which is much more reliable than Web Speech API in Safari.

The same `index.html` runs in both — it detects `window.Capacitor` at runtime and switches speech backends automatically.

## Web (GitHub Pages)

    https://sanae-takasu.github.io/realtime-talk/

## iOS app — first-time setup

Requires macOS with Xcode and Node 18+.

    git clone https://github.com/sanae-takasu/takasu/realtime-talk
    cd realtime-talk
    npm install
    npx cap add ios          # scaffolds the ios/ Xcode project (first time only)
    npm run cap:sync         # copies www/ into the Xcode project + installs pods
    npm run cap:ios          # opens Xcode

In Xcode:

1. Connect iPhone via USB, unlock, tap **Trust**.
2. Toolbar device selector → pick your iPhone.
3. Select the **App** target → **Signing & Capabilities** → set your Apple ID **Team** (free Apple ID works for personal-device install).
4. **App target → Info** — the plugin auto-adds these; verify they're present:
   - `NSMicrophoneUsageDescription` — "This app needs the microphone to recognize your Cantonese speech."
   - `NSSpeechRecognitionUsageDescription` — "This app uses speech recognition to transcribe Cantonese."
5. Press **▶ Run**.

First launch on the phone: allow **Microphone** and **Speech Recognition** when prompted.

## Iterating

    # edit index.html
    npm run cap:sync         # copies updated web to ios/App/App/public
    # then Cmd+R in Xcode to rerun on the phone

## Notes

- The Cantonese language tag is `zh-HK` on Apple (not `yue-Hant-HK`, which is Web Speech only).
- Google Translate uses `zh-TW` → `ja` (no dedicated `yue` code); colloquial Cantonese particles may translate unnaturally.
- To swap to Claude/OpenAI for better translation quality, replace the `translate()` function in `index.html` and add an API key via a Supabase edge function or similar.
