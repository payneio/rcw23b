rcw=RCW_23B
raw_html_dir=build/html/raw

dist/$(rcw).md: dist/$(rcw).html
	mkdir --parents build/md
	sed --regexp-extended --file=sed_scripts/md dist/$(rcw).html > build/md/$(rcw).md
	cp --force build/md/$(rcw).md dist/$(rcw).md

dist/$(rcw).html: build/prepared
	mkdir --parents dist 
	cat $(raw_html_dir)/* > build/html/$(rcw).iso8859.html
	iconv -f ISO-8859-1 -t UTF-8 build/html/$(rcw).iso8859.html > build/html/$(rcw).utf8.html
	tr --squeeze-repeats "\n\r\t " " " < build/html/$(rcw).utf8.html > build/html/$(rcw).min.html
	sed --regexp-extended --file=sed_scripts/cleanup_html build/html/$(rcw).min.html > build/html/$(rcw).html
	cp --force build/html/$(rcw).html dist/$(rcw).html

dist/$(rcw).pdf: dist/$(rcw).md
	pandoc --toc -o dist/$(rcw).pdf dist/$(rcw).md

build/prepared: build/downloaded
	mkdir --parents $(raw_html_dir)
	cp raw/* $(raw_html_dir)
	rename "s/\s+//g" $(raw_html_dir)/*
	mv $(raw_html_dir)/RCW23BTITLE.htm $(raw_html_dir)/RCW23B.00.TITLE.htm
	rename "s/CHAPTER\.htm/.000.htm/" $(raw_html_dir)/*
	touch build/prepared

build/downloaded:
	rm -Rf raw 
	mkdir --parents raw
	wget --convert-links --recursive --no-directories --directory-prefix='raw' ftp://ftp.leg.wa.gov/Pub/RCW/RCW%20%2023B%20TITLE/
	mkdir --parents build
	touch build/downloaded

.PHONY: clean
clean:
	rm -Rf build
