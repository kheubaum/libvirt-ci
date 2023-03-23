FROM docker.io/library/debian:10-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y eatmydata && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y \
                      ant \
                      ant-optional \
                      augeas-lenses \
                      augeas-tools \
                      autoconf \
                      automake \
                      autopoint \
                      bash \
                      bash-completion \
                      bc \
                      bison \
                      bsdmainutils \
                      bzip2 \
                      ca-certificates \
                      cargo \
                      ccache \
                      check \
                      clang \
                      codespell \
                      cpp \
                      dbus \
                      debianutils \
                      diffutils \
                      dwarves \
                      e2fsprogs \
                      ebtables \
                      expect \
                      exuberant-ctags \
                      fdisk \
                      findutils \
                      flake8 \
                      flex \
                      fuse3 \
                      g++ \
                      gcc \
                      gcovr \
                      genisoimage \
                      gettext \
                      git \
                      gnutls-bin \
                      golang \
                      grep \
                      gtk-doc-tools \
                      gzip \
                      hostname \
                      hwdata \
                      icoutils \
                      iproute2 \
                      iptables \
                      jq \
                      junit \
                      kmod \
                      libaccessors-perl \
                      libacl1-dev \
                      libaio-dev \
                      libapparmor-dev \
                      libarchive-dev \
                      libarchive-tar-perl \
                      libasan5 \
                      libasound2-dev \
                      libattr1-dev \
                      libaudit-dev \
                      libblkid-dev \
                      libbpf-dev \
                      libbrlapi-dev \
                      libbz2-dev \
                      libc-dev-bin \
                      libc6-dev \
                      libcacard-dev \
                      libcap-ng-dev \
                      libcapstone-dev \
                      libclang-dev \
                      libcmocka-dev \
                      libconfig-dev \
                      libcpan-changes-perl \
                      libcurl4-gnutls-dev \
                      libdaxctl-dev \
                      libdevmapper-dev \
                      libdigest-perl \
                      libdigest-perl-md5-perl \
                      libdrm-dev \
                      libepoxy-dev \
                      libev-dev \
                      libextutils-cbuilder-perl \
                      libfdt-dev \
                      libffi-dev \
                      libfile-slurp-perl \
                      libfuse-dev \
                      libfuse3-dev \
                      libgbm-dev \
                      libgcrypt20-dev \
                      libgdk-pixbuf2.0-dev \
                      libgirepository1.0-dev \
                      libglib2.0-dev \
                      libglib2.0-dev-bin \
                      libglusterfs-dev \
                      libgnutls28-dev \
                      libgovirt-dev \
                      libgtk-3-dev \
                      libgtk-vnc-2.0-dev \
                      libguestfs-dev \
                      libguestfs-tools \
                      libibumad-dev \
                      libibverbs-dev \
                      libio-compress-perl \
                      libio-interface-perl \
                      libio-string-perl \
                      libiscsi-dev \
                      libjemalloc-dev \
                      libjna-java \
                      libjpeg62-turbo-dev \
                      libjson-c-dev \
                      libjson-glib-dev \
                      liblttng-ust-dev \
                      liblzma-dev \
                      liblzo2-dev \
                      libmodule-build-perl \
                      libncursesw5-dev \
                      libnet-openssh-perl \
                      libnet-snmp-perl \
                      libnetaddr-ip-perl \
                      libnetcf-dev \
                      libnfs-dev \
                      libnl-3-dev \
                      libnl-route-3-dev \
                      libnuma-dev \
                      libpam0g-dev \
                      libparted-dev \
                      libpcap0.8-dev \
                      libpciaccess-dev \
                      libpcre2-dev \
                      libperl-dev \
                      libpixman-1-dev \
                      libpmem-dev \
                      libpng-dev \
                      libpulse-dev \
                      librbd-dev \
                      librdmacm-dev \
                      libreadline-dev \
                      librest-dev \
                      libsanlock-dev \
                      libsasl2-dev \
                      libsdl2-dev \
                      libsdl2-image-dev \
                      libseccomp-dev \
                      libselinux1-dev \
                      libsnappy-dev \
                      libsnmp-dev \
                      libsoup2.4-dev \
                      libspice-client-gtk-3.0-dev \
                      libspice-protocol-dev \
                      libspice-server-dev \
                      libssh-gcrypt-dev \
                      libssh2-1-dev \
                      libsub-uplevel-perl \
                      libsystemd-dev \
                      libtap-formatter-html-perl \
                      libtap-formatter-junit-perl \
                      libtap-harness-archive-perl \
                      libtasn1-6-dev \
                      libtest-exception-perl \
                      libtest-lwp-useragent-perl \
                      libtest-pod-coverage-perl \
                      libtest-pod-perl \
                      libtest-simple-perl \
                      libtime-hr-perl \
                      libtirpc-dev \
                      libtool \
                      libtool-bin \
                      libtorrent-dev \
                      libubsan1 \
                      libudev-dev \
                      libusb-1.0-0-dev \
                      libusbredirhost-dev \
                      libvdeplug-dev \
                      libvirglrenderer-dev \
                      libvirt-dev \
                      libvirt-glib-1.0-dev \
                      libvte-2.91-dev \
                      libxen-dev \
                      libxml-twig-perl \
                      libxml-writer-perl \
                      libxml-xpath-perl \
                      libxml2-dev \
                      libxml2-utils \
                      libxslt1-dev \
                      libyajl-dev \
                      libyaml-perl \
                      libzstd-dev \
                      llvm \
                      locales \
                      lua5.3 \
                      lvm2 \
                      make \
                      mount \
                      multipath-tools \
                      nbd-client \
                      nbd-server \
                      nbdkit \
                      ncat \
                      nettle-dev \
                      nfs-common \
                      ninja-build \
                      numad \
                      ocaml \
                      ocaml-findlib \
                      ocaml-nox \
                      open-iscsi \
                      openjdk-11-jdk-headless \
                      openssh-client \
                      osinfo-db-tools \
                      perl \
                      perl-base \
                      php-dev \
                      pkgconf \
                      policykit-1 \
                      publican \
                      python3 \
                      python3-boto3 \
                      python3-dbus \
                      python3-dev \
                      python3-docutils \
                      python3-gi \
                      python3-lxml \
                      python3-numpy \
                      python3-opencv \
                      python3-pillow \
                      python3-pip \
                      python3-pytest \
                      python3-requests \
                      python3-setuptools \
                      python3-sphinx \
                      python3-sphinx-rtd-theme \
                      python3-venv \
                      python3-wheel \
                      python3-yaml \
                      qemu-system \
                      qemu-utils \
                      rake \
                      rpm2cpio \
                      ruby-dev \
                      rustc \
                      scrub \
                      sed \
                      socat \
                      sparse \
                      systemtap-sdt-dev \
                      tar \
                      tcl-dev \
                      tcpdump \
                      tesseract-ocr \
                      tesseract-ocr-eng \
                      texinfo \
                      uuid-dev \
                      valac \
                      valgrind \
                      wget \
                      wireshark-dev \
                      xfslibs-dev \
                      xsltproc \
                      xz-utils \
                      zip \
                      zlib1g-dev && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN /usr/bin/pip3 install meson==0.56.0

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"