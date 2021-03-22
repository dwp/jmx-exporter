FROM bitnami/jmx-exporter:0.15.0

# Dependencies
RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
    unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && aws --version

COPY entrypoint.sh /bin/entrypoint.sh

EXPOSE 5556

WORKDIR /opt/bitnami/jmx-exporter
USER 1001
ENTRYPOINT [ "/bin/entrypoint.sh" ]
