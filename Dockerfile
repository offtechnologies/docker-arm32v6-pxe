FROM offtechnologies/docker-arm32v6-base-image-alpine-qemu:latest

ARG SYSLINUX_VERSION=6.03

RUN apk --no-cache add \
    wget \
    dnsmasq \
    && mkdir -p /tftpboot \
    && cd /tmp \
    && wget -q https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-$SYSLINUX_VERSION.tar.xz \
    && tar -xJf syslinux-$SYSLINUX_VERSION.tar.xz \
    && cp /tmp/syslinux-$SYSLINUX_VERSION/bios/core/pxelinux.0 /tftpboot \
    && cp /tmp/syslinux-$SYSLINUX_VERSION/bios/com32/lib/libcom32.c32 /tftpboot \
    && cp /tmp/syslinux-$SYSLINUX_VERSION/bios/com32/libutil/libutil.c32 /tftpboot \
    && cp /tmp/syslinux-$SYSLINUX_VERSION/bios/com32/elflink/ldlinux/ldlinux.c32 /tftpboot \
    && cp /tmp/syslinux-$SYSLINUX_VERSION/bios/com32/menu/vesamenu.c32 /tftpboot \
    && wget -q -O /tftpboot/netboot.xyz.lkrn https://boot.netboot.xyz/ipxe/netboot.xyz.lkrn \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

COPY config/default /tftpboot/pxelinux.cfg/default
COPY image.png /tftpboot/image.png
COPY config/dnsmasq.conf /etc/dnsmasq.conf

RUN chown -R nobody:nogroup /tftpboot

EXPOSE 69/udp

ENTRYPOINT ["dnsmasq", "-d"]
