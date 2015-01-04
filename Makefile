get:
	mkdir --parents build/raw
	wget --convert-links --recursive --no-directories --directory-prefix='build/raw' --reject='*CHAPTER.htm' ftp://ftp.leg.wa.gov/Pub/RCW/RCW%20%2023B%20TITLE/

process_raw:
	mkdir --parents build/raw2
	cp build/raw/* build/raw2/
	rename "s/\s+//g" build/raw2/*
	mv build/raw2/RCW23BTITLE.htm build/raw2/RCW23B.00.TITLE.htm

concat:
	mkdir --parents build
	cat build/raw2/* > build/RCW_23B.html

md:
	cp build/RCW_23B.html RCW_23B.md

.PHONY: clean
clean:
	rm -Rf build
