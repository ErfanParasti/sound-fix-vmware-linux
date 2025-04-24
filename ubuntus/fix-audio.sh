#!/bin/bash

# ===============================
# 🎧 Fix Audio Issues in Ubuntu VM
# By: YourName (GitHub: yourusername)
# ===============================

echo "🔧 Starting audio fix script for Ubuntu VM..."

# Helper to print section headers
function section {
  echo
  echo "==============================="
  echo "🔹 $1"
  echo "==============================="
}

# Helper for command execution
function run_cmd {
  echo "▶️ $1"
  eval "$1" 2>&1 | tee -a fix-audio.log
  if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo "❌ Error running: $1"
    ERRORS+=("$1")
  else
    echo "✅ Success: $1"
  fi
  echo
}

# Array to hold failed commands
ERRORS=()

# --- Step 1: Disable PipeWire ---
section "Disabling PipeWire"
run_cmd "systemctl --user --now disable pipewire.socket pipewire-pulse.socket"
run_cmd "systemctl --user mask pipewire.service pipewire-pulse.service pipewire.socket pipewire-pulse.socket"

# --- Step 2: Enable and Restart PulseAudio ---
section "Enabling PulseAudio"
run_cmd "systemctl --user enable pulseaudio"
run_cmd "systemctl --user restart pulseaudio"

# --- Step 3: Reminder to edit .vmx (Optional) ---
section "Optional VMX Tip"
echo "💡 Optional: Edit your .vmx file and add this line if needed:"
echo '   sound.virtualDev = "es1371"'
echo

# --- Step 4: Prompt to reboot ---
section "Reboot Required"
echo "🚀 All done! Please reboot your system manually to apply changes."
echo "You can reboot now by running:"
echo "   sudo reboot"
echo

# --- Step 5: Summary ---
section "Summary"
if [ ${#ERRORS[@]} -eq 0 ]; then
  echo "✅ All steps completed successfully!"
else
  echo "⚠️ The following commands had issues:"
  for cmd in "${ERRORS[@]}"; do
    echo "  ❌ $cmd"
  done
  echo
  echo "Check the log file 'fix-audio.log' for details."
fi