FROM bitnami/jmx-exporter:0.15.0

# Dependencies
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
    awscli

COPY entrypoint.sh /bin/entrypoint.sh

EXPOSE 5556

WORKDIR /opt/bitnami/jmx-exporter
USER 1001
ENTRYPOINT [ "/bin/entrypoint.sh" ]
