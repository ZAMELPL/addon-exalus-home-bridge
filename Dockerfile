ARG BUILD_FROM=ghcr.io/hassio-addons/base:stable
FROM ${BUILD_FROM}

# Install Node.js and npm
# RUN apk add --no-cache \
#         nodejs=22.16.0-r3 \
#         \
#         && if [[ "${BUILD_ARCH}" = "aarch64" ]]; then ARCH="arm64"; fi \
#         && if [[ "${BUILD_ARCH}" = "amd64" ]]; then ARCH="amd64"; fi \
#         && if [[ "${BUILD_ARCH}" = "armv7" ]]; then ARCH="armv7"; fi \
#         \
#         && curl -L -s \
#                 "..." \
#                 | tar zxvf - -C /opt/ \

#Install Node.js and npm
RUN apk add --no-cache \
        nodejs \
        npm

#Install llmnrd from edge/testing
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk update \
 && apk add --no-cache llmnrd

# Copy root filesystem first
COPY rootfs /

# Set working directory
WORKDIR /app

# Create data directory
RUN mkdir -p /data && chmod 755 /data

RUN npm ci --omit=dev --no-audit --no-fund

# Make run.sh executable
RUN chmod +x /run.sh

#Run server
CMD ["/run.sh"]
