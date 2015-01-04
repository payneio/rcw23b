RCW23B
======

I don't like clicking through a website to read each sentence of a long document.
I was unable to find RCW 23B anywhere as a complete document. However, I did find
the RCW is available on a public ftp server with minimal html formatting.

This Makefile downloads the entire RCW 23B, which is in the form of dozens of 
different html files, and concatenates them into a single html document.

In the future, I'd like to automate the reformatting of the document into 
.md or .asciidoc format with a valid table of contents (and perhaps an index?) to
allow for easy pdf generation. In the meantime, at least it is in a single readable
document that can be searched from your browser.

To install:

```bash
git clone https://github.com/payneio/rcw23b.git
cd rcw23b
```

Then to run, simply:

```bash
make get
make process_get
make concat
make md
```

Dependencies
------------
wget

