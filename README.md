# Boot Docker Image

A Boot image based on Debian Wheezy and
[Oracle JDK8](https://github.com/pandeiro/docker-oracle-jdk8).

## Build

```bash
git clone https://github.com/pandeiro/docker-boot && cd docker-boot

docker build -t 'boot' .
```

## Pre-built

```bash
docker pull pandeiro/boot
```

## Usage

```bash
docker run \
    -v $HOME/.m2/repository:/m2 \
    -v $(pwd):/app \
    -p 8080:8080 \
    pandeiro/boot \
    boot <my-run-task>
```

## License

Copyright © 2015 Murphy McMahon

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

