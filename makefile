doc: doc/manual.six

doc/manual.six: doc/alexander.xml doc/install.xml \
		doc/examples.xml doc/intro.xml VERSION
	        gapL makedoc.g

clean:
	(cd doc ; ./clean)

archive: doc
	(mkdir -p ../tar; cd ..; tar czvf tar/alexander.tar.gz --exclude ".svn" --exclude test --exclude "public_html" alexander)

WEBPOS=~/gap/pkg/alexander/public_html

towww: archive
	echo '<?xml version="1.0" encoding="ISO-8859-1"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
#	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.alexander
	cp doc/manual.pdf ${WEBPOS}/alexander.pdf
	cp ../tar/alexander.tar.gz ${WEBPOS}

