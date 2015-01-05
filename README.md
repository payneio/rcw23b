RCW23B
======

The Washington Business Corporation Act governs the workings of all businesses
incorporated in the state of Washington. It can be found online here:

[WA State Legislature Website](http://apps.leg.wa.gov/RCW/default.aspx?cite=23B)

Since I am starting a WA corporation, I want to develop a better understanding of the BCA.
But, it is quite difficult since their website is constructed as a set of hundreds of 
tiny snippets of content, each to its own page. Furthermore, I would like something
I can annotate and easily search, even while offline. 

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
- [RCW 23B PDF](https://github.com/payneio/rcw23b/blob/master/dist/RCW_23B.pdf?raw=true)

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

Future Work
-----------

This was a daylong project, and I'm happy how far it has come. I now have a PDF I can read and annotate. I'd like to touch up the documents more for better legibility and indexing. There are currently many formatting glitches. Feel free to submit a pull request for anything you'd like to see fixed up are enhanced.

