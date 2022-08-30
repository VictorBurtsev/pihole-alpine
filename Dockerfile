FROM alpine:3.16 as builder

ARG GIT_BRANCH="special/CI_development"
ARG IDN_VERSION=1.41
ARG TERMCAP_VERSION=1.3.1
ARG READLINE_VERSION=8.1

RUN apk add \
        curl \
        g++ \
        git \
        file \
        make \
        cmake \
        gmp-dev \
        nettle-static \
        nettle-dev \
        gtk-doc \
        bash \
        sqlite \
        linux-headers \
    && curl -sSL https://ftl.pi-hole.net/libraries/libidn-${IDN_VERSION}.tar.gz | tar -xz \
    && cd libidn-${IDN_VERSION} \
    && ./configure --enable-static --disable-shared --disable-doc \
    && make -j $(nproc) install \
    && curl -sSL https://ftl.pi-hole.net/libraries/termcap-${TERMCAP_VERSION}.tar.gz | tar -xz \
    && cd termcap-${TERMCAP_VERSION} \
    && ./configure --enable-static --disable-shared --disable-doc \
    && make -j $(nproc) \
    && make install \
    && curl -sSL https://ftl.pi-hole.net/libraries/readline-${READLINE_VERSION}.tar.gz | tar -xz \
    && cd readline-${READLINE_VERSION} \
    && ./configure --enable-static --disable-shared \
    && make -j $(nproc) \
    && make install-static \
    && git clone https://github.com/pi-hole/FTL.git \
    && cd FTL \
    && git checkout "${GIT_BRANCH}" \
    && bash build.sh "-DSTATIC=true" \
    && cp pihole-FTL /opt \
    && cp test/gravity.db.sql /opt

FROM alpine:3.16

COPY --from=builder /opt /opt

RUN mkdir /var/log/pihole /etc/pihole /run/pihole /etc/dnsmasq.d \
    && touch /var/log/pihole/FTL.log /run/pihole-FTL.pid /etc/pihole/local.list /etc/pihole/custom.list

COPY etc/ /etc/

EXPOSE 53

CMD ["/opt/pihole-FTL", "no-daemon"]