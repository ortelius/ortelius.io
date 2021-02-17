FROM klakegg/hugo:ext-alpine

COPY . /src

EXPOSE 1313
WORKDIR /src

ENTRYPOINT ["hugo"]
