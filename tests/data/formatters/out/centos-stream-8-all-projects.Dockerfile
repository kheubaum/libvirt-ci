FROM quay.io/centos/centos:stream8

RUN dnf distro-sync -y && \
    dnf install 'dnf-command(config-manager)' -y && \
    dnf config-manager --set-enabled -y powertools && \
    dnf install -y centos-release-advanced-virtualization && \
    dnf install -y epel-release && \
    dnf install -y epel-next-release && \
    dnf install -y \
        SDL2-devel \
        alsa-lib-devel \
        ant \
        audit-libs-devel \
        augeas \
        autoconf \
        automake \
        bash \
        bash-completion \
        bc \
        bison \
        brlapi-devel \
        bzip2 \
        bzip2-devel \
        ca-certificates \
        capstone-devel \
        cargo \
        ccache \
        check-devel \
        clang \
        clang-devel \
        clippy \
        cpp \
        ctags \
        cyrus-sasl-devel \
        daxctl-devel \
        dbus-daemon \
        device-mapper-devel \
        device-mapper-multipath-devel \
        diffutils \
        dwarves \
        e2fsprogs \
        ebtables \
        expect \
        findutils \
        firewalld-filesystem \
        flex \
        fuse-devel \
        fuse3 \
        fuse3-devel \
        gcc \
        gcc-c++ \
        gdk-pixbuf2-devel \
        genisoimage \
        gettext \
        gettext-devel \
        git \
        glib2-devel \
        glib2-static \
        glibc-devel \
        glibc-langpack-en \
        glibc-static \
        glusterfs-api-devel \
        gnutls-devel \
        gnutls-utils \
        gobject-introspection-devel \
        golang \
        grep \
        gtk-doc \
        gtk3-devel \
        gzip \
        hostname \
        hwdata \
        icoutils \
        iproute \
        iproute-tc \
        iptables \
        iscsi-initiator-utils \
        java-11-openjdk-headless \
        jemalloc-devel \
        jna \
        jq \
        json-c-devel \
        json-glib-devel \
        kmod \
        libacl-devel \
        libaio-devel \
        libarchive-devel \
        libasan \
        libattr-devel \
        libblkid-devel \
        libbpf-devel \
        libcacard-devel \
        libcap-ng-devel \
        libcmocka-devel \
        libconfig-devel \
        libcurl-devel \
        libdrm-devel \
        libepoxy-devel \
        libev-devel \
        libfdt-devel \
        libffi-devel \
        libgcrypt-devel \
        libguestfs-devel \
        libguestfs-tools-c \
        libiscsi-devel \
        libjpeg-devel \
        libnbd-devel \
        libnfs-devel \
        libnl3-devel \
        libpcap-devel \
        libpciaccess-devel \
        libpmem-devel \
        libpng-devel \
        librbd-devel \
        libseccomp-devel \
        libselinux-devel \
        libslirp-devel \
        libsoup-devel \
        libssh-devel \
        libssh2-devel \
        libtasn1-devel \
        libtirpc-devel \
        libtool \
        libtorrent-devel \
        libubsan \
        liburing-devel \
        libusbx-devel \
        libuuid-devel \
        libvirt-devel \
        libwsman-devel \
        libxml2 \
        libxml2-devel \
        libxslt \
        libxslt-devel \
        libzstd-devel \
        llvm \
        lttng-ust-devel \
        lua-devel \
        lvm2 \
        lzo-devel \
        make \
        mesa-libgbm-devel \
        meson \
        nbdkit \
        ncurses-devel \
        net-snmp-devel \
        netcf-devel \
        nettle-devel \
        nfs-utils \
        ninja-build \
        nmap-ncat \
        numactl-devel \
        numad \
        ocaml \
        ocaml-findlib \
        ocamldoc \
        openssh-clients \
        osinfo-db-tools \
        pam-devel \
        parted-devel \
        pcre-static \
        perl \
        perl-App-cpanminus \
        perl-Archive-Tar \
        perl-CPAN-Changes \
        perl-Digest \
        perl-Digest-MD5 \
        perl-ExtUtils-CBuilder \
        perl-ExtUtils-Embed \
        perl-File-Slurp \
        perl-IO-Compress-Bzip2 \
        perl-IO-Interface \
        perl-IO-String \
        perl-Module-Build \
        perl-Net-OpenSSH \
        perl-Net-SNMP \
        perl-NetAddr-IP \
        perl-Pod-Simple \
        perl-Sub-Uplevel \
        perl-Test-Exception \
        perl-Test-Pod \
        perl-Test-Pod-Coverage \
        perl-Test-Simple \
        perl-Time-HiRes \
        perl-XML-Twig \
        perl-XML-Writer \
        perl-XML-XPath \
        perl-YAML \
        perl-devel \
        perl-generators \
        perl-podlators \
        php-devel \
        pixman-devel \
        pkgconfig \
        polkit \
        pulseaudio-libs-devel \
        python3 \
        python3-PyYAML \
        python3-boto3 \
        python3-dbus \
        python3-devel \
        python3-docutils \
        python3-flake8 \
        python3-gobject \
        python3-libnbd \
        python3-lxml \
        python3-numpy \
        python3-pillow \
        python3-pip \
        python3-pytest \
        python3-requests \
        python3-setuptools \
        python3-sphinx \
        python3-sphinx_rtd_theme \
        qemu-img \
        qemu-kvm \
        rdma-core-devel \
        readline-devel \
        rpcgen \
        rpm \
        rpm-build \
        ruby-devel \
        rubygem-rake \
        rust \
        sanlock-devel \
        scrub \
        sed \
        snappy-devel \
        socat \
        spice-gtk3-devel \
        spice-protocol \
        spice-server-devel \
        systemd-devel \
        systemd-rpm-macros \
        systemtap-sdt-devel \
        tar \
        tcl-devel \
        tcpdump \
        texinfo \
        usbredir-devel \
        util-linux \
        vala \
        valgrind \
        virglrenderer-devel \
        vte291-devel \
        wget \
        which \
        wireshark-devel \
        xfsprogs-devel \
        xorriso \
        xz \
        xz-devel \
        yajl-devel \
        zip \
        zlib-devel \
        zlib-static && \
    dnf autoremove -y && \
    dnf clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN cpanm --notest \
          LWP::UserAgent \
          TAP::Formatter::HTML \
          TAP::Formatter::JUnit \
          TAP::Harness::Archive \
          accessors

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"