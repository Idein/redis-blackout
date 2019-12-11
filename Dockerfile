FROM redis:5.0.5
ADD ["https://github.com/Shopify/toxiproxy/releases/download/v2.1.4/toxiproxy_2.1.4_amd64.deb", "/data/toxiproxy-2.1.4.deb"]
RUN ["dpkg", "-i", "/data/toxiproxy-2.1.4.deb"]
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 6379 7379
CMD ["redis-server"]
