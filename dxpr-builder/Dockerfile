
ARG PHP_TAG

# ------------------------------------------------------#
# Clone the DXPR Builder project in as a first build stage
# ------------------------------------------------------#
FROM ubuntu as intermediate

# install git
RUN apt-get update \
  && apt-get install -y --no-install-recommends openssh-client git

USER root

# add credentials on build
ARG SSH_PRIVATE_KEY
ARG DXPR_BUILDER_TAG

RUN mkdir -p -m 0600 /root/.ssh/

# Create a private key
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:dxpr/dxpr_builder.git \
  ; cd dxpr_builder \
  ; git checkout $DXPR_BUILDER_TAG

# ------------------------------------------------------#
# Build the DXPR Builder project in as a first build stage
# ------------------------------------------------------#
FROM node:10-alpine as build

USER root

RUN mkdir -p /usr/src/dxpr_builder
WORKDIR /usr/src/dxpr_builder

# Copy DXPR Builder source code (keep in image)
COPY --from=intermediate /dxpr_builder /usr/src/dxpr_builder

RUN npm install \
  && npm install -g grunt-cli \
  && npm install grunt --save-dev \
  && grunt concat ; grunt terser ; grunt sass ; grunt postcss


# ------------------------------------------------------#
# Copy the DXPR Builder to run as the same user wodby
# used in the php and nginx containers
#
# TODO: try to use alpine image and create a wodby user
# and group with 1000 as UID and GID
# ------------------------------------------------------#
FROM wodby/drupal-php:$PHP_TAG

USER root

RUN mkdir -p /usr/src/dxpr_builder
WORKDIR /usr/src/dxpr_builder

# Copy DXPR Builder source code (keep in image)
COPY --from=build /usr/src/dxpr_builder /usr/src/dxpr_builder

RUN chown -R wodby:wodby /usr/src/dxpr_builder

USER wodby


