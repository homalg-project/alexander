all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g VERSION \
		doc/alexander.bib doc/*.xml \
		gap/*.gd gap/*.gi examples/*.g
	        gapL makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gapL -x 80 maketest.g

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/alexander.tar.gz --exclude ".DS_Store" alexander/doc/*.* alexander/gap/*.{gi,gd} alexander/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g} alexander/examples/*.g)

WEBPOS=~/gap/pkg/alexander/public_html
WEBPOS_FINAL=~/Sites/alexander

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.alexander
	cp doc/manual.pdf ${WEBPOS}/alexander.pdf
	cp doc/*.{css,html} ${WEBPOS}
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	cp ../tar/alexander.tar.gz ${WEBPOS}

