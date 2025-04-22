# 🎧 Ubuntu VMware Audio Fix

This script disables PipeWire (which may cause glitches on VMware), and switches to PulseAudio for stable output.

## 🔧 What it does

- Disables all PipeWire-related services
- Enables and starts PulseAudio
- Optionally removes PipeWire packages
- Tests sound output

## ▶️ Usage

```bash
chmod +x fix-audio.sh
./fix-audio.sh
