# base nginx image
FROM nginx:alpine

# an arbitrary directory to build our site in
WORKDIR /build

# copy the project into the container
COPY . .

# download hugo and make it available in PATH
ENV HUGO_VERSION 0.81.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

ENV GLIBC_VERSION 2.23-r3

RUN set -x && \
  apk add --update wget ca-certificates libstdc++

# Install glibc

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
&&  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
&&  apk --no-cache add glibc-${GLIBC_VERSION}.apk \
&&  rm glibc-${GLIBC_VERSION}.apk \
&&  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk \
&&  apk --no-cache add glibc-bin-${GLIBC_VERSION}.apk \
&&  rm glibc-bin-${GLIBC_VERSION}.apk \
&&  wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-i18n-${GLIBC_VERSION}.apk \
&&  apk --no-cache add glibc-i18n-${GLIBC_VERSION}.apk \
&&  rm glibc-i18n-${GLIBC_VERSION}.apk

# Install HUGO

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

# Move site content to nginx

RUN cp -fR /build/public/* /usr/share/nginx/html