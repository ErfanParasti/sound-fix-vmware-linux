
# 🎧 Fix Audio Glitches in Ubuntu VM (VMware)

> **Tired of audio crackling, stuttering, or vanishing in your Ubuntu VM?**  
> Here's a clean, proven fix that **restores smooth sound** by switching from PipeWire back to the old, stable PulseAudio inside VMware.

---

## ⚙️ Supported Setup

| Component       | Recommended Version |
|----------------|---------------------|
| Ubuntu          | 24.10 (or newer)    |
| VMware Workstation | Any recent version |
| Audio Device    | `hdaudio` or `es1371` |

---

## ❌ Step 1 – Disable PipeWire

PipeWire is modern but can be unstable inside VMs. Let’s shut it down completely:

```bash
systemctl --user --now disable pipewire.socket pipewire-pulse.socket
systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket
```

> Tip: This ensures PipeWire won’t auto-start in future sessions.




---

✅ Step 2 – Enable PulseAudio

Let’s bring back good old PulseAudio:

```
systemctl --user enable pulseaudio
systemctl --user restart pulseaudio

```
---

🔁 Step 3 – Reboot the VM
```
reboot
```
Give it a fresh start!


---

🎼 Step 4 – Test Your Audio
```
Run a test or just go to settings:

speaker-test -t wav -c 2
```

Or open:

Settings → Sound

Make sure you’ve selected the correct output device and that audio is smooth.


---

🛠️ Optional: VMX Config Tweak

If audio is still weird, tweak your .vmx file:
```
sound.virtualDev = "es1371"
```

This virtual device is known to behave better with PulseAudio.


---

✍️ Feedback Welcome!

If this helped you, give the repo a ⭐ or open an Issue or Pull Request with improvements or confirmations!


---

📄 License

Released under the MIT License.


---

> Made with patience, tested with frustration, shared with love.


