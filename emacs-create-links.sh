#!/bin/bash
############################
# This script creates symlinks to Emacs configuration files
############################

# curdir=`dirname $0`
curdir=$(dirname $(readlink -f $0))

ln -s $curdir/emacs.d ~/.emacs.d
ln -s $curdir/emacs ~/.emacs
