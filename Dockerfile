FROM alpine
MAINTAINER Sergejs Solomonovs alusvedejs@marupe.net

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV PATH /opt/google-cloud-sdk/bin:$PATH

USER root

RUN mkdir -p /opt

RUN pwd
# Install Google prerequisites
RUN apk add --update -t deps curl bash python openssl git
# Install Google Cloud Components
RUN curl https://sdk.cloud.google.com | bash && mv ~/google-cloud-sdk /opt
# Install kubectl
RUN gcloud components install kubectl
# Install helm
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
RUN helm init --client-only
RUN helm plugin install https://github.com/chartmuseum/helm-push