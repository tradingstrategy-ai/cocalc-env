# Trading Strategy CoCalc environment

Dockerized CoCalc environment for [Trading Strategy algorithmic trading framework and protocol](https://tradingstrategy.ai/).

## CoCalc benefits over vanilla Jupyter notebooks

- The notebook execution continues even if you close the browser or a notebook
- The output will correctly resumed and stored on the server

## Overview

- Comes with [Trading Strategy Python packages preinstalled](https://github.com/tradingstrategy-ai/trade-executor/)
- User database is managed via CoCalc's built-in PostgreSQL server
    - [Mapped to local file system for persistency](https://stackoverflow.com/a/41650891/315168)
- Any user can create their own CoCalc projects
    - Users' ipynb files will be under `cocalc-data/$UID`, a folder per user
- [Use Caddy web server to protect the instance using HTTP Basic Auth](https://caddy.community/t/using-caddyfiles-basic-auth-with-environment-variables-and-docker/19918)
    - Access log files with Caddy

## Prerequisites

To run this project you need:

* Docker 
* Docker Compose

## Limitations

* Choose `ipykernel` 

## Notes

* When you sign in you can create any user - there is no email verification
* [Based on CoCalc Docker image](https://github.com/sagemathinc/cocalc-docker/tree/master)

## Get started

Clone this repository:

```shell
git clone https://github.com/tradingstrategy-ai/cocalc-env.git
cd cocalc-end

# Pull in trade-executor pinned down branch
git submodule update --init --recursive  
```

Create HTTP Basic Auth username and password that will protect the server.
These are stored in `secrets.env` Docker environment file. 
[Note that it is important to wrap variable values to '' as otherwise Docker attempts to expand dollar sign](https://stackoverflow.com/questions/75322493/how-can-i-properly-escape-the-value-of-a-env-variable-that-contains-a-dollar-si).
Replace "tradingstrategy" / "mypassword" with your own username and password combination:

```shell
echo "HTTP_BASIC_AUTH_USER='tradingstrategy'" >> secrets.env
HASHED_PASSWORD=$(docker-compose run caddy caddy hash-password --plaintext "mypassword")
echo "HTTP_BASIC_AUTH_PASSWORD='$HASHED_PASSWORD'" >> secrets.env
```

Use docker compose to bring up the environment for the first time:

```shell
docker-compose up 
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

## Troubleshooting the instance

When CoCalc is running you can shell in.
To view installed packages:

```shell
docker-compose exec cocalc /bin/bash
pip3 list
```

## License

AGPL