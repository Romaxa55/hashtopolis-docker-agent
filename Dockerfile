# используем образ dizcza/docker-hashcat в качестве основы
FROM dizcza/docker-hashcat
ENV AGENT_URL "http://51.161.212.110:8080/agents.php?download=1"

# указываем рабочую директорию
WORKDIR /app

# установка python3, python3-pip и зависимостей python3
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install requests
RUN pip3 install psutil
RUN pip3 install setuptools

#COPY entrypoint.sh /usr/local/bin/
#RUN chmod +x /usr/local/bin/entrypoint.sh
#
## указываем команду для запуска контейнера
#ENTRYPOINT ["entrypoint.sh"]