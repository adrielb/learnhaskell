build:
	cabal build

apress-src:
	wget http://www.apress.com/downloadable/download/sample/sample_id/1516/
	mv index.html $@.zip
	mkdir -p $@
	cd $@; unzip ../$@.zip
