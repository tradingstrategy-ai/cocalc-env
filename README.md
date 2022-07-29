# Trading Strategy Jupyter environment

Dockerized Jupyter environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).


## Get started

Clone this repository.

Use docker compose to bring up the environment:

```shell
docker-compose up -d
```

Then open `http://localhost:8989` in your web browser and start hacking.


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
