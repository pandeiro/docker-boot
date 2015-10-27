FROM pandeiro/oracle-jdk8:8u66
MAINTAINER Murphy McMahon <pandeiro.docker@gmail.com>

# Get Boot
RUN apt-get update

RUN wget --quiet -O /usr/bin/boot https://github.com/boot-clj/boot/releases/download/2.3.0/boot.sh \
    && chmod +x /usr/bin/boot

# Config Boot to run as root and use maven cache
ENV BOOT_AS_ROOT yes
ENV BOOT_LOCAL_REPO /m2
ENV BOOT_HOME /.boot

# Run `boot` a first time and cache everything in /m2
RUN mkdir /m2
RUN boot -d boot:2.3.0 -vv

# Mount applications in /app
RUN mkdir /app
WORKDIR /app
VOLUME ["/app"]

ENTRYPOINT ["boot"]

#
# Usage:
#
#     docker run -v $(pwd):/app -v ~/.m2/repository:/m2 -v ~/.boot:/.boot pandeiro/boot run
#
