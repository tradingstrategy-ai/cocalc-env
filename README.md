# Trading Strategy Jupyter environment

Dockerized Jupyter environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).

## Prerequisites

* Docker 
* Docker Compose
* Github account
* Github [PAT](https://github.com/settings/tokens) (Personal Access Token) with `read:packages` permission 

## Get started

If you don't have a PAT yet, you can [generate a new one here](https://github.com/settings/tokens/), the scope has to be `read:packages`  

Authenticate to Github Container Registry:

```shell
docker login ghcr.io
Username: <YOUR GITHUB USERNAME>
Password: <YOUR PAT>
```

Clone this repository:

```shell
git clone https://github.com/tradingstrategy-ai/jupyter-env.git
cd jupyter-env
```

Use docker compose to bring up the environment:

```shell
docker-compose up -d
```

Then open `http://localhost:8989` in your web browser and start hacking.

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
