TFMDIR=../../tfm/hiptex/
TFMS=irmucs.tfm izhitsacs.tfm orthucs8.tfm orthucs8c.tfm pochucs.tfm

%.tfm: %.pl
	pltotf $< $(TFMDIR)$@

fonts: $(TFMS)
