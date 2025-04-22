
---

## 🐧 محتوای `ubuntu/fix-audio.sh`:

```bash
#!/bin/bash

echo "🔧 Fixing audio in Ubuntu VM..."

echo "👉 Disabling PipeWire..."
systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket

echo "👉 Installing PulseAudio if needed..."
sudo apt install -y pulseaudio pulseaudio-utils

echo "👉 Starting PulseAudio manually..."
pulseaudio --start

echo "👉 Removing PipeWire (optional)..."
# Uncomment if you want to remove it entirely:
# sudo apt remove -y pipewire pipewire-audio-client-libraries

echo "✅ Done! Test audio with:"
echo "   speaker-test -t wav -c 2"
