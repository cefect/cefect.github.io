# Pin the same Quarto release locally and in GitHub Actions.
ARG QUARTO_VERSION=1.10.19
FROM ghcr.io/quarto-dev/quarto:${QUARTO_VERSION} AS dev

# Add only editor and Git essentials; the website does not execute Python or R.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates git openssh-client sudo \
    && useradd --create-home --uid 1000 --shell /bin/bash vscode \
    && printf 'vscode ALL=(root) NOPASSWD:ALL\n' > /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode \
    && mkdir -p /home/vscode/.cache \
    && chown -R vscode:vscode /home/vscode/.cache

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
USER vscode
WORKDIR /workspace
CMD ["sleep", "infinity"]
