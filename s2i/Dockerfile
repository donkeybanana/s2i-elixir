FROM elixir:1.10-slim

LABEL maintainer="Alan Burgoyne <alan@srcur.com>"

LABEL io.k8s.description="Elixir 1.10 s2i Builder Image" \
      io.k8s.display-name="Elixir (1.10) Builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="elixir,1.10,builder,s2i" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV MIX_ENV=prod

RUN apt-get update \
&&  apt-get install -y \
      curl \
      software-properties-common \
&&  curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&&  apt-get install -y \
      nodejs \
&&  rm -rf /var/lib/apt/lists/*

COPY ./bin/ /usr/libexec/s2i

RUN useradd -u 1001 -g 0 -m -d /opt/app-root default \
&&  mkdir -p /opt/app-root/src \
&&  chown -R 1001:1001 /opt/app-root

WORKDIR /opt/app-root/src

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
