FROM lscr.io/linuxserver/webtop:fedora-xfce

RUN dnf install -y \
    chromium \
    firefox \
    obs-studio \
    pavucontrol \
    pulseaudio \
    pulseaudio-utils \
    xrandr \
    procps-ng \
    && dnf clean all

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

ENTRYPOINT ["/bin/bash", "-lc", "/usr/local/bin/startup.sh & exec /init"]
