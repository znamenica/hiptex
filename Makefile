PLDIR=texmf/fonts/pl/hiptex/
TFMDIR=texmf/fonts/tfm/hiptex/
VFDIR=texmf/fonts/vf/hiptex/
VPLDIR=texmf/fonts/vpl/hiptex/
SRC=src

all: cp fonts

cp:
	make -C $(SRC) cp

fonts:
	make -C $(SRC) fonts
#	mkdir -p $(TFMDIR) $(VFDIR)
#	make -C $(PLDIR) fonts
#	make -C $(VPLDIR) fonts

install: all
	make -C $(SRC) install
