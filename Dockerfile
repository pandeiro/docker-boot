FROM pandeiro/oracle-jdk8:latest
MAINTAINER Murphy McMahon <pandeiro.docker@gmail.com>

# Get Boot
RUN apt-get update \
    && apt-get install -y curl

RUN curl -s https://api.github.com/repos/boot-clj/boot/releases \
    | grep 'download_url.*boot\.sh' | head -1 |sed 's@^.*[:] @wget -O /usr/bin/boot @' \
    | bash \
    && chmod +x /usr/bin/boot

# Config Boot to run as root and use maven cache
ENV BOOT_AS_ROOT yes
ENV BOOT_LOCAL_REPO /m2
ENV BOOT_HOME /.boot

# Run `boot` a first time and cache everything in /m2
RUN mkdir /m2
RUN boot -vv

# Mount applications in /app
RUN mkdir /app
WORKDIR /app
VOLUME ["/app"]

ENTRYPOINT ["boot"]

#
# Usage:
#
#     docker run -v $(pwd):/app -v ~/.m2:/m2 -v ~/.boot:/.boot pandeiro/boot run
#
