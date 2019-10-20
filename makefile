all: doc test

doc: doc/manual.six

doc/manual.six: makedoc.g maketest.g \
		PackageInfo.g \
		doc/alexander.bib doc/*.xml doc/*.css \
		gap/*.gd gap/*.gi examples/*.g
	        gap makedoc.g

clean:
	(cd doc ; ./clean)

test:	doc
	gap maketest.g

test-with-coverage:	doc
	OUTPUT=$$(/usr/bin/time --quiet --format="%U %S" --output=performance.out gap --banner --quitonbreak --cover stats maketest.g 2>&1); \
	echo "$$OUTPUT"; \
	! echo "$$OUTPUT" | sed "s/\r//" | grep -v "Running list" | grep -v "^#I  " | grep "" > /dev/null
	echo 'LoadPackage("profiling"); OutputJsonCoverage("stats", "coverage.json");' | gap

ci-test:	test-with-coverage

archive: test
	(mkdir -p ../tar; cd ..; tar czvf tar/alexander.tar.gz --exclude ".DS_Store" --exclude "*~" alexander/doc/*.* alexander/doc/clean alexander/gap/*.{gi,gd} alexander/{CHANGES,PackageInfo.g,README,VERSION,init.g,read.g,makedoc.g,makefile,maketest.g,ListOfDocFiles.g} alexander/examples/*.g)

WEBPOS=public_html
WEBPOS_FINAL=~/Sites/homalg-project/alexander

towww: archive
	echo '<?xml version="1.0" encoding="UTF-8"?>' >${WEBPOS}.version
	echo '<mixer>' >>${WEBPOS}.version
	cat VERSION >>${WEBPOS}.version
	echo '</mixer>' >>${WEBPOS}.version
	cp PackageInfo.g ${WEBPOS}
	cp README ${WEBPOS}/README.alexander
	cp doc/manual.pdf ${WEBPOS}/alexander.pdf
	cp doc/*.{css,html} ${WEBPOS}
	rm -f ${WEBPOS}/*.tar.gz
	mv ../tar/alexander.tar.gz ${WEBPOS}/alexander-`cat VERSION`.tar.gz
	rm -f ${WEBPOS_FINAL}/*.tar.gz
	cp ${WEBPOS}/* ${WEBPOS_FINAL}
	ln -s alexander-`cat VERSION`.tar.gz ${WEBPOS_FINAL}/alexander.tar.gz
