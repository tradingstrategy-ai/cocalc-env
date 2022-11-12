install:
	git clone --recursive https://github.com/tradingstrategy-ai/trade-executor deps/trade-executor
	poetry shell
	poetry install

build-local:
	docker build -t ghcr.io/tradingstrategy-ai/jupyter-env:local .

run-local:
	JUPYTER_ENV_VERSION=local docker-compose up -d