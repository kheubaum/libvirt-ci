FROM registry.opensuse.org/opensuse/leap:15.3

RUN zypper update -y && \
    zypper install -y \
           Mesa-devel \
           alsa-lib-devel \
           ant \
           ant-junit \
           audit-devel \
           augeas \
           augeas-lenses \
           autoconf \
           automake \
           bash \
           bash-completion \
           bc \
           bison \
           brlapi-devel \
           bzip2 \
           ca-certificates \
           cargo \
           ccache \
           check-devel \
           clang \
           clang-devel \
           codespell \
           cpp \
           cppi \
           ctags \
           cyrus-sasl-devel \
           dbus-1 \
           device-mapper-devel \
           diffutils \
           dwarves \
           e2fsprogs \
           ebtables \
           expect \
           findutils \
           flex \
           fuse-devel \
           fuse3 \
           fuse3-devel \
           gcc \
           gcc-c++ \
           gcovr \
           gdk-pixbuf-devel \
           gettext-devel \
           gettext-runtime \
           git \
           glib2-devel \
           glibc-devel \
           glibc-locale \
           glibc-static \
           glusterfs-devel \
           gnutls \
           go \
           gobject-introspection-devel \
           grep \
           gtk-doc \
           gtk-vnc-devel \
           gtk3-devel \
           gtk3-tools \
           guestfs-tools \
           gzip \
           hostname \
           hwdata \
           icoutils \
           iproute2 \
           iptables \
           java-11-openjdk-headless \
           jemalloc-devel \
           jna \
           jq \
           json-glib-devel \
           junit \
           kmod \
           libSDL2-devel \
           libSDL2_image-devel \
           libacl-devel \
           libaio-devel \
           libapparmor-devel \
           libarchive-devel \
           libasan6 \
           libattr-devel \
           libblkid-devel \
           libbpf-devel \
           libbz2-devel \
           libcacard-devel \
           libcap-ng-devel \
           libcmocka-devel \
           libcmpiutil-devel \
           libconfig-devel \
           libcurl-devel \
           libdrm-devel \
           libepoxy-devel \
           libev-devel \
           libfdt-devel \
           libffi-devel \
           libgcrypt-devel \
           libgnutls-devel \
           libgovirt-devel \
           libguestfs-devel \
           libiscsi-devel \
           libjpeg8-devel \
           libjson-c-devel \
           libnbd-devel \
           libndctl-devel \
           libnettle-devel \
           libnfs-devel \
           libnl3-devel \
           libnuma-devel \
           libpcap-devel \
           libpciaccess-devel \
           libpixman-1-0-devel \
           libpmem-devel \
           libpng16-devel \
           libpulse-devel \
           librbd-devel \
           librest-devel \
           libseccomp-devel \
           libselinux-devel \
           libslirp-devel \
           libsoup-devel \
           libspice-server-devel \
           libssh-devel \
           libssh2-devel \
           libtasn1-devel \
           libtirpc-devel \
           libtool \
           libtorrent-devel \
           libubsan1 \
           libudev-devel \
           liburing-devel \
           libusb-1_0-devel \
           libuuid-devel \
           libvirt-devel \
           libvirt-glib-devel \
           libwsman-devel \
           libxml2 \
           libxml2-devel \
           libxslt \
           libxslt-devel \
           libyajl-devel \
           libzstd-devel \
           llvm \
           lttng-ust-devel \
           lua-devel \
           lvm2 \
           lzo-devel \
           make \
           mkisofs \
           nbd \
           nbdkit \
           ncat \
           ncurses-devel \
           net-snmp-devel \
           nfs-utils \
           ninja \
           numad \
           ocaml \
           ocaml-findlib \
           ocaml-ocamldoc \
           open-iscsi \
           openssh \
           osinfo-db-tools \
           pam-devel \
           parted-devel \
           pcre-devel-static \
           perl \
           perl-App-cpanminus \
           perl-Archive-Tar \
           perl-CPAN-Changes \
           perl-Digest \
           perl-Digest-MD5 \
           perl-ExtUtils-CBuilder \
           perl-File-Slurp \
           perl-IO-Interface \
           perl-IO-String \
           perl-Module-Build \
           perl-Net-SNMP \
           perl-NetAddr-IP \
           perl-Pod-Simple \
           perl-Sub-Uplevel \
           perl-Test-Exception \
           perl-Test-Harness \
           perl-Test-Pod \
           perl-Test-Pod-Coverage \
           perl-Test-Simple \
           perl-Time-HiRes \
           perl-XML-Twig \
           perl-XML-Writer \
           perl-XML-XPath \
           perl-YAML \
           perl-base \
           php-devel \
           pkgconfig \
           polkit \
           python3-Pillow \
           python3-PyYAML \
           python3-Sphinx \
           python3-base \
           python3-boto3 \
           python3-dbus-python \
           python3-devel \
           python3-docutils \
           python3-flake8 \
           python3-gobject \
           python3-libxml2-python \
           python3-lxml \
           python3-numpy \
           python3-opencv \
           python3-pip \
           python3-pytest \
           python3-requests \
           python3-setuptools \
           python3-sphinx_rtd_theme \
           python3-wheel \
           qemu \
           qemu-tools \
           rdma-core-devel \
           readline-devel \
           rpcgen \
           rpm \
           rpm-build \
           ruby \
           ruby-devel \
           rust \
           sanlock-devel \
           scrub \
           sed \
           snappy-devel \
           socat \
           sparse \
           spice-gtk-devel \
           spice-protocol-devel \
           systemd-devel \
           systemd-rpm-macros \
           systemtap-sdt-devel \
           tar \
           tcl-devel \
           tcpdump \
           tesseract-ocr \
           tesseract-ocr-traineddata-english \
           texinfo \
           unzip \
           usbredir-devel \
           util-linux \
           vala \
           valgrind \
           virglrenderer-devel \
           vte-devel \
           wget \
           which \
           wireshark-devel \
           xen-devel \
           xfsprogs-devel \
           xorriso \
           xz \
           xz-devel \
           xz-static-devel \
           zip \
           zlib-devel \
           zlib-devel-static && \
    zypper clean --all && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN /usr/bin/pip3 install meson==0.56.0

RUN cpanm --notest \
          IO::Compress::Bzip2 \
          LWP::UserAgent \
          Net::OpenSSH \
          TAP::Formatter::HTML \
          TAP::Formatter::JUnit \
          TAP::Harness::Archive \
          accessors

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"