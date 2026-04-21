#!/bin/bash
set -euo pipefail

mkdir -p /tmp/runtime-abc
chown abc:abc /tmp/runtime-abc

cat >/tmp/webtop-user-init.sh <<'EOF'
#!/bin/bash
set -euo pipefail

export HOME=/config
export XDG_RUNTIME_DIR=/tmp/runtime-abc

# Start PulseAudio for the desktop session.
pulseaudio --check 2>/dev/null || pulseaudio --start --exit-idle-time=-1
sleep 2

# Create an internal sink so OBS can capture desktop audio generated inside Webtop.
if ! pactl list short sinks | awk '{print $2}' | grep -qx "DesktopAudio"; then
  pactl load-module module-null-sink \
    sink_name=DesktopAudio \
    sink_properties=device.description=DesktopAudio >/dev/null
fi
pactl set-default-sink DesktopAudio
EOF

chmod +x /tmp/webtop-user-init.sh
chown abc:abc /tmp/webtop-user-init.sh

su -s /bin/bash abc -c "/tmp/webtop-user-init.sh"
