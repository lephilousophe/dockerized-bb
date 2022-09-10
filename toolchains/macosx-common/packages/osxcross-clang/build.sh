#! /bin/sh

OSXCROSS_VERSION=17bb5e2d0a46533c1dd525cf4e9a80d88bd9f00e

PACKAGE_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
HELPERS_DIR=$PACKAGE_DIR/../..
. $HELPERS_DIR/functions.sh

do_make_bdir

do_git_fetch osxcross "https://github.com/tpoechtrager/osxcross.git" "${OSXCROSS_VERSION}"

# Don't ask anything
UNATTENDED=1 \
	ENABLE_CLANG_INSTALL=1 \
	INSTALLPREFIX="${TARGET_DIR}" \
	./build_clang.sh

do_clean_bdir
