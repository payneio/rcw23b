get:
	rm -Rf build/raw
	mkdir --parents build/raw
	wget --convert-links --recursive --no-directories --directory-prefix='build/raw' ftp://ftp.leg.wa.gov/Pub/RCW/RCW%20%2023B%20TITLE/

process_raw:
	mkdir --parents build/raw2
	cp build/raw/* build/raw2/
	rename "s/\s+//g" build/raw2/*
	mv build/raw2/RCW23BTITLE.htm build/raw2/RCW23B.00.TITLE.htm
	rename "s/CHAPTER\.htm/.000.htm/" build/raw2/*

concat:
	mkdir --parents build
	cat build/raw2/* > build/RCW_23B.html

md:
	cp --force build/RCW_23B.html build/raw.md
	iconv -f ISO-8859-1 -t UTF-8 build/raw.md > build/raw_utf8.md
	tr --squeeze-repeats "\n\r\t " " " < build/raw_utf8.md > build/single_line.md
	sed --regexp-extended --file=sed_preprocess_html build/single_line.md > build/preprocessed.md
	sed --regexp-extended --file=sed_spacing_script build/preprocessed.md > build/spaced.md
	sed --regexp-extended --file=sed_format_script build/spaced.md > RCW_23B.md

.PHONY: clean
clean:
	rm -Rf build
