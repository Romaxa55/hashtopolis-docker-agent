# используем образ dizcza/docker-hashcat в качестве основы
FROM dizcza/docker-hashcat
ENV AGENT_URL "http://51.161.212.110:8080/agents.php?download=1"

# указываем рабочую директорию
WORKDIR /app

# установка python3, python3-pip и зависимостей python3
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl \
    unzip \
    wget \
    python3.8 \
    python3.8-dev \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3.8 -m pip install setuptools wheel && \
    ln -sf python3.8 /usr/bin/python3

COPY entrypoint.sh /usr/local/bin/
COPY requirements.txt .
RUN python3.8 -m pip install --upgrade pip && \
    python3.8 -m pip install -r requirements.txt && \
    chmod +x /usr/local/bin/entrypoint.sh

# указываем команду для запуска контейнера
CMD ["entrypoint.sh"]