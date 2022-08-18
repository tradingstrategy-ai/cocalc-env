install:
	git clone --recursive https://github.com/tradingstrategy-ai/trade-executor deps/trade-executor
	poetry shell
	poetry install

update-deps: 
	rm -rf deps/
	git clone --recursive https://github.com/tradingstrategy-ai/trade-executor deps/trade-executor
	poetry shell
	poetry lock --no-update

build:
	docker build -t trading-strategy-jupyter-env:latest .