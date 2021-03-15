# base nginx image
FROM wernight/alpine-nginx-pagespeed

# an arbitrary directory to build our site in
WORKDIR /build

# copy the project into the container
COPY . .

ENV HUGO_VERSION 0.81.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
ENV GLIBC_VERSION 2.23-r3

RUN set -x && \
  apk add --update wget ca-certificates libstdc++

# Hugo extended doesn't run on Alpine https://github.com/gohugoio/hugo/issues/4961
# Following https://github.com/dettmering/hugo-build/blob/3275b1c4eb90abf7f5cab7107f7e6c894eb74505/Dockerfile
# and https://github.com/sgerrand/alpine-pkg-glibc
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

# Install HUGO and make it available in PATH

RUN wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*

# Configure pagespeed

RUN mv conf/pagespeed.conf /etc/nginx/ && \
    mv conf/nginx.conf /etc/nginx && \
    mkdir -p /tmp/pagespeed_cache && \
    # fix /tmp/pagespeed_cache permission denied
    chmod a+w /tmp/pagespeed_cache

# Move site content to nginx

RUN cp -fR /build/public/* /etc/nginx/html