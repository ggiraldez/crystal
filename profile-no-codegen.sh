#!/bin/sh
cd $(dirname $0)
export ROOT_DIR=$(pwd)
export GC_DONT_GC=1
export CRYSTAL_CONFIG_PATH='$ORIGIN/../share/crystal/src'
export CRYSTAL_CONFIG_LIBRARY_PATH='$ORIGIN/../lib/crystal'
export CC="cc -fuse-ld=lld"
export SOURCE_DATE_EPOCH="1726271268"
export CRYSTAL_CONFIG_BUILD_COMMIT="cc8afb61e"
export CRYSTAL_PATH="$ROOT_DIR/src:$ROOT_DIR/lib"

valgrind --tool=callgrind -- \
	.build/crystal build \
	-Dwithout_tools \
	-Dstrict_multi_assign \
	-Dpreview_overload_order \
	-Dwithout_interpreter \
	-Dwithout_openssl \
	-Dwithout_zlib \
	-Duse_pcre2 \
	-Di_know_what_im_doing \
	--progress \
	--stats \
	--no-codegen \
	src/compiler/crystal.cr
