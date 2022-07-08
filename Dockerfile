FROM debian:buster-slim

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install --no-install-recommends -y \
    git ca-certificates

COPY . .

ENTRYPOINT ["./commiter.sh"]