FROM debian:bookworm
ARG user=erik

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    emacs \
    git \
    sudo \
    ca-certificates \
    build-essential \
    ssh \
    wget \
    curl \
    httpie \
    openssh-client \
    cargo \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    elpa-markdown-mode \
    elpa-yaml-mode \
    elpa-magit \
    elpa-js2-mode \
    elpa-csv-mode \
    elpa-auto-complete \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update -y && apt-get install --no-install-recommends -y \
    zsh \
    && rm -rf /var/lib/apt/lists/*

RUN useradd ${user}
RUN echo "h\nh" | passwd ${user}

RUN adduser ${user} sudo
RUN mkdir /home/${user}
RUN chown ${user}.${user} /home/${user}
RUN mkdir /home/${user}/.ssh
RUN chown ${user}.${user} /home/${user}/.ssh
RUN chmod 700 /home/${user}/.ssh

RUN mkdir -p /run/host-services/ && touch /run/host-services/ssh-auth.sock
RUN chown ${user} /run/host-services/ssh-auth.sock

COPY --chown=${user}:${user} docker/emacs-js/dotemacs /home/${user}/.emacs
COPY --chown=${user}:${user} docker/emacs-js/dotgitconfig /home/${user}/.gitconfig
COPY --chown=${user}:${user} docker/emacs-js/bashrc /home/${user}/.bashrc
COPY --chown=${user}:${user} docker/emacs-js/sshconfig /home/${user}/.ssh/config

USER ${user}
WORKDIR /home/${user}

RUN mkdir /home/${user}/.emacs.d

RUN cd /home/${user}/.emacs.d && \
    wget https://raw.githubusercontent.com/syohex/emacs-hcl-mode/master/hcl-mode.el && \
    wget https://raw.githubusercontent.com/hcl-emacs/terraform-mode/master/terraform-mode.el

RUN cd /home/${user}/.emacs.d && \
    wget https://raw.githubusercontent.com/spotify/dockerfile-mode/master/dockerfile-mode.el

RUN cd /home/${user}/.emacs.d && \
    git clone https://github.com/emacs-tree-sitter/elisp-tree-sitter

RUN cd /home/${user}/.emacs.d && \
    wget https://raw.githubusercontent.com/orzechowskid/tsi.el/main/tsi.el && \
    wget https://raw.githubusercontent.com/orzechowskid/tsi.el/main/tsi-typescript.el && \
    wget https://raw.githubusercontent.com/orzechowskid/tsi.el/main/tsi-css.el && \
    wget https://raw.githubusercontent.com/orzechowskid/tsi.el/main/tsi-json.el && \
    wget https://raw.githubusercontent.com/gregsexton/origami.el/master/origami-parsers.el && \
    wget https://raw.githubusercontent.com/gregsexton/origami.el/master/origami.el && \
    wget https://raw.githubusercontent.com/orzechowskid/tsx-mode.el/emacs28/css-in-js.el && \
    wget https://raw.githubusercontent.com/orzechowskid/tsx-mode.el/emacs28/graphql.el

COPY --chown=${user}:${user} docker/emacs-js/tsx-mode.el /home/${user}/.emacs.d/

RUN cd /home/${user}/.emacs.d && \
    git clone https://github.com/zerolfx/copilot.el.git

ENTRYPOINT bash --rcfile ~/.bashrc
