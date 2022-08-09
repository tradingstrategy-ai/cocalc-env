FROM python:3.10-slim

RUN apt-get update && \
    apt-get install build-essential curl git nodejs htop -y && \
    pip install --no-cache --upgrade pip && \
    curl -sSL https://install.python-poetry.org | python - --version 1.1.13

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

# install dependencies
COPY pyproject.toml poetry.lock ./
RUN git clone --recursive https://github.com/tradingstrategy-ai/trade-executor deps/trade-executor
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev --no-interaction --no-ansi

# copy config later so changing config won't force reinstall dependencies
COPY jupyter_config.py ./

CMD ["jupyter-lab", "--config", "jupyter_config.py"]