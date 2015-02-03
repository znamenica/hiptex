VFDIR=../../vf/hiptex/
TFMDIR=../../tfm/hiptex/
VFS=irmucsv.vf orthucs8v.vf orthucs8cv.vf pochucsv.vf

%.vf: %.vpl
	vptovf $< $(VFDIR)$@ $(TFMDIR)$(@:.vf=.tfm)

fonts: $(VFS)
