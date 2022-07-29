install:
	git clone --recursive https://github.com/tradingstrategy-ai/trade-executor deps/trade-executor
	poetry shell
	poetry install

build:
	docker build -t trading-strategy-jupyter-env:latest .