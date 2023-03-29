FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf update -y --nogpgcheck fedora-gpg-keys && \
    dnf install -y nosync && \
    printf '#!/bin/sh\n\
if test -d /usr/lib64\n\
then\n\
    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
else\n\
    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
fi\n\
exec "$@"\n' > /usr/bin/nosync && \
    chmod +x /usr/bin/nosync && \
    nosync dnf distro-sync -y && \
    nosync dnf install -y \
               SDL2-devel \
               SDL2_image-devel \
               alsa-lib-devel \
               ant \
               ant-junit \
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
               codespell \
               cpp \
               cppi \
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
               gcovr \
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
               gtk-update-icon-cache \
               gtk-vnc2-devel \
               gtk3-devel \
               guestfs-tools \
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
               junit \
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
               libcmpiutil-devel \
               libconfig-devel \
               libcurl-devel \
               libdrm-devel \
               libepoxy-devel \
               libev-devel \
               libfdt-devel \
               libffi-devel \
               libgcrypt-devel \
               libgovirt-devel \
               libguestfs-devel \
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
               libvirt-gobject-devel \
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
               mono-devel \
               monodevelop \
               nbd \
               nbdkit \
               ncurses-devel \
               net-snmp-devel \
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
               perl-Sys-Hostname \
               perl-TAP-Formatter-HTML \
               perl-TAP-Formatter-JUnit \
               perl-TAP-Harness-Archive \
               perl-Test-Exception \
               perl-Test-LWP-UserAgent \
               perl-Test-Pod \
               perl-Test-Pod-Coverage \
               perl-Test-Simple \
               perl-Time-HiRes \
               perl-XML-Twig \
               perl-XML-Writer \
               perl-XML-XPath \
               perl-YAML \
               perl-accessors \
               perl-base \
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
               python3-libxml2 \
               python3-lxml \
               python3-numpy \
               python3-opencv \
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
               rest-devel \
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
               sparse \
               spice-gtk3-devel \
               spice-protocol \
               spice-server-devel \
               systemd-devel \
               systemd-rpm-macros \
               systemtap-sdt-devel \
               tar \
               tcl-devel \
               tcpdump \
               tesseract \
               tesseract-langpack-eng \
               texinfo \
               unzip \
               usbredir-devel \
               util-linux \
               vala \
               valgrind \
               virglrenderer-devel \
               vte291-devel \
               wget \
               which \
               wireshark-devel \
               xen-devel \
               xfsprogs-devel \
               xorriso \
               xz \
               xz-devel \
               xz-static \
               yajl-devel \
               zip \
               zlib-devel \
               zlib-static && \
    nosync dnf autoremove -y && \
    nosync dnf clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"