#!/bin/bash

# This script is a bash port of a CMD script by Pavel Kessler

# Arguments
INPUT="$1"
OUTFILE="$2"

# Variables

DATAPATH="$(dirname $INPUT)"
NAME="$(basename $INPUT)"
EXPNO=$(basename `find $INPUT -maxdepth 1 -type d -regex '.*/[0-9]+' | head -1`)
OUTDIR="$(dirname $OUTFILE)"

TOPSPIND="/opt/topspin4.1.1"
export PATH=$PATH:$topspind/prog/shlib
export PATH=$PATH:$topspind/prog/mod

# create the curdat

CURDAT="$OUTDIR/curdat"

cat >"$CURDAT" <<EOF
##TITLE= Parameter file, TopSpin 3.6.2
##JCAMPDX= 5.0
##\$DATPATH= <$DATAPATH>
##\$EXPNO= $EXPNO
##\$NAME= <$NAME>
##\$PROCNO= 1
##END=
EOF

export LD_LIBRARY_PATH=$TOPSPIND/prog/shlib/
export PATH=$PATH:$TOPSPIND/prog/bin/
jcampdx $CURDAT tojdx $OUTFILE 0 1 "*" "*" "*"
