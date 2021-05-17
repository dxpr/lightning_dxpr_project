
# ------------------------------------------------------#
# Build the DXPR Builder project
# ------------------------------------------------------#
FROM node:10-alpine

ARG DXPR_BUILDER_CONTAINER

USER root

RUN mkdir -p $DXPR_BUILDER_CONTAINER
WORKDIR $DXPR_BUILDER_CONTAINER

RUN npm install -g grunt-cli

ENTRYPOINT \
  [ ! -f "$NPM_INSTALL_STAMP" ] && { npm install; npm rebuild node-sass; touch "$NPM_INSTALL_STAMP"; } \
  ; grunt concat; grunt terser; grunt sass; grunt postcss; grunt
