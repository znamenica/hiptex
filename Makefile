PLDIR=texmf/fonts/pl/hiptex/
TFMDIR=texmf/fonts/tfm/hiptex/
VFDIR=texmf/fonts/vf/hiptex/
VPLDIR=texmf/fonts/vpl/hiptex/

fonts:
	mkdir -p $(TFMDIR) $(VFDIR)
	make -C $(PLDIR) fonts
	make -C $(VPLDIR) fonts
