FROM redis:5.0.5
RUN apt-get update && apt-get install -y \
    python \
    python-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN ["pip", "install", "vaurien"]
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 6379 7379
CMD ["redis-server"]
