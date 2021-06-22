FROM boltops/terraspace:ubuntu
USER root
ENV ADDITIONAL_PACKAGES \
tree \
git
RUN apt-get -yqq update && apt-get -yqq install ${ADDITIONAL_PACKAGES} --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN bash -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
RUN curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash
WORKDIR /root
LABEL maintainer=sheldon
