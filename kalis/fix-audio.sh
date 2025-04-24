#!/bin/bash

# ===============================
# 🔧 Kali Linux Audio Fix Script
# ===============================

echo "🔧 Starting audio fix for Kali Linux..."

function section {
  echo
  echo "==============================="
  echo "🔹 $1"
  echo "==============================="
}

function run_cmd {
  echo "▶️ $1"
  eval "$1" 2>&1 | tee -a fix-audio-kali.log
  if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "❌ Error running: $1"
    ERRORS+=("$1")
  else
    echo "✅ Success: $1"
  fi
  echo
}

ERRORS=()

section "Disabling PipeWire"
run_cmd "systemctl --user --now disable pipewire.socket pipewire-pulse.socket"
run_cmd "systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket"

section "Enabling PulseAudio"
run_cmd "systemctl --user enable pulseaudio"
run_cmd "systemctl --user restart pulseaudio"

section "Optional .vmx Advice"
echo '💡 Optional tweak (in VMware):'
echo '   sound.virtualDev = "es1371"'

section "Reboot Advice"
echo "🚀 Done! Please reboot the system to apply changes:"
echo "   sudo reboot"

section "Summary"
if [ ${#ERRORS[@]} -eq 0 ]; then
  echo "✅ All steps completed successfully!"
else
  echo "⚠️ Issues occurred in:"
  for cmd in "${ERRORS[@]}"; do
    echo "  ❌ $cmd"
  done
  echo "Check fix-audio-kali.log for details."
fi