PLDIR=texmf/fonts/pl/hiptex/
TFMDIR=texmf/fonts/tfm/hiptex/

fonts:
	mkdir -p $(TFMDIR)
	make -C $(PLDIR) fonts
