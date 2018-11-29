dirs = proQuest
sources = $(foreach dir, $(dirs), $(wildcard $(dir)/*.pdf))
targets = $(basename $(addprefix output/, $(sources)))

docoptions = `cat ./docoptions`
pageoptions = `cat ./pageoptions`
convertJBIG2 = true
.PHONY: sourceFiles jbig2 tif
sourceFiles:

output/%.tetml:
	mkdir -p $(dir $@)
	tet --verbose 2 --tetml page --docopt "$(docoptions)" --pageopt "$(pageoptions)" --targetdir $(dir $@) ${SRC}
	# $(MAKE) MAKEFLAGS="SRC=$(dir $@)" jbig2 tif
	$(MAKE) MAKEFLAGS="SRC=${SRC} OUTPUTPATTERN=$(basename $@)_%03d.jpg" jpg

output/%.txt:
	mkdir -p $(dir $@)
	tet --verbose 2 --text --docopt "$(docoptions)" --pageopt "$(pageoptions)" --targetdir $(dir $@) ${SRC}

output/%.png:
		jbig2dec $(basename $@).jbig2 -o $@ && \
		rm $(basename $@).jbig2; \
	elif [ "$(SRCTYPE)" = "tif" ]; then \
		echo "SKIPPING TIF"
		#gm convert $(basename $@).tif $@ && \
		#rm $(basename $@).tif; \
	fi

%.pdf: sourceFiles
	$(MAKE) MAKEFLAGS="SRC=$@" output/$(basename $*)/$(notdir $*).tetml
	$(MAKE) MAKEFLAGS="SRC=$@" output/$(basename $*)/$(notdir $*).txt

jpg:
	gs -sDEVICE=jpeg -dNOPAUSE -dNOGC -q -o ${OUTPUTPATTERN} -r200x200 -dUseCropBox ${SRC}

tif:
	${MAKE} MAKEFLAGS="SRCTYPE=tif" $(patsubst %.tif, %.png, $(wildcard ${SRC}/*.tif))

jbig2:
	${MAKE} MAKEFLAGS="SRCTYPE=jbig2" $(patsubst %.jbig2, %.png, $(wildcard ${SRC}/*.jbig2))

output/%:
	mkdir -p $@

all: $(sources)
clean:
	rm -rf $(targets)