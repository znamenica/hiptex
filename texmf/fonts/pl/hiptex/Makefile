TFMDIR=../../tfm/hiptex/
PLS=irmucs.pl irmucsv.pl izhitsacs.pl orthucs8.pl orthucs8v.pl orthucs8c.pl orthucs8cv.pl pochucs.pl pochucsv.pl
TFMS=irmucs.tfm irmucsv.tfm izhitsacs.tfm orthucs8.tfm orthucs8v.tfm orthucs8c.tfm orthucs8cv.tfm pochucs.tfm pochucsv.tfm

%.tfm: %.pl
	pltotf $< $(TFMDIR)$@

fonts: $(TFMS)
