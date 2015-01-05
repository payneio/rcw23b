RCW23B
======

I don't like clicking through a website to read each sentence of a long document.
I was unable to find RCW 23B anywhere as a complete document. However, I did find
the RCW is available on a public ftp server with minimal html formatting.

This Makefile and associate scripts download the entire RCW 23B, 
which is in the form of dozens of 
different html files, concatenates them into a single html document, and
generates a markdown file which can be viewed on github.

Also, you can generate a pdf if you have pandoc on your machine.


The Result
------------

If you don't care about how it's done and just want a more readale RCW 23B:

- [RCW 23B Markdown](https://github.com/payneio/rcw23b/blob/master/dist/RCW_23B.md)
- [RCW 23B PDF](https://github.com/payneio/rcw23b/blob/master/dist/RCW_23B.pdf)
- [RCW 23B HTML](https://github.com/payneio/rcw23b/blob/master/dist/RCW_23B.html)

Installation
------------

To install:

```bash
git clone https://github.com/payneio/rcw23b.git
cd rcw23b
make
```

To generate a pdf, you must have pandoc installed, then:

```bash
make dist/RCW_23B.pdf
```

Dependencies
------------

Common unix utilities:

- wget
- tr
- sed
- rename
- touch

And if you want to generate your own PDF:

- pandoc

