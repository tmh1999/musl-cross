# ARCH will be auto-detected as the host if not specified
ARCH=s390x
#ARCH=i486
#ARCH=x86_64
#ARCH=powerpc
#ARCH=arm
#ARCH=microblaze
#ARCH=mips
#ARCH=mipsel

CC_BASE_PREFIX=/opt/cross

# If you use arm, you may need more fine-tuning:
# arm hardfloat v7
#TRIPLE=arm-linux-musleabihf
#GCC_BOOTSTRAP_CONFFLAGS="--with-arch=armv7-a --with-float=hard --with-fpu=vfpv3-d16"
#GCC_CONFFLAGS="--with-arch=armv7-a --with-float=hard --with-fpu=vfpv3-d16"

# arm softfp
#TRIPLE=arm-linux-musleabi
#GCC_BOOTSTRAP_CONFFLAGS="--with-arch=armv7-a --with-float=softfp"
#GCC_CONFFLAGS="--with-arch=armv7-a --with-float=softfp"

MAKEFLAGS=-j$(nproc)

# Enable this to build the bootstrap gcc (thrown away) without optimization, to reduce build time
GCC_STAGE1_NOOPT=1

if [ "$ARCH" = "s390x" ]
then
    LINUX_HEADERS_URL=http://www.kernel.org/pub/linux/kernel/v3.0/linux-3.12.6.tar.xz
    MUSL_GIT_REPO='https://github.com/koorogi/musl'
    MUSL_VERSION=s390x
    MUSL_GIT=yes
fi

CC_BASE_PREFIX=$HOME/.worker/toolchains/musl-cross-"$ARCH"
