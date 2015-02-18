VPLS=irmucsv.vpl
CPMAKER=bundle exec ../bin/makevpl
VFS=irmucsv.vf

%.vpl: %.yml
	$(CPMAKER)

%.vpl: %.vpl.in
	$(CPMAKER)

%.vf: %.vpl
	vptovf $< $(VFDIR)$@ $(TFMDIR)$(@:.vf=.tfm)

cp: $(VPLS)
	if [ hip.yml -nt irmucsv.vpl ]; then $(CPMAKER) ; fi

fonts: $(VFS)

install:
	install irmucsv.vf /usr/share/texmf-texlive/fonts/vf/hiptex/irmucsv.vf
	install irmucsv.tfm /usr/share/texmf-texlive/fonts/tfm/hiptex/irmucsv.tfm
	install hiptex.map /usr/share/texmf-texlive/fonts/map/dvips/hiptex/
	install ucs8.enc /usr/share/texmf-texlive/fonts/enc/dvips/hiptex/orthucs8.enc

