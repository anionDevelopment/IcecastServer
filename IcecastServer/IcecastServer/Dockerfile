ARG image_alpine
FROM ${image_alpine}

ARG TargetEnvironmentType
ARG icecast_version
ARG Version="1.0.1"
LABEL maintainer="marius.goecke@gmail.com"
LABEL version="v$Version"
LABEL description="IcecastServer is a docker-image for simply running an Icecast-server in a docker-container."

RUN addgroup -S icecast && adduser -S icecast

RUN apk add --update icecast=${icecast_version} mailcap && \
    rm -rf /var/cache/apk/* && \
    mkdir /var/log/icecast && \
    touch /var/log/icecast/access.log && \
    touch /var/log/icecast/error.log && \
    chmod -R 777 /var/log/icecast

COPY IcecastServer/EntryPointScript.sh /EntryPointScript.sh
RUN chmod +x /EntryPointScript.sh

EXPOSE 8000
VOLUME ["/var/log/icecast"]
ENTRYPOINT ["/EntryPointScript.sh"]
