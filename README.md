# Trading Strategy CoCalc environment

Dockerized CoCalc environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).

## Prerequisites

* Docker 
* Docker Compose
* [Based on CoCalc Docker image](https://github.com/sagemathinc/cocalc-docker/tree/master)

## Limitations

* *Must be* run in port 8080 if no HTTPS (something wrong with the CoCalc base image)

## Get started

Clone this repository:

```shell
git clone https://github.com/tradingstrategy-ai/cocalc-env.git
cd cocalc-end

# Pull in trade-executor pinned down branch
git submodule update --init --recursive  
```

Use docker compose to bring up the environment:

```shell
docker-compose up -d
```

The default port is `8080` but you can also use different port if you want, for example:

```shell
export COCALC_ENV_BIND=9999
docker-compose up -d

# or one liner
COCALC_ENV_BIND=9999 docker-compose up -d
```

Then open `http://localhost:9999` in your web browser.
You can browse available

## Update to latest version of the pre-built environment

To update the current environment to the latest `trade-exeuctor` master:

```shell
docker-compose pull
docker-compose up -d
```

## Adding notebooks

The notebooks are mapped to `notebook` folder on your computer host file system.
You can copy in more notebooks, backup, et.

## Develop this environment

Build the Docker image from the scratch: 

```shell
git submodule update --init --recursive  
# Warning: 15 GB download
docker build -t ghcr.io/tradingstrategy-ai/cocalc-env:local .
```

Test the built image:

```shell
COCALC_ENV_VERSION=local docker-compose up 
```

Or:

```shell
docker run -v ~/cocalc:/projects -p 443:443 ghcr.io/tradingstrategy-ai/cocalc-env:local
```

```shell
docker run -v ~/cocalc:/projects --env NOSSL=true -p 9999:80 ghcr.io/tradingstrategy-ai/cocalc-env:local
```

Testing with vanilla CoCalc

```shell
docker run --name=cocalc --env NOSSL=true -d -v ~/cocalc:/projects -p 8080:80 sagemathinc/cocalc-v2
```

Then open `http://localhost:9999` in your web browser to test.

See [Dockerfile](./Dockerfile) for more details.
