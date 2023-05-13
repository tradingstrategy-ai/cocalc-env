FROM python:3.10.9

RUN apt-get update && \
    apt-get install build-essential curl git nodejs htop -y && \
    pip install --no-cache --upgrade pip && \
    curl -sSL https://install.python-poetry.org | python - --version 1.3.0

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

# install dependencies
COPY pyproject.toml poetry.lock ./
COPY deps ./deps/
RUN poetry config virtualenvs.create false && \
    poetry install --only main --no-interaction --no-ansi

CMD ["jupyter-lab"]
