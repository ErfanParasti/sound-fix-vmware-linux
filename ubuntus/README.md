🛠️ Fix Audio Glitches in Ubuntu VM (VMware)

If you're experiencing **audio interruptions or stuttering** in your Ubuntu virtual machine (especially on **Ubuntu 24.10+ with PipeWire**), this guide helps you **switch back to PulseAudio** for better stability in VMware environments.

---

## 🧹 Disable PipeWire Completely

```bash
systemctl --user --now disable pipewire.socket pipewire-pulse.socket
systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket


---

💡 Enable and Restart PulseAudio

systemctl --user enable pulseaudio
systemctl --user restart pulseaudio


---

🔁 Reboot Your System

reboot


---

🔊 Test the Sound

After rebooting, check if audio is smooth and glitch-free:

speaker-test -t wav -c 2

Or go to Settings → Sound and verify the output device.


---

📝 Notes

Tested with:

Ubuntu 24.10

VMware Workstation

Sound device: hdaudio or es1371


Optional .vmx tweak:

sound.virtualDev = "es1371"



---

✅ Confirmed Working?

If this fix helped you, let me know via Issues or submit a Pull Request with improvements!


---

Licensed under MIT
