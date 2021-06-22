FROM bitnami/node:16-prod

ARG BULLET_UI_VERSION=1.1.0
ARG BULLET_HOME=/usr/local/var/bullet
ENV PORT=8800
ENV BULLET_UI_HOME=${BULLET_HOME}/ui

RUN mkdir -p ${BULLET_UI_HOME}
RUN wget -q https://github.com/bullet-db/bullet-ui/releases/download/v${BULLET_UI_VERSION}/bullet-ui-v${BULLET_UI_VERSION}.tar.gz -O /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz
RUN tar -xzf /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz -C ${BULLET_UI_HOME}/
RUN rm /tmp/bullet-ui-v${BULLET_UI_VERSION}.tar.gz

COPY configs/ui/ ${BULLET_UI_HOME}/config/

WORKDIR ${BULLET_UI_HOME}
EXPOSE ${PORT}
CMD ["node", "express-server.js"]
