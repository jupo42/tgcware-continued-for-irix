#!/usr/local/bin/bash
#
# This is a generic build.sh script
# It can be used nearly unmodified with many packages
# 
# build.sh helper functions
. ${BUILDPKG_BASE}/scripts/build.sh.functions
#
###########################################################
# Check the following 4 variables before running the script
topdir=libXrandr
version=1.0.2
pkgver=3
source[0]=$topdir-$version.tar.bz2
# If there are no patches, simply comment this
patch[0]=patch-aa
patch[1]=patch-ab

# Source function library
. ${BUILDPKG_BASE}/scripts/buildpkg.functions

# Global settings
export CFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib -Wl,-rpath,/usr/local/lib"

reg prep
prep()
{
    generic_prep
}

reg build
build()
{
    generic_build
}

reg install
install()
{
    generic_install DESTDIR
    doc COPYING
}

reg pack
pack()
{
    generic_pack
}

reg distclean
distclean()
{
    clean distclean
}

###################################################
# No need to look below here
###################################################
build_sh $*