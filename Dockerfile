
FROM lachlanevenson/k8s-helm:v2.16.1
FROM lachlanevenson/k8s-kubectl:v1.14.8

FROM alpine:3.10
RUN apk add -U --no-cache python3 ca-certificates \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 --no-cache-dir install awscli==1.16.266
COPY --from=0 /usr/local/bin/helm /usr/local/bin/helm
COPY --from=1 /usr/local/bin/kubectl /usr/local/bin/kubectl
