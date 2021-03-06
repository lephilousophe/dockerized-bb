#! /bin/sh

# This commit is in fbo branch
VITA2DLIB_VERSION=c221adb0e3757395f95952b84a5920404310140b

PACKAGE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
HELPERS_DIR=$PACKAGE_DIR/../..
. $HELPERS_DIR/functions.sh

do_make_bdir

do_http_fetch vita2dlib \
	"https://github.com/frangarcj/vita2dlib/archive/${VITA2DLIB_VERSION}.tar.gz" 'tar xzf'

# Makefile is bad coded and overrides CC and AR variables
PATH="$VITASDK/bin:$PATH" do_make -C libvita2d

cp libvita2d/libvita2d.a $DESTDIR/$PREFIX/lib/libvita2d_fbo.a
cp libvita2d/include/vita2d.h $DESTDIR/$PREFIX/include/vita2d_fbo.h

do_clean_bdir
