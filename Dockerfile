# Base image
FROM docker.io/library/archlinux:base-devel

# Install dependencies
RUN pacman -Syu --needed --noconfirm pacman-contrib namcap git

# Setup user
RUN useradd -m builder && \
    echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
WORKDIR /home/builder
USER builder

# Copy files
COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
