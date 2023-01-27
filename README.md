# Trading Strategy Jupyter environment

Dockerized Jupyter environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).

## Prerequisites

* Docker 
* Docker Compose

## Get started

Clone this repository:

```shell
git clone https://github.com/tradingstrategy-ai/jupyter-env.git
cd jupyter-env
```

Use docker compose to bring up the environment:

```shell
docker-compose up -d
```

The default port is `8989` but you can also use different port if you want, for example:

```shell
export JUPYTER_ENV_BIND=9999
docker-compose up -d

# or one liner
JUPYTER_ENV_BIND=9999 docker-compose up -d
```

Then open `http://localhost:8989` or `http://localhost:<your chosen port number>` in your web browser and start hacking.

## Update to latest version of the pre-built environment

To update the current environment to latest version:

```shell
docker-compose pull
docker-compose up -d
```

## Develop this environment

Build the Docker image from the scratch: 

```shell
make install
docker build -t ghcr.io/tradingstrategy-ai/jupyter-env:local .
```

Test the built image:

```shell
JUPYTER_ENV_VERSION=local docker-compose up -d
```

Then open `http://localhost:8989` in your web browser to test.

See [Dockerfile](./Dockerfile) for more details.
