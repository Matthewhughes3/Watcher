FENNEL ?= fennel
FNLSOURCE = watcher.fnl
EXE = $(FNLSOURCE:%.fnl=%)

.PHONY: clean

clean:
	rm -f $(EXE) *.tar.gz

$(EXE): src/$(FNLSOURCE)
	echo "#!/usr/bin/env lua" > $@
	cd src; $(FENNEL) --no-metadata --require-as-include -c $(FNLSOURCE) >> ../$@
	chmod u+x $@

watcher-%: $(EXE)
	mkdir $@
	cp -r src $@
	mv $^ $@
	tar czvpf "$@.tar.gz" $@
	rm -r $@
