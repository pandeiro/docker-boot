# Boot Docker Image

A Boot image based on the official Alpine /
[OpenJDK 8](https://hub.docker.com/_/java/) image.

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
    -v $HOME/.boot:/.boot \
    -v $HOME/.m2/repository:/m2 \
    -v $(pwd):/app \
    -p 8080:8080 \
    pandeiro/boot:2.7.1 \
    <my-run-task>
```

## License

Copyright © 2015 Murphy McMahon

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

