# 🎧 Fix Audio Glitches in Kali Linux VM (VMware)

> **Annoyed by audio crackling, stuttering, or silence in your Kali VM?**  
> Here’s a reliable fix that brings **smooth, stable sound** by switching from PipeWire to trusty old PulseAudio inside VMware.

---

## ⚙️ Supported Setup

| Component           | Recommended Version |
|--------------------|---------------------|
| Kali Linux          | Latest Rolling      |
| VMware Workstation | Any recent version  |
| Audio Device       | `hdaudio` or `es1371` |

---

## ❌ Step 1 – Disable PipeWire

PipeWire is modern, but not VM-friendly. Shut it down completely:

```bash
systemctl --user --now disable pipewire.socket pipewire-pulse.socket
systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket
```
> Tip: This ensures PipeWire won’t auto-start in future sessions.




---

✅ Step 2 – Enable PulseAudio

Let’s bring back good old PulseAudio:
```bash
systemctl --user enable pulseaudio
systemctl --user restart pulseaudio
```
---

🔁 Step 3 – Reboot the VM
```bash
reboot
```
Give it a fresh start!


---

🎼 Step 4 – Test Your Audio
```bash
speaker-test -t wav -c 2
```
Or go to:

Settings → Sound

And make sure your output device is set correctly.


---

🛠️ Optional: VMX Config Tweak

If audio is still buggy, edit your .vmx file:
`
sound.virtualDev = "es1371"
_or_
sound.virtualDev = "hdaudio"
`
These virtual devices are often more compatible with PulseAudio.


---

✍️ Feedback Welcome!

If this helped you, give the repo a ⭐ or open an Issue or Pull Request with suggestions or confirmations!


---

📄 License

Released under the MIT License.


---

> Built for hackers who like clean audio as much as clean shells.




---

▶️ Ready-to-Run Script

Clone the repo and run the script directly:
```bash
git clone https://github.com/ErfanParasti/sound-fix-vmware-linux.git

cd ./sound-fix-vmware-linux/kali

chmod +x fix-audio.sh

./fix-audio.sh
```
---



