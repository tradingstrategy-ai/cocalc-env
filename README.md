# Trading Strategy Jupyter environment

Jupyter environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).


## Get started


```shell
docker-compose up -d
```

Then you can open `http://localhost:8989` in your local web browser.

## Develop this environment

To build the Docker image from the scratch: 

```shell
make install
docker build -t trading-strategy-jupyter-env:latest .
```

To test the built image:

```shell
docker-compose up -d
```

Then you can open `http://localhost:8989` in your local web browser.

See [Dockerfile](./Dockerfile) for more details.
