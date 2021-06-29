FROM bitnami/node:16-prod

ARG BULLET_UI_VERSION=1.1.0
ARG BULLET_HOME=/usr/local/var/bullet
ENV BULLET_UI_HOME=${BULLET_HOME}/ui

RUN mkdir -p ${BULLET_UI_HOME} && \
    wget -q https://github.com/bullet-db/bullet-ui/releases/download/v${BULLET_UI_VERSION}/bullet-ui-v${BULLET_UI_VERSION}.tar.gz -O /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz && \
    tar -xzf /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz -C ${BULLET_UI_HOME}/ && \
    rm /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz

# ENVs for runtime configuration
ENV PORT=8800
ENV HOST_NAME=0.0.0.0

WORKDIR ${BULLET_UI_HOME}
EXPOSE ${PORT}
CMD ["node", "express-server.js"]
