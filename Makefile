PLDIR=texmf/fonts/pl/hiptex/
TFMDIR=texmf/fonts/tfm/hiptex/
VFDIR=texmf/fonts/vf/hiptex/
VPLDIR=texmf/fonts/vpl/hiptex/

default: fonts

cp:
	bundle exec bin/makevpl

fonts:
	mkdir -p $(TFMDIR) $(VFDIR)
	make -C $(PLDIR) fonts
	make -C $(VPLDIR) fonts

install: cp fonts
	install texmf/fonts/vf/hiptex/irmucsv.vf /usr/share/texmf-texlive/fonts/vf/hiptex/irmucsv.vf
	install texmf/fonts/tfm/hiptex/irmucsv.tfm /usr/share/texmf-texlive/fonts/tfm/hiptex/irmucsv.tfm
	install texmf/dvips/config/hiptex.map /usr/share/texmf-texlive/fonts/map/dvips/hiptex/
	install texmf/dvips/base/ucs8.enc /usr/share/texmf-texlive/fonts/enc/dvips/hiptex/orthucs8.enc

