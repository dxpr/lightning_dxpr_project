
# ------------------------------------------------------#
# Clone the DXPR Maven project in as a first build stage
# ------------------------------------------------------#
FROM ubuntu as intermediate

# install git
RUN apt-get update \
  && apt-get install -y --no-install-recommends openssh-client git

USER root

# add credentials on build
ARG SSH_PRIVATE_KEY
ARG DXPR_MAVEN_TAG

RUN mkdir -p -m 0600 /root/.ssh/

# RUN mkdir -p -m 0600 /root/.ssh/ \
#   && ln -s /run/secrets/id_rsa /root/.ssh/id_rsa \
#   && touch /root/.ssh/known_hosts \
#   && ssh-keyscan github.com >> /root/.ssh/known_hosts \
#   && git clone git@github.com:dxpr/dxpr_maven.git

# Create a private key
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
# RUN echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# Clone and set up the branch
RUN git clone git@github.com:dxpr/dxpr_maven.git \
  ; cd dxpr_maven \
  ; git checkout $DXPR_MAVEN_TAG

ADD ./test.properties .
RUN cat ./test.properties > dxpr_maven/src/main/resources/browser-config.properties

# ------------------------------------------------------#
# Clone the DXPR Maven project in as a second build stage
# ------------------------------------------------------#
FROM maven:3.6.3-jdk-8

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
# speed up Maven JVM a bit
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# ----
# Install project dependencies and keep sources
# make source folder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# install maven dependency packages (keep in image)
COPY --from=intermediate /dxpr_maven /usr/src/app/
RUN mvn -T 1C clean install -DskipTests && rm -rf target

COPY ./wait-for-qa-demo.sh /
RUN chmod +x /wait-for-qa-demo.sh

ENTRYPOINT [ "/bin/bash", "/wait-for-qa-demo.sh", "drupal.docker.localhost", "mvn", "test", "-DsuiteXmlFile=./testng_chrome.xml" ]


