#!/bin/sh
cd $(dirname $0)
export GC_DONT_GC=1
touch src/compiler/crystal.cr
make crystal progress=1 stats=1 FLAGS="-Dwithout_tools --no-codegen $*"
