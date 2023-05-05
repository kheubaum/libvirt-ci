FROM docker.io/library/alpine:3.16

RUN apk update && \
    apk upgrade && \
    apk add \
        acl-dev \
        alsa-lib-dev \
        apache-ant \
        attr-dev \
        audit-dev \
        augeas \
        autoconf \
        automake \
        bash \
        bash-completion \
        bc \
        bison \
        busybox \
        bzip2 \
        bzip2-dev \
        ca-certificates \
        capstone-dev \
        cargo \
        ccache \
        cdrkit \
        ceph-dev \
        check \
        clang \
        clang-dev \
        cmocka-dev \
        ctags \
        curl-dev \
        cyrus-sasl-dev \
        dbus \
        diffutils \
        dtc-dev \
        e2fsprogs \
        eudev-dev \
        expect \
        findutils \
        flex \
        fuse-dev \
        fuse3 \
        fuse3-dev \
        g++ \
        gcc \
        gcovr \
        gdk-pixbuf-dev \
        gettext \
        git \
        glib-dev \
        glib-static \
        gnutls-dev \
        gnutls-utils \
        go \
        gobject-introspection-dev \
        grep \
        gtk+3.0-dev \
        gtk-doc \
        gtk-vnc-dev \
        gzip \
        hexdump \
        hwids-pci \
        hwids-usb \
        icoutils \
        iproute2 \
        iptables \
        java-jna \
        jq \
        json-c-dev \
        json-glib-dev \
        junit \
        kmod \
        libaio-dev \
        libarchive-dev \
        libbpf-dev \
        libcap-ng-dev \
        libconfig-dev \
        libdrm-dev \
        libepoxy-dev \
        libev-dev \
        libffi-dev \
        libgcrypt-dev \
        libjpeg-turbo-dev \
        libnfs-dev \
        libnl3-dev \
        libpcap-dev \
        libpciaccess-dev \
        libpng-dev \
        libseccomp-dev \
        libselinux-dev \
        libslirp-dev \
        libsoup-dev \
        libssh-dev \
        libssh2-dev \
        libtasn1-dev \
        libtirpc-dev \
        libtool \
        libtorrent \
        liburing-dev \
        libusb-dev \
        libvirt-dev \
        libvirt-glib-dev \
        libxml2-dev \
        libxml2-utils \
        libxslt \
        libxslt-dev \
        linux-pam-dev \
        llvm \
        lttng-ust-dev \
        lua5.4 \
        lvm2 \
        lvm2-dev \
        lzo-dev \
        make \
        mesa-dev \
        meson \
        multipath-tools \
        musl-dev \
        nbd \
        nbd-client \
        ncurses-dev \
        ndctl-dev \
        net-snmp-dev \
        net-tools \
        netcf-dev \
        nettle-dev \
        nfs-utils \
        nmap-ncat \
        numactl-dev \
        ocaml \
        ocaml-findlib-dev \
        ocaml-ocamldoc \
        open-iscsi \
        openjdk11-jdk \
        openssh-client \
        osinfo-db-tools \
        parted-dev \
        pcre-dev \
        perl \
        perl-app-cpanminus \
        perl-dev \
        perl-file-slurp \
        perl-io-string \
        perl-module-build \
        perl-net-snmp \
        perl-sub-uplevel \
        perl-test-exception \
        perl-test-pod \
        perl-test-pod-coverage \
        perl-time-hires \
        perl-xml-twig \
        perl-xml-writer \
        perl-xml-xpath \
        perl-yaml \
        php81-dev \
        pipewire-dev \
        pixman-dev \
        pkgconf \
        polkit \
        pulseaudio-dev \
        py3-boto3 \
        py3-dbus \
        py3-docutils \
        py3-flake8 \
        py3-gobject3 \
        py3-lxml \
        py3-numpy \
        py3-pillow \
        py3-pip \
        py3-pytest \
        py3-requests \
        py3-setuptools \
        py3-sphinx \
        py3-sphinx_rtd_theme \
        py3-yaml \
        python3 \
        python3-dev \
        qemu \
        qemu-img \
        readline-dev \
        rest-dev \
        rpcgen \
        rpm2cpio \
        ruby-dev \
        ruby-rake \
        rust \
        rust-clippy \
        samurai \
        sdl2-dev \
        sdl2_image-dev \
        sed \
        sfdisk \
        snappy-dev \
        socat \
        sparse \
        spice-dev \
        spice-gtk-dev \
        spice-protocol \
        tar \
        tcl \
        tcpdump \
        tesseract-ocr \
        texinfo \
        usbredir-dev \
        util-linux \
        util-linux-dev \
        vala \
        valgrind \
        vde2-dev \
        virglrenderer-dev \
        vte3-dev \
        wget \
        which \
        wireshark-dev \
        xen-dev \
        xfsprogs-dev \
        xz \
        xz-dev \
        yajl-dev \
        zip \
        zlib-dev \
        zlib-static \
        zstd-dev && \
    apk list | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN cpanm --notest \
          Archive::Tar \
          CPAN::Changes \
          Digest::MD5 \
          ExtUtils::CBuilder \
          IO::Compress::Bzip2 \
          IO::Interface \
          LWP::UserAgent \
          Net::OpenSSH \
          NetAddr::IP \
          TAP::Formatter::HTML \
          TAP::Formatter::JUnit \
          TAP::Harness::Archive \
          Test::Simple \
          accessors

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"