#!/bin/sh
# The installation script of HIPTeX package (for teTeX system).
# Before running the script, choose how you'll update the hiptex.map file
# (see below).

TEXMF=`kpsewhich -expand-var='$TEXMFMAIN'`
mkdir -p $TEXMF/{tex/latex,tex/generic/public,fonts/tfm/public,fonts/vf/public,fonts/type1/public,fonts/afm/public,doc/fonts}/hiptex
mkdir -p $TEXMF/tex/latex/hiptex/eps
cp -p dvips/base/* $TEXMF/dvips/base
cp -p dvips/config/* $TEXMF/dvips/config
cp -p tex/latex/hiptex/* $TEXMF/tex/latex/hiptex
cp -p tex/latex/hiptex/eps/* $TEXMF/tex/latex/hiptex/eps
cp -p tex/generic/public/hiptex/* $TEXMF/tex/generic/public/hiptex
cp -p tex/generic/babel/* $TEXMF/tex/generic/babel
cp -p fonts/tfm/public/hiptex/* $TEXMF/fonts/tfm/public/hiptex
#cp -p fonts/vf/public/hiptex/* $TEXMF/fonts/vf/public/hiptex
cp -p fonts/type1/public/hiptex/* $TEXMF/fonts/type1/public/hiptex
cp -p fonts/afm/public/hiptex/* $TEXMF/fonts/afm/public/hiptex
cp -p LICENSE $TEXMF/doc/fonts/hiptex

VARTEXFONTS=`kpsewhich -expand-var='$VARTEXFONTS'`
rm -f $VARTEXFONTS/pk/modeless/public/hiptex/*

# Next, we need to update psfonts.map.  The simplest (but not the best)
# method is to uncomment the following two lines.  A better solution is
# to add the line "hiptex.map" to the extra_module section of updmap script
# and then run it.
#
#cd $TEXMF/dvips/config
#cat hiptex.map >> psfonts.map

mktexlsr

