# This base image is 15 GB+
# Comes with Julia, JavaScript, LibreOffice, Firefox, etc.
FROM sagemathinc/cocalc-v2

# https://stackoverflow.com/a/54763270/315168
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PATH="/root/.local/bin:$PATH"
ENV PIP_NO_CACHE_DIR=off 
ENV PIP_DISABLE_PIP_VERSION_CHECK=on 
ENV PIP_DEFAULT_TIMEOUT=100
RUN pip3 install poetry==1.4.2

WORKDIR /app-export

# Export dependencies from Poetry and then 
# install them to the Cocalc's location using pip
COPY pyproject.toml poetry.lock ./
COPY deps ./deps/
RUN poetry export  -E web-server -E execution -E qstrader -E quantstats requirements.txt

# Install to whatever Python location CoCalc has
RUN pip3 install -r requirements.txt

CMD /root/run.py

EXPOSE 22 80 443
