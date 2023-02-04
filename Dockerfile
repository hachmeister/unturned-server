FROM debian:bookworm-slim

# Insert Steam prompt answers
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN echo steam steam/question select "I AGREE" | debconf-set-selections \
 && echo steam steam/license note '' | debconf-set-selections

# Install steamcmd command
ARG DEBIAN_FRONTEND=noninteractive
RUN sed -i 's/: main/: main non-free/' /etc/apt/sources.list.d/debian.sources \
 && dpkg --add-architecture i386 \
 && apt-get update -y \
 && apt-get install -y --no-install-recommends ca-certificates locales steamcmd \
 && rm -rf /var/lib/apt/lists/*

# Add unicode support
RUN locale-gen en_US.UTF-8
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

# Create symlink for executable
RUN ln -s /usr/games/steamcmd /usr/bin/steamcmd

# Update SteamCMD and verify latest version
RUN steamcmd +quit

# Copy scripts to start unturned server
ADD src/StartServer.sh /
ADD src/Commands.dat /
ADD src/start-server /

ENTRYPOINT ["/start-server"]