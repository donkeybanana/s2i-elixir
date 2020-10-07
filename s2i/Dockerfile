FROM elixir:1.10-alpine

LABEL maintainer="Alan Burgoyne <alan@srcur.com>"

LABEL io.k8s.description="Elixir 1.10 s2i Builder Image" \
      io.k8s.display-name="Elixir (1.10) Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="elixir,1.10,builder,s2i" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV MIX_ENV=prod

RUN apk update \
&&  apk --no-cache --update add \
      make \
      g++ \
      wget \
      curl \
      inotify-tools \
      nodejs \
      nodejs-npm \
&&  npm install npm -g --no-progress \
&&  update-ca-certificates --fresh \
&&  rm -rf /var/cache/apk/*

COPY ./bin/ /usr/libexec/s2i

RUN adduser --uid 1001 -G root --system --home /opt/app-root default \
&&  mkdir -p /opt/app-root/src \
&&  chown -R 1001:1001 /opt/app-root

WORKDIR /opt/app-root/src

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
