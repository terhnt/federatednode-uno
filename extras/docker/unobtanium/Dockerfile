FROM unoparty/base

MAINTAINER Unoparty Developers <dev@unoparty.io>

# install unobtanium core
ENV BITCOIN_VER="0.21.1"
ENV BITCOIN_FOLDER_VER="0.21.1"
ENV BITCOIN_SHASUM="366eb44a7a0aa5bd342deea215ec19a184a11f2ca22220304ebb20b9c8917e2b"
WORKDIR /tmp

RUN wget -O unobtanium-0.11.5-x86_64-linux.tar.gz http://unobtanium.info.gf/unobtanium-linux-x86_64.tar.gz

# RUN wget -O bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VER}/bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz
# Add SHA256 Check later
# RUN myhash=$(sha256sum "bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz" | cut -d' ' -f1); \
#     if [ "$myhash" = "$BITCOIN_SHASUM" ] ; \
#         then echo "checksum ok"; \
#         else echo "checksum failed for bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz"; exit 255 ; \
#     fi

RUN tar -xvzf unobtanium-0.11.5-x86_64-linux.tar.gz
# bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz
RUN install -C -m 755 -o root -g root --backup=off unobtanium-0.11.5/bin/* /usr/local/bin/
# bitcoin-${BITCOIN_FOLDER_VER}/bin/* /usr/local/bin/
RUN rm unobtanium-0.11.5-x86_64-linux.tar.gz && rm -rf unobtanium-0.11.5
# bitcoin-${BITCOIN_VER}-x86_64-linux-gnu.tar.gz && rm -rf bitcoin-${BITCOIN_FOLDER_VER}

# Set up unobtaniumd dirs and files
RUN mkdir -p /root/.unobtanium/
COPY unobtanium.conf /root/.unobtanium/
COPY start.sh /usr/local/bin/start.sh
RUN chmod a+x /usr/local/bin/start.sh

EXPOSE 65535 65534 65531 65522

# NOTE: Defaults to running on mainnet, specify -e TESTNET=1 to start up on testnet
ENTRYPOINT ["start.sh"]
