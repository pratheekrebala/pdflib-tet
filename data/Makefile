dirs = proQuest
sources = $(foreach dir, $(dirs), $(wildcard $(dir)/*.pdf))
targets = $(basename $(addprefix output/, $(sources)))
docoptions = `cat ./docoptions`
pageoptions = `cat ./pageoptions`

output/%:
	@echo "Processing $@"
	mkdir -p $@
	tet --verbose 2 --image --tetml page --docopt "$(docoptions)" --pageopt "$(pageoptions)" --targetdir $@ $*.pdf
	tet --verbose 2 --image --text --docopt "$(docoptions)" --pageopt "$(pageoptions)" --targetdir $@ $*.pdf

all: $(targets)
clean:
	rm -rf $(targets)