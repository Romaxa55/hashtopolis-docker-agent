# используем образ dizcza/docker-hashcat в качестве основы
FROM dizcza/docker-hashcat
ENV AGENT_URL "http://51.161.212.110:8080/agents.php?download=1"

# указываем рабочую директорию
WORKDIR /app

# установка python3, python3-pip и зависимостей python3
RUN apt-get update && \
    apt-get install -y --no-install-recommends  \
    curl \
    unzip \
    wget \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev  \
    libffi-dev  \
    libsqlite3-dev  \
    libbz2-dev &&  \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip3 install setuptools wheel && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install python3.9 python3.9-dev python3.9-pip

RUN wget https://www.python.org/ftp/python/3.9.7/Python-3.9.7.tgz && \
    tar -xvf Python-3.9.7.tgz && \
    cd Python-3.9.7/ && \
    ./configure --enable-optimizations && \
    make && \
    make altinstall

#python3 python3-dev python3-pip

COPY entrypoint.sh /usr/local/bin/
COPY requirements.txt .
RUN pip3 install -r requirements.txt && \
    chmod +x /usr/local/bin/entrypoint.sh

# указываем команду для запуска контейнера
CMD ["entrypoint.sh"]